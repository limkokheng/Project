<?= $header; ?><?= $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $link['modules'] ?>" data-toggle="tooltip" title="<?php echo $lang['button_cancel']; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?= $lang['button_cancel']; ?></a>
            </div>
            <h1><?= $lang['heading_title']; ?></h1>
            <ul class="breadcrumb">
                <? if (!empty($breadcrumbs)) : ?>
                    <? foreach ($breadcrumbs as $breadcrumb) : ?>
                        <li><a href="<?= $breadcrumb['href']; ?>"><?= $breadcrumb['text']; ?></a></li>
                    <? endforeach; ?>
                <? endif; ?>
            </ul>
        </div>
    </div>

    <div class="container-fluid">
        <?php if (!empty($error_warning)) : ?>
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-circle"></i> <?= $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php endif; ?>

        <?php if (!empty($success)) : ?>
            <div class="alert alert-success">
                <i class="fa fa-check-circle"></i> <?= $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php endif; ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?= $lang['text_edit']; ?></h3>
            </div>
            <div class="panel-body">
                <? $dashboard_active = ($active_tab == 'tab-dashboard') ? ['class```````="active"', 'active'] : ['' , '']; ?>
                <? $app_active = ($active_tab == 'tab-app') ? ['class="active"', 'active'] : ['' , '']; ?>
                <? $import_active = ($active_tab == 'tab-import') ? ['class="active"', 'active'] : ['' , '']; ?>
                <? $setting_active = ($active_tab == 'tab-setting') ? ['class="active"', 'active'] : ['' , '']; ?>

                <ul class="nav nav-tabs">
                    <li <?= $dashboard_active[0]; ?>><a href="#tab-dashboard" data-toggle="tab"><?= $lang['text_dashboard']; ?></a></li>
                    <li <?= $app_active[0]; ?>><a href="#tab-app" data-toggle="tab"><?= $lang['text_app']; ?></a></li>
                    <li <?= $import_active[0]; ?>><a href="#tab-import" data-toggle="tab"><?= $lang['text_import']; ?></a></li>
                    <li <?= $setting_active[0]; ?>><a href="#tab-setting" data-toggle="tab"><?= $lang['text_setting']; ?></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane <?= $dashboard_active[1]; ?>" id="tab-dashboard">
                        dashboard
                    </div>
                    <div class="tab-pane <?= $app_active[1]; ?>" id="tab-app">
                        <fieldset>
                            <legend><?= $lang['text_app_list']; ?></legend>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <td class="text-center" style="width: 5%;"><?= $lang['text_number']; ?></td>
                                            <td class="text-center"><?= $lang['text_app_name']; ?></td>
                                            <td class="text-center" style="width: 20%;"><?= $lang['text_action']; ?></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <? if (!empty($app_list)) : ?>
                                            <? $app_count = 1; ?>
                                            <? foreach ($app_list as $app) : ?>
                                                <tr>
                                                    <td class="text-center"><?= $app_count; ?></td>
                                                    <td><?= $app['app_name']; ?></td>
                                                    <td class="text-right">
                                                        <a href="<?= $app['link_edit']; ?>" class="btn btn-primary"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                        <a href="<?= $app['link_delete']; ?>" class="btn btn-warning"><i class="fa fa-minus-circle" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <? $app_count++; ?>
                                            <? endforeach; ?>
                                        <? else : ?>
                                            <tr>
                                                <td class="text-center" colspan="3"><?= $lang['text_no_result']; ?></td>
                                            </tr>
                                        <? endif; ?>
                                    </tbody>
                                </table>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend><?= $lang['text_new_app']; ?></legend>
                            <form action="<?= $link['app_form']; ?>" method="post" enctype="multipart/form-data" id="app_form" class="form-horizontal">
                                <div class="form-group required">
                                    <label for="input_app_name" class="col-sm-2 control-label"><?= $lang['text_app_name']; ?></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="app_name" id="input_app_name" class="form-control" placeholder="<?= $lang['text_app_name']; ?>" value="<?= $input['app_name']; ?>">
				                        <? if (!empty($error_app_name)) : ?>
                                            <div class="text-danger"><?= $error_app_name; ?></div>
				                        <? endif; ?>
                                    </div>
                                </div>

                                <div class="text-right">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i> <?= $lang['text_add_app']; ?></button>
                                </div>
                            </form>
                        </fieldset>
                        </div>
                    <div class="tab-pane <?= $import_active[1]; ?>" id="tab-import">
                        <form action="<?= $link['import_form']; ?>" id="form_import" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group">
                                <label for="input_file" class="control-label col-sm-2"></label>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane <?= $setting_active[1]; ?>" id="tab-setting">
                        <div class="text-right">
                            <button type="submit" id="button-setting" form="form_setting" data-toggle="tooltip" title="<?= $lang['text_save_setting']; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?= $lang['text_save_setting']; ?></button>
                        </div>

                        <form action="<?= $link['setting_form']; ?>" id="form_setting" class="form-horizontal" enctype="multipart/form-data" method="post">
                            <fieldset>
                                <legend><?= $lang['text_module_setting']; ?></legend>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">
                                        <span data-toggle="tooltip" data-container="#tab-setting" title="<?= $lang['text_help_status']; ?>"><?= $lang['text_status']; ?></span>
                                    </label>
                                    <div class="col-sm-10">
			                            <? $enabled = (!empty($input['lingcodtv_status'])) ? 'checked' : ''; ?>
			                            <? $disabled = (empty($input['lingcodtv_status'])) ? 'checked' : ''; ?>
                                        <label class="radio-inline">
                                            <input type="radio" name="lingcodtv_status" value="1" <?= $enabled; ?>/> <?= $lang['text_enabled']; ?>
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="lingcodtv_status" value="0" <?= $disabled; ?>/> <?= $lang['text_disabled']; ?>
                                        </label>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $footer; ?>
