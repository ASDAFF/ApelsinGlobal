<div id="noPrintPage" class="mapsSelector">
    <select onchange="ShowMap()" id="ContactsMapSelector">
        <option value="1">Схематичная карта</option>
        <option value="2">Яндекс карта - Рязань</option>
        <option value="3">Яндекс карта - Луховицы</option>
    </select>
</div>
<div id="ContactsMapBox1" class="map1" style="display: block;">
    <?php
    include_once './modules/map/classes/Map.php';
    $map = new Map();
    $map->get();
    ?>
</div>

<div id="ContactsMapBox2" class="map2" style="display: none;">
    <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=G4qvww00zci9qzPU-zNS4BsDRl-wr5jq&width=960&height=400"></script>
</div>

<div id="ContactsMapBox3" class="map3" style="display: none;">
    <script type="text/javascript" charset="utf-8" src="//api-maps.yandex.ru/services/constructor/1.0/js/?sid=mw6tW_2WykNcJf17gcdzYkWq8-7yAou9&width=960&height=400"></script>
</div>


