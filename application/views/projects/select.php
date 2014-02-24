<h2 class="sub-header">Proyectos
<a href="?action=insert" class="btn btn-info pull-right">
<i class="glyphicon glyphicon-plus"></i> A&ntilde;adir proyecto</a>
</h2>

<table class="table table-striped">
<thead>
                <tr>
                  <th>Id</th>
                  <th>Nombre</th>
                  <th>Alias</th>
                  <th>Fecha Inicio</th>
                  <th>Fecha Fin</th>
                  <th>Estado</th>
                  <th>Empresa</th>
                  <th>Desc. breve</th>
                  <th>Desc. larga</th>
                  <th>Acciones</th>
                </tr>
              </thead>
<?php foreach($rows as $key => $row):	?>
	<tr>
		<?php
		foreach($row as $column):?>
			<td><?=$column;?></td>
		<?php endforeach; ?>
		<td nowrap>
			<a class="btn btn-info" href="?action=update&id=<?=$row['idproject'];?>"><i class="glyphicon glyphicon-pencil"></i></a>
			<a class="btn btn-danger" href="?action=delete&id=<?=$row['idproject'];?>"><i class="glyphicon glyphicon-remove"></i></a>
		</td>
	</tr>
<?php endforeach;?>
</table>