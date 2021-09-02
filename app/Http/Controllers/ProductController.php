<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\AuthorsProduct;
use App\Models\TagsProduct;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;

class ProductController extends Controller
{
    public function get()
    {
        return Product::get();
    }

    public function show($id)
    {
        $book = Product::with('authors', 'tags', 'cover')->find($id);
        return $book;
    }

    public function create(Request $request)
    {
        [
            'title' => $title,
            'subcategorySlug' => $subcategorySlug,
            'description' => $description,
            'price' => $price,
            'year' => $year,
            'pages' => $pages,
            'authors' => $authors,
            'tags' => $tags,
            'cover' => $cover,
        ] = $request;

        $authors = json_decode($authors);
        $tags = json_decode($tags);
        $authorsIds = array_map(function ($a) {
            return $a->id;
        }, $authors);
        $authorsTitles = array_map(function ($a) {
            return $a->title;
        }, $authors);

        $currentYear = date('Y');
        $request->validate([
            'title' => ['required', 'string', 'max:255', 'unique:products,title'],
            'subcategorySlug' => ['required', 'string', 'max:255', 'exists:subcategories,slug'],
            'description' => ['required', 'string'],
            'price' => ['required', 'integer'],
            'cover' => ['required', 'integer'],
            'year' => ['required', 'integer', 'digits:4', "between:1900,{$currentYear}"],
            'pages' => ['required', 'integer'],
            'authors' => ['required', 'json'],
            'tags' => ['required', 'json'],
            'picture' => 'nullable|image',
        ]);



        Validator::make(['authors' => $authorsTitles, 'tags' => $tags], [
            'authors' => ['required', 'array'],
            'authors.*' => ['required', 'distinct', 'exists:authors,title'],
            'tags' => ['required', 'array'],
            'tags.*' => ['required', 'distinct', 'exists:tags,id'],
        ])->validate();

        $filename = '';
        $thumbFilename = '';
        $picturesNames = [];
        if ($request->hasFile('picture')) {
            $file = $request->file('picture');
            $filename = time() . $file->getClientOriginalName();
            $request->file('picture')->storeAs('public/img', $filename);
            $thumbnail = Image::make($file);
            $thumbnail->resize(194, null, function ($constraint) {
                $constraint->aspectRatio();
            });
            $thumbFilename = time() . '_thumbnail_' . $file->getClientOriginalName();
            $thumbnail->save('storage/img/' . $thumbFilename, 100);
            $picturesNames[] = $filename;
        }


        $picturesFiles = $request->allFiles();
        if (array_key_exists('images', $picturesFiles) && gettype($picturesFiles['images']) === 'array') {;
            foreach ($picturesFiles['images'] as $file) {
                $validator = Validator::make(['file' => $file], [
                    'file' => ['nullable', 'image'],
                ]);
                if (!$validator->fails()) {
                    $name = time() . $file->getClientOriginalName();
                    $file->storeAs('public/img', $name);
                    $picturesNames[] = $name;
                }
            }
        }


        $pictures = json_encode($picturesNames);

        $product = Product::create([
            'title' => $title,
            'subcategory_slug' => $subcategorySlug,
            'picture' => $thumbFilename,
            'pictures' => $pictures,
            'price' => $price,
            'description' => $description,
            'year' => $year,
            'pages' => $pages,
            'cover_id' => $cover,
        ]);

        $product->authors()->attach($authorsIds);
        $product->tags()->attach($tags);

        return $product;
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        TagsProduct::where('product_id', $id)->delete();
        AuthorsProduct::where('product_id', $id)->delete();
        Product::find($id)->delete();
    }

    public static function carousel()
    {
        // DB::listen(function ($query) {
        //     var_dump($query->sql, $query->bindings);
        // });
        $products = Product::with('authors')
            ->orderBy('created_at', 'desc')
            ->limit(10)
            ->get();

        return $products;
    }

    public function getReviews($productId)
    {
        return Product::find($productId)->reviews()->with('user')->get();
    }
}
