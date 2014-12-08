<?php
/**
 * Description of AP_DownloadFileMain
 *
 * @author olga
 */
class AP_DownloadFileMain {
    
    private $form;
    private $dir;
    private $fileName = 'service_centers.xml';

    public function __construct() {
        $this->dir= './resources/Components/ServiceCenters/';
        $this->getForm();
        $this->uploadFile();
    }

    private function getForm() {
        $this->form = "";
        $this->form .= '<form class="AP_Form" name="AP_Form" enctype="multipart/form-data" action="./adminpanel/rus/components/ServiceCenters/element/downloadFile/" method="POST" accept - charset="UTF-8" required >';
            $this->form .= '<table class="AP_FormTable">';
                $this->form .= '<tr>';
                    $this->form .= '<td class="FormTable_Text">';
                        $this->form .= '<div class="text">* Загрузить файл</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<input type="file" class="fileServis" name="fileServis" id="fileServisget">';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<div class="text">Сделать бэкап файла</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<center><input type="checkbox" name="checkBackUp" id="checkBackUp" value="1" checked style="vertical-align:middle;"></center>';
                    $this->form .= '</td>';
                $this->form .= '</tr>';
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Загрузить"></center>';
        $this->form .= '</form>';
    }
    
    private function uploadFile() {
        if (isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != null && $_POST['AP_Submit'] != '') {
            // Проверяем загружен ли файл
            if(is_uploaded_file($_FILES["fileServis"]["tmp_name"])) {
              // Если файл загружен успешно, перемещаем его из временной директории в конечную
                $this->renameFileOld($this->dir);
                move_uploaded_file($_FILES["fileServis"]["tmp_name"], $this->dir.  $this->fileName);
            } else {
               echo("Ошибка загрузки файла");
            }
        } else {
            echo "Выберите файл";
        }
    }
    
    private function renameFileOld($dir) {
        $file = $dir.$this->fileName;
        if(file_exists($file)) {
            if (isset($_POST['checkBackUp']) && $_POST['checkBackUp'] != null && $_POST['checkBackUp'] != '') {
                rename($file, $dir.date('Y-m-d H:i:s')." - ".$this->fileName);
            } else {
                unlink($file);
            }
        } else {
                echo "Cтарого файла нет";
        }
    }
    
    public function getHtml() {
        return $this->form;
        
    }
}