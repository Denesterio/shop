<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\AuthorsProduct;
use App\Models\TagsProduct;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Services\FileUploader;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        // DB::listen(function ($query) {
        //     var_dump($query->sql, $query->bindings);
        // });
        if ($request['_limit']) {
            return Product::with('authors', 'tags')->OrderBy('id', 'desc')->paginate($request['_limit']);
        }

        return Product::with('authors', 'tags')->OrderBy('id', 'desc')->get();
    }

    public function show($id)
    {
        $book = Product::with('authors', 'tags', 'cover')->find($id);
        return $book;
    }

    public function store(StoreProductRequest $request, FileUploader $fileUploader)
    {
        $validated = $request->validated();

        $thumbFilename = '';
        $picturesNames = [];
        if ($request->hasFile('picture')) {
            $file = $request->file('picture');
            [$filename, $thumb] = $fileUploader->saveThumbnail($file);
            $thumbFilename = $thumb;
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

    public function update(UpdateProductRequest $request, Product $product, FileUploader $fileUploader)
    {
        $validated = $request->validated();

        $thumbFilename = '';
        $picturesNames = [];
        if ($request->hasFile('picture')) {
            $file = $request->file('picture');
            [$filename, $thumb] = $fileUploader->saveThumbnail($file);
            $thumbFilename = $thumb;
            $picturesNames[] = $filename;
        } else if (Str::contains($validated['picture'], '_thumbnail_')) {
            $thumbFilename = $validated['picture'];
        }

        $pictures = '';
        if (count($request['images']) > 0 && gettype($request['images'][0]) === 'string') {
            $pictures = $request['images'];
        } else {
            foreach ($request['images'] as $file) {
                $name = $fileUploader->uploadImage($file);
                $picturesNames[] = $name;
                $pictures = json_encode($picturesNames);
            }
        }

        $product->fill([
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

        $product->authors()->sync($authorsIds);
        $product->tags()->sync($validated['tags']);

        $product->save();

        return $product;
    }

    public function destroy(Product $product)
    {
        TagsProduct::where('product_id', $product->id)->delete();
        AuthorsProduct::where('product_id', $product->id)->delete();
        $product->delete();
    }

    // public function getReviews($productId)
    // {
    //     return Product::find($productId)->reviews()->with('user')->get();
    // }
}
