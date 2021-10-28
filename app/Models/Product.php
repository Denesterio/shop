<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Product extends Model
{
    use HasFactory;
    use Searchable;

    public function toSearchableArray()
    {
        $array = $this->toArray();

        return array('id' => $array['id'], 'title' => $array['title']);
    }

    protected $fillable = [
        'title',
        'subcategory_slug',
        'picture',
        'pictures',
        'description',
        'price',
        'pages',
        'year',
        'cover_id',
    ];

    protected $casts = [
        'images' => 'array',
    ];

    public function authors()
    {
        return $this->belongsToMany(Author::class, 'authors_products');
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'tags_products');
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class);
    }

    public function cover()
    {
        return $this->belongsTo(Cover::class);
    }
}
