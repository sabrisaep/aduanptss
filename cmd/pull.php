<?php
exec('pull.bat', $output);
echo '<pre>', print_r($output);
