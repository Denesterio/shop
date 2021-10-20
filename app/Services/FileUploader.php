<?php

namespace App\Services;

use Intervention\Image\Facades\Image;

final class FileUploader
{
    const THUMBNAIL_WIDTH = 194;
    /**
     * Save file to storage and return filename.
     *
     * @return string
     */
    public function uploadImage($file)
    {
        $filename = time() . $file->getClientOriginalName();
        $file->storeAs('public/img', $filename);
        return $filename;
    }

    public function uploadThumbnail($file)
    {
        $thumbnail = Image::make($file);
        $thumbnail->resize(self::THUMBNAIL_WIDTH, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $thumbFilename = time() . '_thumbnail_' . $file->getClientOriginalName();
        $thumbnail->save('storage/img/' . $thumbFilename, 100);
        return $thumbFilename;
    }
}
