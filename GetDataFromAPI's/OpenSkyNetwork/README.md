# GetDataFromOpenSkyNetworkAPI
Os arquivos que contem os dados de login são no formato Json, abaixo alguns detalhes relevantes.

## Estrutura do Arquivo [nome.json]
> <p>Em um editor de texto digite o seu login conforme abaixo e salve com a extensão .Json; <p>
>["seu login"
>]

## Estrutura do Arquivo [nomekey.json]
> <p>Em um editor de texto digite o seu login conforme abaixo e salve com a extensão .Json;<p>
>["sua_senha"
>]

+ Obs: no script o pacote responsável por ler arquivos no formato Json é o "jsonlite"

### Manual com explicação detalhada para cada coluna do arquivo json retornado da API

 <p> Propriedades do cabeçalho do arquivo <p> 
  <div class="wy-table-responsive" wfd-id="159"><table border="1" class="docutils">
<colgroup>
<col width="16%">
<col width="11%">
<col width="73%">
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Property</th>
<th class="head">Type</th>
<th class="head">Description</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td><em>time</em></td>
<td>integer</td>
<td>The time which the state vectors in this response are associated with.
All vectors represent the state of a vehicle with the interval
<span class="math notranslate nohighlight" wfd-id="160"><span class="MathJax_Preview" style="color: inherit; display: none;" wfd-id="286"></span><span class="MathJax" id="MathJax-Element-1-Frame" tabindex="0" style="position: relative;" wfd-id="309" data-mathml="<math xmlns=&quot;http://www.w3.org/1998/Math/MathML&quot;><mo stretchy=&quot;false&quot;>[</mo><mi>t</mi><mi>i</mi><mi>m</mi><mi>e</mi><mo>&amp;#x2212;</mo><mn>1</mn><mo>,</mo><mi>t</mi><mi>i</mi><mi>m</mi><mi>e</mi><mo stretchy=&quot;false&quot;>]</mo></math>" role="presentation"><nobr aria-hidden="true"><span class="math" id="MathJax-Span-1" style="width: 8.075em; display: inline-block;" wfd-id="395"><span style="display: inline-block; position: relative; width: 6.888em; height: 0px; font-size: 117%;" wfd-id="397"><span style="position: absolute; clip: rect(1.309em, 1006.77em, 2.674em, -999.997em); top: -2.252em; left: 0em;" wfd-id="398"><span class="mrow" id="MathJax-Span-2" wfd-id="400"><span class="mo" id="MathJax-Span-3" style="font-family: MathJax_Main;" wfd-id="413">[</span><span class="mi" id="MathJax-Span-4" style="font-family: MathJax_Math-italic;" wfd-id="412">t</span><span class="mi" id="MathJax-Span-5" style="font-family: MathJax_Math-italic;" wfd-id="411">i</span><span class="mi" id="MathJax-Span-6" style="font-family: MathJax_Math-italic;" wfd-id="410">m</span><span class="mi" id="MathJax-Span-7" style="font-family: MathJax_Math-italic;" wfd-id="409">e</span><span class="mo" id="MathJax-Span-8" style="font-family: MathJax_Main; padding-left: 0.24em;" wfd-id="408">−</span><span class="mn" id="MathJax-Span-9" style="font-family: MathJax_Main; padding-left: 0.24em;" wfd-id="407">1</span><span class="mo" id="MathJax-Span-10" style="font-family: MathJax_Main;" wfd-id="406">,</span><span class="mi" id="MathJax-Span-11" style="font-family: MathJax_Math-italic; padding-left: 0.181em;" wfd-id="405">t</span><span class="mi" id="MathJax-Span-12" style="font-family: MathJax_Math-italic;" wfd-id="404">i</span><span class="mi" id="MathJax-Span-13" style="font-family: MathJax_Math-italic;" wfd-id="403">m</span><span class="mi" id="MathJax-Span-14" style="font-family: MathJax_Math-italic;" wfd-id="402">e</span><span class="mo" id="MathJax-Span-15" style="font-family: MathJax_Main;" wfd-id="401">]</span></span><span style="display: inline-block; width: 0px; height: 2.258em;" wfd-id="399"></span></span></span><span style="display: inline-block; overflow: hidden; vertical-align: -0.344em; border-left: 0px solid; width: 0px; height: 1.323em;" wfd-id="396"></span></span></nobr><span class="MJX_Assistive_MathML" role="presentation" wfd-id="394"><math xmlns="http://www.w3.org/1998/Math/MathML"><mo stretchy="false">[</mo><mi>t</mi><mi>i</mi><mi>m</mi><mi>e</mi><mo>−</mo><mn>1</mn><mo>,</mo><mi>t</mi><mi>i</mi><mi>m</mi><mi>e</mi><mo stretchy="false">]</mo></math></span></span><script type="math/tex" id="MathJax-Element-1">[time - 1, time]</script></span>.</td>
</tr>
<tr class="row-odd"><td><em>states</em></td>
<td>array</td>
<td>The state vectors.</td>
</tr>
</tbody>
</table></div>  
  

<p>Propriedade das colunas</p>


<div class="wy-table-responsive" wfd-id="157"><table border="1" class="docutils">
<colgroup>
<col width="7%">
<col width="19%">
<col width="9%">
<col width="65%">
</colgroup>
<thead valign="bottom">
<tr class="row-odd"><th class="head">Index</th>
<th class="head">Property</th>
<th class="head">Type</th>
<th class="head">Description</th>
</tr>
</thead>
<tbody valign="top">
<tr class="row-even"><td>0</td>
<td><em>icao24</em></td>
<td>string</td>
<td>Unique ICAO 24-bit address of the transponder in hex string
representation.</td>
</tr>
<tr class="row-odd"><td>1</td>
<td><em>callsign</em></td>
<td>string</td>
<td>Callsign of the vehicle (8 chars). Can be null if no callsign
has been received.</td>
</tr>
<tr class="row-even"><td>2</td>
<td><em>origin_country</em></td>
<td>string</td>
<td>Country name inferred from the ICAO 24-bit address.</td>
</tr>
<tr class="row-odd"><td>3</td>
<td><em>time_position</em></td>
<td>int</td>
<td>Unix timestamp (seconds) for the last position update. Can be
null if no position report was received by OpenSky within the
past 15s.</td>
</tr>
<tr class="row-even"><td>4</td>
<td><em>last_contact</em></td>
<td>int</td>
<td>Unix timestamp (seconds) for the last update in general. This
field is updated for any new, valid message received from the
transponder.</td>
</tr>
<tr class="row-odd"><td>5</td>
<td><em>longitude</em></td>
<td>float</td>
<td>WGS-84 longitude in decimal degrees. Can be null.</td>
</tr>
<tr class="row-even"><td>6</td>
<td><em>latitude</em></td>
<td>float</td>
<td>WGS-84 latitude in decimal degrees. Can be null.</td>
</tr>
<tr class="row-odd"><td>7</td>
<td><em>baro_altitude</em></td>
<td>float</td>
<td>Barometric altitude in meters. Can be null.</td>
</tr>
<tr class="row-even"><td>8</td>
<td><em>on_ground</em></td>
<td>boolean</td>
<td>Boolean value which indicates if the position was retrieved from
a surface position report.</td>
</tr>
<tr class="row-odd"><td>9</td>
<td><em>velocity</em></td>
<td>float</td>
<td>Velocity over ground in m/s. Can be null.</td>
</tr>
<tr class="row-even"><td>10</td>
<td><em>true_track</em></td>
<td>float</td>
<td>True track in decimal degrees clockwise from north (north=0°).
Can be null.</td>
</tr>
<tr class="row-odd"><td>11</td>
<td><em>vertical_rate</em></td>
<td>float</td>
<td>Vertical rate in m/s. A positive value indicates that the
airplane is climbing, a negative value indicates that it
descends. Can be null.</td>
</tr>
<tr class="row-even"><td>12</td>
<td><em>sensors</em></td>
<td>int[]</td>
<td>IDs of the receivers which contributed to this state vector.
Is null if no filtering for sensor was used in the request.</td>
</tr>
<tr class="row-odd"><td>13</td>
<td><em>geo_altitude</em></td>
<td>float</td>
<td>Geometric altitude in meters. Can be null.</td>
</tr>
<tr class="row-even"><td>14</td>
<td><em>squawk</em></td>
<td>string</td>
<td>The transponder code aka Squawk. Can be null.</td>
</tr>
<tr class="row-odd"><td>15</td>
<td><em>spi</em></td>
<td>boolean</td>
<td>Whether flight status indicates special purpose indicator.</td>
</tr>
<tr class="row-even"><td>16</td>
<td><em>position_source</em></td>
<td>int</td>
<td>Origin of this state’s position: 0 = ADS-B, 1 = ASTERIX, 2 = MLAT</td>
</tr>
</tbody>
</table></div>

<a href="https://opensky-network.org/apidoc/rest.html#response"><span class="std std-ref" wfd-id="114">Para mais informações consulte a documentação oficial no link</span></a>
