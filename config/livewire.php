<?php

return [
    'temporary_file_upload' => [
        'disk' => 'public',
        'rules' => 'file|mimes:png,jpg,jpeg,gif,svg,bmp,ico|max:12288',
    ],
];
