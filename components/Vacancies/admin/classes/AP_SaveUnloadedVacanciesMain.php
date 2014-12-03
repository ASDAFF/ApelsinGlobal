<?php
/**
 * Description of AP_SaveUnloadedVacanciesMain
 *
 * @author olga
 */
class AP_SaveUnloadedVacanciesMain {
    
    private $form;
    private $dir = './resources/Components/Vacancies/';
    private $fileName = 'Job.xml';
    private $mysqlFromFile;

    public function __construct() {
        $this->mysqlFromFile = new AP_VacanciesValidInserFromFile($this->dir, $this->fileName);
        $this->saveUnloadedFile();
        $this->form .= $this->mysqlFromFile->getList();
    }

    private function getForm() {
        $urlHelper = new UrlHelper();
        $this->form = "";
        $this->form .= '<form class="AP_Form" name="AP_Form" enctype="multipart/form-data" action="'.$urlHelper->getThisPage().'" method="POST" accept - charset="UTF-8">';
            $this->form .= '<table class="AP_FormTable">';
                $this->form .= '<tr>';
                    $this->form .= '<td class="FormTable_Text">';
                        $this->form .= '<div class="text">* Восстановить выгрузку</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<select   class="fileServis" name="fileServis" id="fileServisget" required >';
                        $this->getFileData();
                        $this->form .= '</select>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<div class="text">Сделать бэкап файла</div>';
                    $this->form .= '</td>';
                    $this->form .= '<td class="FormTable_Input">';
                        $this->form .= '<center><input type="checkbox" name="checkBackUp" id="checkBackUp" value="1" checked style="vertical-align:middle;"></center>';
                    $this->form .= '</td>';
                $this->form .= '</tr>';
            $this->form .= '</table>';
            $this->form .= '<center><input class="AP_Submit" type="submit" name="AP_Submit" value="Восстановить"></center>';
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
            foreach (array_keys($files) as $key ) {
                $this->form .= '<option value="'.$key.'">'.$key.'</option>';
            }
        }
    }
    
    private function renameFileOld() {
        $file = $this->dir.$this->fileName;
        if (isset($_POST['checkBackUp']) && $_POST['checkBackUp'] != null && $_POST['checkBackUp'] != '') {
            if(file_exists($file)) {
                rename($file, $this->dir.date('Y-m-d H:i:s')." - ".$this->fileName);
            }
        } else {
            unlink($file);
            echo "Cтарого файла нет".$file;
        }
    }
    
    private function copyFile($oldfile) {
        $file = $this->dir.$oldfile;
        if(file_exists($file)) {
            if (!copy($file, $this->dir.$this->fileName)) {
                echo "не удалось скопировать ".$file; 
            }
        } 
    }
    
    private function recoverFile() {
        if (isset($_POST['AP_Submit']) && $_POST['AP_Submit'] != null && $_POST['AP_Submit'] != '') {
            if (isset($_POST['fileServis']) && $_POST['fileServis'] != null && $_POST['fileServis'] != '') {
                $file = $_POST['fileServis'];
                $this->renameFileOld();
                $this->copyFile($file);
                $this->mysqlFromFile->insertToMysql();
            } else {
                echo "Файл для восстановления не выбран"; 
            }
        } else {
            echo "Файл для восстановления не выбран"; 
        }
    }
    
    private function saveUnloadedFile() {
        if ($this->scandirFileData()) {
            $this->getForm();
            $this->recoverFile();
            $this->getForm();
        } else {
            echo "Файл для восстановления не найдены"; 
        }
    }

    public function getHtml() {
        return $this->form;
    }
}