<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\AuthorsProduct;
use App\Models\TagsProduct;
use App\Http\Requests\StoreProductRequest;
use App\Services\FileUploader;

class ProductController extends Controller
{
    public function get()
    {
        return Product::OrderBy('id', 'desc')->paginate(20);
    }

    public function show($id)
    {
        $book = Product::with('authors', 'tags', 'cover')->find($id);
        return $book;
    }

    public function create(StoreProductRequest $request, FileUploader $fileUploader)
    {
        $validated = $request->validated();

        $thumbFilename = '';
        $picturesNames = [];
        if ($request->hasFile('picture')) {
            $file = $request->file('picture');
            $filename = $fileUploader->uploadImage($file);
            $thumbFilename = $fileUploader->uploadThumbnail($file);
            $picturesNames[] = $filename;
        }

        $picturesFiles = $request->allFiles();
        if (array_key_exists('images', $picturesFiles) && gettype($picturesFiles['images']) === 'array') {
            foreach ($picturesFiles['images'] as $file) {
                $name = $fileUploader->uploadImage($file);
                $picturesNames[] = $name;
            }
        }

        $pictures = json_encode($picturesNames);

        $product = Product::create([
            'title' => $validated['title'],
            'subcategory_slug' => $validated['subcategorySlug'],
            'picture' => $thumbFilename,
            'pictures' => $pictures,
            'price' => $validated['price'],
            'description' => $validated['description'],
            'year' => $validated['year'],
            'pages' => $validated['pages'],
            'cover_id' => $validated['cover'],
        ]);

        $authorsIds = array_map(function ($a) {
            return $a->id;
        }, $validated['authors']);

        $product->authors()->attach($authorsIds);
        $product->tags()->attach($validated['tags']);

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
