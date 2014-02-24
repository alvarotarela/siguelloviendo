<h2>Confirmar borrado</h2>

<form method="post" enctype="multipart/form-data">

<div class="form-group">
<label>ID: </label>
<?=$_GET['id'];?>
<input type="hidden" name="idproject" value="<?=$_GET['id'];?>"/>
</div>

<div class="form-group">
<label>Alias:</label>
<?=isset($project['alias'])?$project['alias']:'';?>
</div>

<div class="form-group">
<label>Proyecto:</label>
<?=isset($project['name'])?$project['name']:'';?>
</div>

<div class="form-group">
<label>Borrar: </label>
<input type="submit" name="Borrar" value="NO" class="btn btn-info"/>
<input type="submit" name="Borrar" value="SI" class="btn btn-warning"/>
</div>

</form>