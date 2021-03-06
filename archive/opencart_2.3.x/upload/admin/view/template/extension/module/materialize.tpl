<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="button" form="form-materialize" id="apply-btn" data-toggle="tooltip" title="<?php echo $button_apply; ?>" class="btn btn-success"><i class="fa fa-repeat"></i></button>
				<button type="submit" form="form-materialize" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>&nbsp;
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $materialize_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $materialize_title; ?></h3></div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" data-action="<?php echo $apply; ?>" method="post" enctype="multipart/form-data" id="form-materialize" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?>:</label>
						<div class="col-sm-10">
							<select name="module_materialize_status" id="input-status" class="form-control">
								<?php if ($module_materialize_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<br>
					<ul class="nav nav-tabs" id="apply-tab">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_colors; ?></a></li>
						<li><a href="#tab-footer" data-toggle="tab"><?php echo $tab_footer; ?></a></li>
						<li><a href="#tab-product" data-toggle="tab"><?php echo $tab_product; ?></a></li>
						<li><a href="#tab-map" data-toggle="tab"><?php echo $tab_map; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<fieldset>
								<legend><?php echo $entry_colors; ?></legend>
								<div class="alert alert-info"><i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $help_colors; ?></div>
								<div class="row">
									<div class="col-sm-2">
										<ul class="nav nav-pills nav-stacked" id="tab-colors">
											<li><a href="#tab-color-common" data-toggle="tab"><?php echo $tab_common; ?></a></li>
											<li><a href="#tab-color-header" data-toggle="tab"><?php echo $tab_header; ?></a></li>
											<li><a href="#tab-color-footer" data-toggle="tab"><?php echo $tab_footer; ?></a></li>
										</ul>
									</div>
									<div class="col-sm-10">
										<div class="tab-content">
											<div class="tab-pane" id="tab-color-common">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#tab-color-common__buttons" data-toggle="tab"><?php echo $tab_buttons; ?></a></li>
													<li><a href="#tab-color-common__mobile" data-toggle="tab"><?php echo $tab_mobile; ?></a></li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="tab-color-common__buttons">
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_background; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_background" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_background) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_cart_btn; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_cart_btn" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_cart_btn) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_cart_btn_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_cart_btn_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_total_btn; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_total_btn" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_total_btn) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_total_btn_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_total_btn_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_compare_btn; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_compare_btn" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_compare_btn) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_compare_btn_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_compare_btn_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_tot_cmp_btn; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_compare_total_btn" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_compare_total_btn) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_compare_total_btn_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_compare_total_btn_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_btt_btn; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_btt_btn" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_btt_btn) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_btt_btn_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_btt_btn_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
													</div>
													<div class="tab-pane" id="tab-color-common__mobile">
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_bar; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_browser_bar" id="select-color-browser-bar" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_browser_bar) { ?>
																	<option value="<?php echo $color['name']; ?>" data-hex="#<?php echo $color['hex']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" data-hex="#<?php echo $color['hex']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<input type="hidden" name="module_materialize_color_browser_bar_hex" value="<?php echo isset($module_materialize_color_browser_bar_hex) ? $module_materialize_color_browser_bar_hex : ''; ?>" id="input-color-browser-bar-hex" />
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_nav_btn; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_nav_btn" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_nav_btn) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_nav_btn_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_nav_btn_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane" id="tab-color-header">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#tab-color-header__desktop" data-toggle="tab"><?php echo $tab_desktop; ?></a></li>
													<li><a href="#tab-color-header__mobile" data-toggle="tab"><?php echo $tab_mobile; ?></a></li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="tab-color-header__desktop">
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_top_menu; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_top_menu" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_top_menu) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_top_menu_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_top_menu_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_header; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_header" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_header) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_header_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_header_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_navigation; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_navigation" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_navigation) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_navigation_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_navigation_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_search; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_search" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_search) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
													</div>
													<div class="tab-pane" id="tab-color-header__mobile">
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_sidebar; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_sidebar" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_sidebar) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_sidebar_text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_sidebar_text) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_mob_search; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_mobile_search" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_mobile_search) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane" id="tab-color-footer">
												<ul class="nav nav-tabs">
													<li class="active"><a href="#tab-color-footer__common" data-toggle="tab"><?php echo $tab_common; ?></a></li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="tab-color-footer__common">
														<div class="form-group">
															<label class="col-sm-2 control-label"><?php echo $entry_footer; ?>:</label>
															<div class="col-sm-4">
																<select name="module_materialize_color_footer" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_footer) { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<select name="module_materialize_color_footer_text" id="input-color-footer-text" class="selectpicker show-tick">
																	<?php foreach ($module_materialize_colors_text as $color) { ?>
																	<?php if ($color['name'] == $module_materialize_color_footer_text) { ?>
																	<option value="<?php echo $color['name']; ?>" data-hex="#<?php echo $color['hex']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;" selected="selected"><?php echo $color['name']; ?></option>
																	<?php } else { ?>
																	<option value="<?php echo $color['name']; ?>" data-hex="#<?php echo $color['hex']; ?>" class="<?php echo $color['name']; ?>" style="background: #<?php echo $color['hex']; ?>;"><?php echo $color['name']; ?></option>
																	<?php } ?>
																	<?php } ?>
																</select>
																<input type="hidden" name="module_materialize_color_footer_text_sn" value="<?php echo isset($module_materialize_color_footer_text_sn) ? $module_materialize_color_footer_text_sn : ''; ?>" id="input-color-footer-text-hex" />
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane" id="tab-footer">
							<fieldset>
								<legend><?php echo $entry_description; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_title; ?>:</label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>"/></span>
											<input type="text" name="module_materialize[<?php echo $language['language_id']; ?>][footer_title]" value="<?php echo isset($module_materialize[$language['language_id']]) ? $module_materialize[$language['language_id']]['footer_title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_description; ?>:</label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>"/></span>
											<textarea name="module_materialize[<?php echo $language['language_id']; ?>][footer_description]" rows="5" placeholder="<?php echo $entry_description; ?>" class="form-control" style="min-height:100px;resize:vertical;"><?php echo isset($module_materialize[$language['language_id']]) ? $module_materialize[$language['language_id']]['footer_description'] : ''; ?></textarea>
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_contact; ?>:</label>
									<div class="col-sm-10">
										<select name="module_materialize_footer_contact" class="form-control">
											<?php if ($module_materialize_footer_contact) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
							<fieldset>
								<legend><?php echo $entry_socials; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?>:</label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>"/></span>
											<input type="text" name="module_materialize[<?php echo $language['language_id']; ?>][sn_text]" value="<?php echo isset($module_materialize[$language['language_id']]) ? $module_materialize[$language['language_id']]['sn_text'] : ''; ?>" placeholder="<?php echo $entry_text; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_socials; ?>:</label>
									<div class="col-sm-10">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<td class="text-left" style="width: 30%;"><?php echo $entry_socials; ?></td>
													<td class="text-left" style="width: 70%;"><?php echo $entry_link; ?></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-left"><b>Facebook:</b></td>
													<td>
														<input type="text" name="module_materialize_sn_fb" value="<?php echo isset($module_materialize_sn_fb) ? $module_materialize_sn_fb : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
													</td>
												</tr>
												<tr>
													<td class="text-left"><b>Google+:</b></td>
													<td>
														<input type="text" name="module_materialize_sn_g" value="<?php echo isset($module_materialize_sn_g) ? $module_materialize_sn_g : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
													</td>
												</tr>
												<tr>
													<td class="text-left"><b>Instagram:</b></td>
													<td>
														<input type="text" name="module_materialize_sn_inst" value="<?php echo isset($module_materialize_sn_inst) ? $module_materialize_sn_inst : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
													</td>
												</tr>
												<tr>
													<td class="text-left"><b>Twitter:</b></td>
													<td>
														<input type="text" name="module_materialize_sn_tw" value="<?php echo isset($module_materialize_sn_tw) ? $module_materialize_sn_tw : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
													</td>
												</tr>
												<tr>
													<td class="text-left"><b>YouTube:</b></td>
													<td>
														<input type="text" name="module_materialize_sn_yt" value="<?php echo isset($module_materialize_sn_yt) ? $module_materialize_sn_yt : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
													</td>
												</tr>
												<tr>
													<td class="text-left"><b>VK:</b></td>
													<td>
														<input type="text" name="module_materialize_sn_vk" value="<?php echo isset($module_materialize_sn_vk) ? $module_materialize_sn_vk : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
													</td>
												</tr>
												<tr>
													<td class="text-left"><b>Odnoklassniki:</b></td>
													<td>
														<input type="text" name="module_materialize_sn_ok" value="<?php echo isset($module_materialize_sn_ok) ? $module_materialize_sn_ok : ''; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-status"><span data-toggle="tooltip" title="<?php echo $help_not_index; ?>"><?php echo $entry_not_index; ?>:</span></label>
									<div class="col-sm-10">
										<select name="module_materialize_sn_index" id="input-status" class="form-control">
											<?php if ($module_materialize_sn_index) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane" id="tab-product">
							<fieldset>
								<legend><?php echo $entry_show_fields; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_show_fields; ?>:</label>
									<div class="col-sm-10">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<td class="text-left" style="width: 85%;"><?php echo $entry_fields; ?></td>
													<td class="text-center" style="width: 15%;"><?php echo $entry_show; ?></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><b><?php echo $entry_model; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_model) { ?>
																<input type="checkbox" name="module_materialize_show_model" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_model" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_sku; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_sku) { ?>
																<input type="checkbox" name="module_materialize_show_sku" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_sku" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_upc; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_upc) { ?>
																<input type="checkbox" name="module_materialize_show_upc" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_upc" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_ean; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_ean) { ?>
																<input type="checkbox" name="module_materialize_show_ean" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_ean" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_jan; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_jan) { ?>
																<input type="checkbox" name="module_materialize_show_jan" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_jan" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_isbn; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_isbn) { ?>
																<input type="checkbox" name="module_materialize_show_isbn" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_isbn" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_mpn; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_mpn) { ?>
																<input type="checkbox" name="module_materialize_show_mpn" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_mpn" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_location; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_location) { ?>
																<input type="checkbox" name="module_materialize_show_location" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_location" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_dimension; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_dimensions) { ?>
																<input type="checkbox" name="module_materialize_show_dimensions" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_dimensions" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td><b><?php echo $entry_weight; ?></b></td>
													<td class="text-center">
														<div class="checkbox">
															<label>
																<?php if ($module_materialize_show_weight) { ?>
																<input type="checkbox" name="module_materialize_show_weight" value="1" checked="checked" />
																<?php } else { ?>
																<input type="checkbox" name="module_materialize_show_weight" value="1" />
																<?php } ?>
															</label>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</fieldset>
							<br>
							<fieldset>
								<legend><?php echo $entry_show_remainder; ?></legend>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-show-remainder"><?php echo $entry_status; ?>:</label>
									<div class="col-sm-10">
										<select name="module_materialize_show_remainder" id="input-show-remainder" class="form-control">
											<?php if ($module_materialize_show_remainder) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-type-remainder"><?php echo $entry_type; ?>:</label>
									<div class="col-sm-10">
										<select name="module_materialize_type_remainder" id="input-type-remainder" class="form-control">
											<?php if ($module_materialize_type_remainder == 'numerical') { ?>
											<option value="numerical" selected="selected">Numerical</option>
											<option value="progressbar">Progressbar</option>
											<?php } else { ?>
											<option value="numerical">Numerical</option>
											<option value="progressbar" selected="selected">Progressbar</option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group required progressbar-settings">
									<label class="col-sm-2 control-label"><?php echo $entry_calculation; ?>:</label>
									<div class="col-sm-10">
										<input type="number" min="1" name="module_materialize_percent_remainder" value="<?php echo $module_materialize_percent_remainder; ?>" placeholder="" class="form-control" />
										<?php if ($error_module_materialize_percent_remainder) { ?>
										<div class="text-danger"><?php echo $error_percent_remainder; ?></div>
										<?php } ?>
									</div>
								</div>
							</fieldset>
							<br>
							<fieldset>
								<legend><?php echo $entry_payment; ?></legend>
								<div class="alert alert-info"><i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $help_payment; ?></div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_text; ?>:</label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>"/></span>
											<input type="text" name="module_materialize[<?php echo $language['language_id']; ?>][payment_text]" value="<?php echo isset($module_materialize[$language['language_id']]) ? $module_materialize[$language['language_id']]['payment_text'] : ''; ?>" placeholder="<?php echo $entry_text; ?>" class="form-control" />
										</div>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_image; ?>:</label>
									<div class="col-sm-10">
										<a href="" id="thumb-payment-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $module_materialize_payment_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="module_materialize_payment_image" value="<?php echo $module_materialize_payment_image; ?>" id="input-payment-image" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_image_size; ?>"><?php echo $entry_image_size; ?>:</span></label>
									<div class="col-sm-10">
										<div class="row">
											<div class="col-sm-6">
												<input type="number" name="module_materialize_payment_image_width" value="<?php echo $module_materialize_payment_image_width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
											</div>
											<div class="col-sm-6">
												<input type="number" name="module_materialize_payment_image_height" value="<?php echo $module_materialize_payment_image_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
											</div>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane" id="tab-map">
							<fieldset>
								<legend><?php echo $tab_map; ?></legend>
								<div class="alert alert-info google-maps-settings"><i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $help_google_map; ?></div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-maps"><?php echo $tab_map; ?>:</label>
									<div class="col-sm-10">
										<select name="module_materialize_map" id="input-maps" class="form-control">
											<?php if ($module_materialize_map == 'google_maps') { ?>
											<option value="google_maps" selected="selected">Google Maps</option>
											<option value="yandex_maps">Yandex.Maps</option>
											<?php } else { ?>
											<option value="google_maps">Google Maps</option>
											<option value="yandex_maps" selected="selected">Yandex.Maps</option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group required google-maps-settings">
									<label class="col-sm-2 control-label"><?php echo $entry_api; ?>:</label>
									<div class="col-sm-10">
										<input type="text" name="module_materialize_google_api" value="<?php echo $module_materialize_google_api; ?>" placeholder="<?php echo $entry_api; ?>" class="form-control" />
										<?php if ($error_module_materialize_google_api) { ?><div class="text-danger"><?php echo $error_google_api; ?></div><?php } ?>
									</div>
								</div>
								<div class="form-group required">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_geocode; ?>"><?php echo $entry_lat; ?>:</span></label>
									<div class="col-sm-10">
										<input type="text" name="module_materialize_geo_lat" value="<?php echo $module_materialize_geo_lat; ?>" placeholder="<?php echo $entry_lat; ?>" class="form-control" />
										<?php if ($error_module_materialize_geo_lat) { ?><div class="text-danger"><?php echo $error_geo_lat; ?></div><?php } ?>
									</div>
								</div>
								<div class="form-group required">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_geocode; ?>"><?php echo $entry_lng; ?>:</span></label>
									<div class="col-sm-10">
										<input type="text" name="module_materialize_geo_lng" value="<?php echo $module_materialize_geo_lng; ?>" placeholder="<?php echo $entry_lng; ?>" class="form-control" />
										<?php if ($error_module_materialize_geo_lng) { ?><div class="text-danger"><?php echo $error_geo_lng; ?></div><?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_description; ?>:</label>
									<div class="col-sm-10">
										<?php foreach ($languages as $language) { ?>
										<span class="input-group-addon" style="border:1px solid #ccc;border-top-right-radius:3px;border-bottom-left-radius:0;"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>"/></span>
										<textarea name="module_materialize[<?php echo $language['language_id']; ?>][map_description]" placeholder="<?php echo $entry_description; ?>" class="form-control summernote"><?php echo isset($module_materialize[$language['language_id']]) ? $module_materialize[$language['language_id']]['map_description'] : ''; ?></textarea>
										<?php } ?>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_icon_pin; ?>:</label>
									<div class="col-sm-10">
										<a href="" id="thumb-icon-pin" data-toggle="image" class="img-thumbnail"><img src="<?php echo $module_materialize_icon_pin_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="module_materialize_icon_pin" value="<?php echo $module_materialize_icon_pin; ?>" id="input-icon-pin" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_image_size; ?>"><?php echo $entry_image_size; ?>:</span></label>
									<div class="col-sm-10">
										<div class="row">
											<div class="col-sm-6">
												<input type="number" name="module_materialize_icon_pin_width" value="<?php echo $module_materialize_icon_pin_width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
											</div>
											<div class="col-sm-6">
												<input type="number" name="module_materialize_icon_pin_height" value="<?php echo $module_materialize_icon_pin_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
											</div>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer text-center">
				<i class="fa fa-opencart"></i>&nbsp;
				<a href="//goo.gl/bjyFAW" target="_blank" rel="noopener" class="dotted materialize-appeal__popover" title="<b>Materialize Template</b>" data-content="<?php echo $appeal_marketplace; ?>"><strong>Materialize Template</strong></a>&nbsp;|&nbsp;
				<i class="fa fa-github"></i>&nbsp;
				<a href="//goo.gl/VAM4ww" target="_blank" rel="noopener" class="dotted materialize-appeal__popover" title="<b>GitHub</b>" data-content="<?php echo $appeal_github; ?>">GitHub</a>&nbsp;|&nbsp;
				<i class="fa fa-twitter"></i>&nbsp;
				<a href="//goo.gl/yG1AGS" target="_blank" rel="noopener" class="dotted materialize-appeal__popover" title="<b>Twitter</b>" data-content="<?php echo $appeal_twitter; ?>">Twitter</a>&nbsp;|&nbsp;
				<i class="fa fa-paypal"></i>&nbsp;
				<a href="//goo.gl/Ry4CeM" target="_blank" rel="noopener" class="dotted materialize-appeal__popover" title="<b>PayPal</b>" data-content="<?php echo $appeal_paypal; ?>">PayPal</a>&nbsp;|&nbsp;
				<i class="fa fa-credit-card"></i>&nbsp;
				<a href="//goo.gl/1C4gKu" target="_blank" rel="noopener" class="dotted materialize-appeal__popover" title="<b>Yandex.Money</b>" data-content="<?php echo $appeal_yandex_money; ?>">Yandex.Money</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#language a:first').tab('show');
	$('#tab-colors a:first').tab('show');

	var inputMaps = $("#input-maps"),
		selectBrowserBar = $("#select-color-browser-bar"),
		inputBrowserBar = $("#input-color-browser-bar-hex"),
		inputFooterColorText = $("#input-color-footer-text"),
		inputFooterColorTextHex = $("#input-color-footer-text-hex"),
		inputTypeRemainder = $("#input-type-remainder");

	selectBrowserBar.change(function(){
		selectBrowserBarOption = $("#select-color-browser-bar option:selected");
		valueHex = selectBrowserBarOption.data('hex');
		inputBrowserBar.attr('value',valueHex);
	});

	inputFooterColorText.change(function(){
		inputFooterColorTextOption = $("#input-color-footer-text option:selected");
		valueHex = inputFooterColorTextOption.data('hex');
		inputFooterColorTextHex.attr('value',valueHex);
	});

	if (inputTypeRemainder.val() == 'numerical') {$('.progressbar-settings').hide();}

	inputTypeRemainder.change(function(){
		if (inputTypeRemainder.val() == 'numerical') {$('.progressbar-settings').hide();}
		if (inputTypeRemainder.val() == 'progressbar') {$('.progressbar-settings').show();}
	});

	if (inputMaps.val() == 'google_maps') {$('.google-maps-settings').show();}
	if (inputMaps.val() != 'google_maps') {$('.google-maps-settings').hide();}

	inputMaps.change(function(){
		if (inputMaps.val() == 'google_maps') {$('.google-maps-settings').show();}
		if (inputMaps.val() != 'google_maps') {$('.google-maps-settings').hide();}
	});

	$('.selectpicker').selectpicker({
		size: 10,
		liveSearch: true,
		iconBase: 'fa',
		tickIcon: 'fa-check'
	});

	// Apply button
	var applyBtn = $('#apply-btn'),
		formMaterialize = $('#form-materialize'),
		dataAction = formMaterialize.attr('data-action');

	if (sessionStorage['index_p']) {
		var index_p = sessionStorage['index_p'];
	} else {
		var index_p = 0;
	}

	$('#apply-tab li:eq(' + index_p + ') a').tab('show');
	sessionStorage['index_p'] = 0;

	applyBtn.click(function() {
		sessionStorage['index_p'] = $(".nav-tabs .active").index();

		formMaterialize.attr({'action':dataAction});
		formMaterialize.submit();

		e.preventDefault();
	});

	document.addEventListener("keydown", function(event) {
		if (event.keyCode == 83 && (navigator.platform.match("Mac") ? event.metaKey : event.ctrlKey)) {
			event.preventDefault();
			applyBtn.trigger('click');
		}
	}, false);

	// Notify
	<?php if ($success) { ?>
	$.notify({
		icon: 'fa fa-exclamation-circle',
		message: '<?php echo $success; ?>'
	},{
		type: "success"
	});
	<?php } ?>
	<?php if ($error_warning) { ?>
	$.notify({
		icon: 'fa fa-exclamation-circle',
		message: '<?php echo $error_warning; ?>'
	},{
		type: "danger"
	});
	<?php } ?>
	<?php if ($error_module_materialize_percent_remainder) { ?>
	$.notify({
		icon: 'fa fa-exclamation-circle',
		message: '<?php echo $error_percent_remainder; ?>'
	},{
		type: "danger"
	});
	<?php } ?>
	<?php if ($error_module_materialize_google_api) { ?>
	$.notify({
		icon: 'fa fa-exclamation-circle',
		message: '<?php echo $error_google_api; ?>'
	},{
		type: "danger"
	});
	<?php } ?>
	<?php if ($error_module_materialize_geo_lat) { ?>
	$.notify({
		icon: 'fa fa-exclamation-circle',
		message: '<?php echo $error_geo_lat; ?>'
	},{
		type: "danger"
	});
	<?php } ?>
	<?php if ($error_module_materialize_geo_lng) { ?>
	$.notify({
		icon: 'fa fa-exclamation-circle',
		message: '<?php echo $error_geo_lng; ?>'
	},{
		type: "danger"
	});
	<?php } ?>
</script>
<?php echo $footer; ?>