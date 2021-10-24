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
        $filename = $this->getFilename($file);
        $file->storeAs('public/img', $filename);
        return $filename;
    }

    public function uploadThumbnail($file)
    {
        $thumbnail = Image::make($file);
        $thumbnail->resize(self::THUMBNAIL_WIDTH, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $thumbFilename = $this->getThumbnailName($file);
        $thumbnail->save('storage/img/' . $thumbFilename, 80);
        return $thumbFilename;
    }

    public function getFilename($file)
    {
        return time() . '_' . $file->getClientOriginalName();
    }

    private function getThumbnailName($file)
    {
        return time() . '_thumbnail_' . $file->getClientOriginalName();
    }

    public function saveThumbnail($file)
    {
        $filename = $this->uploadImage($file);
        $thumbFilename = $this->uploadThumbnail($file);
        return [$filename, $thumbFilename];
    }
}
