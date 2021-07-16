<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'subcategory_slug',
        'picture',
        'description',
        'price',
    ];

    public function authors()
    {
        return $this->belongsToMany(Author::class, 'authors_products');
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'tags_products');
    }
}
