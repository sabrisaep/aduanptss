<?php // content="text/plain; charset=utf-8"
require_once('src/jpgraph.php');
require_once('src/jpgraph_bar.php');

require 'conn.php';

$tahun1 = date('Y');
$tahun0 = $tahun1 - 1;

$sql = "SELECT COUNT(idaduan) jumlah FROM aduan
        WHERE status != 'Selesai' AND YEAR(tarikhterima) = $tahun1";
$row = $conn->query($sql)->fetch_object();
$t1['takselesai'] = $row->jumlah;
$sql = "SELECT COUNT(idaduan) jumlah FROM aduan
        WHERE status = 'Selesai' AND YEAR(tarikhterima) = $tahun1";
$row = $conn->query($sql)->fetch_object();
$t1['selesai'] = $row->jumlah;
$t1['semua'] = $t1['takselesai'] + $t1['selesai'];

$sql = "SELECT COUNT(idaduan) jumlah FROM aduan
        WHERE status != 'Selesai' AND YEAR(tarikhterima) = $tahun0";
$row = $conn->query($sql)->fetch_object();
$t0['takselesai'] = $row->jumlah;
$sql = "SELECT COUNT(idaduan) jumlah FROM aduan
        WHERE status = 'Selesai' AND YEAR(tarikhterima) = $tahun0";
$row = $conn->query($sql)->fetch_object();
$t0['selesai'] = $row->jumlah;
$t0['semua'] = $t0['takselesai'] + $t0['selesai'];

$data1y = [
    $t1['takselesai'],
    $t1['selesai'],
    $t1['semua'],
];
$data2y = [
    $t0['takselesai'],
    $t0['selesai'],
    $t0['semua'],
];


// Create the graph. These two calls are always required
$graph = new Graph(1100, 350, 'auto');
$graph->SetScale("textlin");

$theme_class = new UniversalTheme;
$graph->SetTheme($theme_class);

#$graph->Set90AndMargin(190, 40, 60, 40); // kalau letak title
$graph->Set90AndMargin(190, 40, 40, 40);
#$graph->img->SetAngle(90);

#$graph->yaxis->SetTickPositions(array(0,30,60,90,120,150), array(15,45,75,105,135));
$graph->SetBox(false);


$label = [
    'Aduan Dalam Tindakan',
    'Aduan Diselesaikan',
    'Aduan Diterima/Baru',
];
$graph->xaxis->SetTickLabels($label);
$graph->ygrid->SetFill(false);
$graph->yaxis->HideLine(false);
$graph->yaxis->HideTicks(false, false);

$graph->xaxis->SetFont(FF_ARIAL, FS_NORMAL, 11);
$graph->yaxis->SetFont(FF_ARIAL, FS_NORMAL, 11);

// Create the bar plots
$b1plot = new BarPlot($data1y);
$b2plot = new BarPlot($data2y);

$graph->legend->SetPos(0.5, 0.97, 'center', 'bottom');
$graph->legend->SetLayout(10);
$graph->legend->SetFont(FF_ARIAL, FS_NORMAL, 11);
$b1plot->SetLegend($tahun1);
$b2plot->SetLegend($tahun0);

// Create the grouped bar plot
$gbplot = new GroupBarPlot(array($b1plot, $b2plot));
// ...and add it to the graPH
$graph->Add($gbplot);

$b1plot->value->show();
$b1plot->value->SetFormat('%d');
$b1plot->value->SetFont(FF_ARIAL, FS_NORMAL, 11);
$b2plot->value->show();
$b2plot->value->SetFormat('%d');
$b2plot->value->SetFont(FF_ARIAL, FS_NORMAL, 11);

$b1plot->SetColor("white");
$b1plot->SetFillColor("#cc1111");

$b2plot->SetColor("white");
$b2plot->SetFillColor("#11cccc");

/*
$graph->title->Set("Maklum Balas Aduan Pelanggan");
$graph->title->SetFont(FF_ARIAL, FS_BOLD, 14);
*/

// Display the graph
$graph->Stroke();
