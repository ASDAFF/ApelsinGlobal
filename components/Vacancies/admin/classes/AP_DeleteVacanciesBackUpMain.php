<?php
/**
 * Description of AP_DeleteVacanciesBackUpMain
 *
 * @author olga
 */
class AP_DeleteVacanciesBackUpMain {
    
    private $form;
    private $dir = './resources/Components/Vacancies/';

    public function __construct() {
        $this->deleteFileBackUp();
    }

    private function getForm() {
        $urlHelper = new UrlHelper();
        $this->form = "";
        $this->form .= '<form class="AP_Form" name="AP_Form" enctype="multipart/form-data" action="'.$urlHelper->getThisPage().'" method="POST" accept - charset="UTF-8" required >';
            $this->form .= '<table class="AP_FormTable">';
            $this->getFileData();
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Удалить"></center>';
        $this->form .= '</form>';
    }
    
    private function scandirFileData() {
        $files = array(); 
        foreach (scandir($this->dir) as $file) {
            if (filetype($this->dir.$file) == "file") {
                $files[$file] = filemtime($this->dir.$file);
            }
            clearstatcache();
        } 
        return (count($files) > 1) ? $files : null;
    }
    
    private function getFileData(){
        $files = $this->scandirFileData();
        if ($files != null) {
            arsort($files); 
            array_shift($files);
            foreach (array_keys($files)as $key ) {
                $this->form .= '<tr>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<div class="text">Файл для удаления</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<div class="text">"'.$key.'"</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<center><input type="checkbox" name="checkBackUp[]" id="checkBackUp" value="'.$key.'" style="vertical-align:middle;"></center>';
                    $this->form .= '</td>';
                $this->form .= '</tr>';
            }
        }
    }
    
    private function deleteFileOld() {
        if (isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != null && $_POST['AP_Submit'] != '') {
            if (isset($_POST['checkBackUp']) && $_POST['checkBackUp'] != null && $_POST['checkBackUp'] != '') {
                $arrFile = $_POST['checkBackUp'];
                if ($arrFile != null) {
                    foreach (array_values($arrFile) as $file) {
                        unlink($this->dir.$file);
                    }
                } else {
                    echo "Файл для удаления не выбран"; 
                }
            } else {
                echo "Выберите файл";
            }
        } else {
            echo "Файл для удаления не выбран"; 
        }
    }
    
    private function deleteFileBackUp() {
        if ($this->scandirFileData()) {
            $this->getForm();
            $this->deleteFileOld();
            $this->getForm();
        } else {
            echo "Файл для удаления не найдены"; 
        }
    }

    public function getHtml() {
        return $this->form;
    }
}