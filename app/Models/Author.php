<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Author extends Model
{
    use HasFactory;
    use Searchable;

    protected $fillable = [
        'title',
    ];

    public function toSearchableArray()
    {
        $array = $this->toArray();

        return array('id' => $array['id'], 'title' => $array['title']);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'authors_products');
    }
}
