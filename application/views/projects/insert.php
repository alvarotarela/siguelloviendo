<h2>
<?=isset($_GET['id'])?'Actualizar proyecto':'A&ntilde;adir proyecto';?>
</h2>

<form method="post" enctype="multipart/form-data" class="form-horizontal">

<input type="hidden" name="idproject" value="<?=isset($_GET['id'])?$_GET['id']:'';?>"/>

<div class="form-group">
<label>Alias</label><br>
	<input type="text" name="alias" value="<?=isset($project['alias'])?$project['alias']:'';?>"/>
</div>

<div class="form-group">
<label>Nombre</label><br>
<input type="text" name="name" value="<?=isset($project['name'])?$project['name']:'';?>"/>
</div>

<div class="form-group">
<label>Fecha inicio</label><br>
<input type="date" name="date_ini" value="<?=isset($project['date_ini'])?$project['date_ini']:'';?>"/>
</div>

<div class="form-group">
<label>Fecha fin</label><br>
<input type="date" name="date_fini" value="<?=isset($project['date_fini'])?$project['date_fini']:'';?>"/>
</div>

<div class="form-group">
<label>Estado</label><br>
<select name="statuses_idstatuses">
	<?php $key=0; ?>
	<?php $duties=array('Duty 1','Duty 2');?>
	<?php foreach ($duties as $key => $duty): ?>
	<option value="<?=$key+1?>"><?=$duty;?></option>
	<?php endforeach;?>
</select>
</div>

<div class="form-group">
<label>Empresa</label><br>
<select name="companies_idcompany">
	<?php $key=0; ?>
	<?php $tmp_company=array('AT Servicios','Otra');?>
	<?php foreach ($tmp_company as $key => $tmp_company_name): ?>
	<option value="<?=$key+1;?>"
	<?=(isset($project['companies_idcompany'])&&($key+1 == $project['companies_idcompany']))?'selected':'';?>><?=$tmp_company_name;?></option>
	<?php endforeach;?>
</select>
</div>

<div class="form-group">
<label>Equipo</label><br>
<select name="team">
	<?php $key=0;?>
	<?php $users=array('User 1','User 2');?>
	<?php foreach ($users as $key => $user): ?>
	<option value="<?=$key+1?>"><?=$user;?></option>
	<?php endforeach;?>
</select>
</div>


<div class="form-group">
<label>Descripci&oacute;n breve</label><br>
<input type="text" name="tweet" value="<?=isset($project['tweet'])?$project['tweet']:'';?>"/>
</div>

<div class="form-group">
<label>Descripci&oacute;n larga</label><br>
<textarea rows="3" cols="40" name="description"><?=isset($project['description'])?$project['description']:'';?></textarea>
</div>

<div class="form-group">
<input type="reset" name="Borrar"  class="btn btn-default"/>
<input type="submit" name="Enviar" class="btn btn-info"/>
</div>


</form>