<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<div class="page-sidebar-wrapper">
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler">
                </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <li class="sidebar-search-wrapper">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <form class="sidebar-search " action="extra_search.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
							<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
							</span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="start ">
                <a href="javascript:;">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="index.html">
                            <i class="icon-bar-chart"></i>
                            Default Dashboard</a>
                    </li>
                    <li>
                        <a href="index_2.html">
                            <i class="icon-bulb"></i>
                            New Dashboard #1</a>
                    </li>
                    <li>
                        <a href="index_3.html">
                            <i class="icon-graph"></i>
                            New Dashboard #2</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-basket"></i>
                    <span class="title">eCommerce</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="ecommerce_index.html">
                            <i class="icon-home"></i>
                            Dashboard</a>
                    </li>
                    <li>
                        <a href="ecommerce_orders.html">
                            <i class="icon-basket"></i>
                            Orders</a>
                    </li>
                    <li>
                        <a href="ecommerce_orders_view.html">
                            <i class="icon-tag"></i>
                            Order View</a>
                    </li>
                    <li>
                        <a href="ecommerce_products.html">
                            <i class="icon-handbag"></i>
                            Products</a>
                    </li>
                    <li>
                        <a href="ecommerce_products_edit.html">
                            <i class="icon-pencil"></i>
                            Product Edit</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-rocket"></i>
                    <span class="title">Page Layouts</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="layout_horizontal_sidebar_menu.html">
                            Horizontal & Sidebar Menu</a>
                    </li>
                    <li>
                        <a href="index_horizontal_menu.html">
                            Dashboard & Mega Menu</a>
                    </li>
                    <li>
                        <a href="layout_horizontal_menu1.html">
                            Horizontal Mega Menu 1</a>
                    </li>
                    <li>
                        <a href="layout_horizontal_menu2.html">
                            Horizontal Mega Menu 2</a>
                    </li>
                    <li>
                        <a href="layout_fontawesome_icons.html">
                            <span class="badge badge-roundless badge-danger">new</span>Layout with Fontawesome Icons</a>
                    </li>
                    <li>
                        <a href="layout_glyphicons.html">
                            Layout with Glyphicon</a>
                    </li>
                    <li>
                        <a href="layout_full_height_portlet.html">
                            <span class="badge badge-roundless badge-success">new</span>Full Height Portlet</a>
                    </li>
                    <li>
                        <a href="layout_full_height_content.html">
                            <span class="badge badge-roundless badge-warning">new</span>Full Height Content</a>
                    </li>
                    <li>
                        <a href="layout_search_on_header1.html">
                            Search Box On Header 1</a>
                    </li>
                    <li>
                        <a href="layout_search_on_header2.html">
                            Search Box On Header 2</a>
                    </li>
                    <li>
                        <a href="layout_sidebar_search_option1.html">
                            Sidebar Search Option 1</a>
                    </li>
                    <li>
                        <a href="layout_sidebar_search_option2.html">
                            Sidebar Search Option 2</a>
                    </li>
                    <li>
                        <a href="layout_sidebar_reversed.html">
                            <span class="badge badge-roundless badge-warning">new</span>Right Sidebar Page</a>
                    </li>
                    <li>
                        <a href="layout_sidebar_fixed.html">
                            Sidebar Fixed Page</a>
                    </li>
                    <li>
                        <a href="layout_sidebar_closed.html">
                            Sidebar Closed Page</a>
                    </li>
                    <li>
                        <a href="layout_ajax.html">
                            Content Loading via Ajax</a>
                    </li>
                    <li>
                        <a href="layout_disabled_menu.html">
                            Disabled Menu Links</a>
                    </li>
                    <li>
                        <a href="layout_blank_page.html">
                            Blank Page</a>
                    </li>
                    <li>
                        <a href="layout_boxed_page.html">
                            Boxed Page</a>
                    </li>
                    <li>
                        <a href="layout_language_bar.html">
                            Language Switch Bar</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-diamond"></i>
                    <span class="title">UI Features</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="ui_general.html">
                            General Components</a>
                    </li>
                    <li>
                        <a href="ui_buttons.html">
                            Buttons</a>
                    </li>
                    <li>
                        <a href="ui_confirmations.html">
                            Popover Confirmations</a>
                    </li>
                    <li>
                        <a href="ui_icons.html">
                            <span class="badge badge-roundless badge-danger">new</span>Font Icons</a>
                    </li>
                    <li>
                        <a href="ui_colors.html">
                            Flat UI Colors</a>
                    </li>
                    <li>
                        <a href="ui_typography.html">
                            Typography</a>
                    </li>
                    <li>
                        <a href="ui_tabs_accordions_navs.html">
                            Tabs, Accordions & Navs</a>
                    </li>
                    <li>
                        <a href="ui_tree.html">
                            <span class="badge badge-roundless badge-danger">new</span>Tree View</a>
                    </li>
                    <li>
                        <a href="ui_page_progress_style_1.html">
                            <span class="badge badge-roundless badge-warning">new</span>Page Progress Bar</a>
                    </li>
                    <li>
                        <a href="ui_blockui.html">
                            Block UI</a>
                    </li>
                    <li>
                        <a href="ui_bootstrap_growl.html">
                            <span class="badge badge-roundless badge-warning">new</span>Bootstrap Growl Notifications</a>
                    </li>
                    <li>
                        <a href="ui_notific8.html">
                            Notific8 Notifications</a>
                    </li>
                    <li>
                        <a href="ui_toastr.html">
                            Toastr Notifications</a>
                    </li>
                    <li>
                        <a href="ui_alert_dialog_api.html">
                            <span class="badge badge-roundless badge-danger">new</span>Alerts & Dialogs API</a>
                    </li>
                    <li>
                        <a href="ui_session_timeout.html">
                            Session Timeout</a>
                    </li>
                    <li>
                        <a href="ui_idle_timeout.html">
                            User Idle Timeout</a>
                    </li>
                    <li>
                        <a href="ui_modals.html">
                            Modals</a>
                    </li>
                    <li>
                        <a href="ui_extended_modals.html">
                            Extended Modals</a>
                    </li>
                    <li>
                        <a href="ui_tiles.html">
                            Tiles</a>
                    </li>
                    <li>
                        <a href="ui_datepaginator.html">
                            <span class="badge badge-roundless badge-success">new</span>Date Paginator</a>
                    </li>
                    <li>
                        <a href="ui_nestable.html">
                            Nestable List</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-puzzle"></i>
                    <span class="title">UI Components</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="components_pickers.html">
                            Date & Time Pickers</a>
                    </li>
                    <li>
                        <a href="components_context_menu.html">
                            Context Menu</a>
                    </li>
                    <li>
                        <a href="components_dropdowns.html">
                            Custom Dropdowns</a>
                    </li>
                    <li>
                        <a href="components_form_tools.html">
                            Form Widgets & Tools</a>
                    </li>
                    <li>
                        <a href="components_form_tools2.html">
                            Form Widgets & Tools 2</a>
                    </li>
                    <li>
                        <a href="components_editors.html">
                            Markdown & WYSIWYG Editors</a>
                    </li>
                    <li>
                        <a href="components_ion_sliders.html">
                            Ion Range Sliders</a>
                    </li>
                    <li>
                        <a href="components_noui_sliders.html">
                            NoUI Range Sliders</a>
                    </li>
                    <li>
                        <a href="components_jqueryui_sliders.html">
                            jQuery UI Sliders</a>
                    </li>
                    <li>
                        <a href="components_knob_dials.html">
                            Knob Circle Dials</a>
                    </li>
                </ul>
            </li>
            <!-- BEGIN ANGULARJS LINK -->
            <li class="tooltips" data-container="body" data-placement="right" data-html="true" data-original-title="AngularJS version demo">
                <a href="angularjs" target="_blank">
                    <i class="icon-paper-plane"></i>
                    <span class="title">
					AngularJS Version </span>
                </a>
            </li>
            <!-- END ANGULARJS LINK -->
            <li class="heading">
                <h3 class="uppercase">Features</h3>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-settings"></i>
                    <span class="title">Form Stuff</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="form_controls_md.html">
                            <span class="badge badge-roundless badge-danger">new</span>Material Design<br>
                            Form Controls</a>
                    </li>
                    <li>
                        <a href="form_controls.html">
                            Bootstrap<br>
                            Form Controls</a>
                    </li>
                    <li>
                        <a href="form_icheck.html">
                            iCheck Controls</a>
                    </li>
                    <li>
                        <a href="form_layouts.html">
                            Form Layouts</a>
                    </li>
                    <li>
                        <a href="form_editable.html">
                            <span class="badge badge-roundless badge-warning">new</span>Form X-editable</a>
                    </li>
                    <li>
                        <a href="form_wizard.html">
                            Form Wizard</a>
                    </li>
                    <li>
                        <a href="form_validation.html">
                            Form Validation</a>
                    </li>
                    <li>
                        <a href="form_image_crop.html">
                            <span class="badge badge-roundless badge-danger">new</span>Image Cropping</a>
                    </li>
                    <li>
                        <a href="form_fileupload.html">
                            Multiple File Upload</a>
                    </li>
                    <li>
                        <a href="form_dropzone.html">
                            Dropzone File Upload</a>
                    </li>
                </ul>
            </li>
            <li class="active open">
                <a href="javascript:;">
                    <i class="icon-briefcase"></i>
                    <span class="title">Data Tables</span>
                    <span class="selected"></span>
                    <span class="arrow open"></span>
                </a>
                <ul class="sub-menu">
                    <li class="active">
                        <a href="table_basic.html">
                            Basic Datatables</a>
                    </li>
                    <li>
                        <a href="table_tree.html">
                            Tree Datatables</a>
                    </li>
                    <li>
                        <a href="table_responsive.html">
                            Responsive Datatables</a>
                    </li>
                    <li>
                        <a href="table_managed.html">
                            Managed Datatables</a>
                    </li>
                    <li>
                        <a href="table_editable.html">
                            Editable Datatables</a>
                    </li>
                    <li>
                        <a href="table_advanced.html">
                            Advanced Datatables</a>
                    </li>
                    <li>
                        <a href="table_ajax.html">
                            Ajax Datatables</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-wallet"></i>
                    <span class="title">Portlets</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="portlet_general.html">
                            General Portlets</a>
                    </li>
                    <li>
                        <a href="portlet_general2.html">
                            <span class="badge badge-roundless badge-danger">new</span>New Portlets #1</a>
                    </li>
                    <li>
                        <a href="portlet_general3.html">
                            <span class="badge badge-roundless badge-danger">new</span>New Portlets #2</a>
                    </li>
                    <li>
                        <a href="portlet_ajax.html">
                            Ajax Portlets</a>
                    </li>
                    <li>
                        <a href="portlet_draggable.html">
                            Draggable Portlets</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-bar-chart"></i>
                    <span class="title">Charts</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="charts_amcharts.html">
                            amChart</a>
                    </li>
                    <li>
                        <a href="charts_flotcharts.html">
                            Flotchart</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-docs"></i>
                    <span class="title">Pages</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="page_timeline.html">
                            <i class="icon-paper-plane"></i>
                            <span class="badge badge-warning">2</span>New Timeline</a>
                    </li>
                    <li>
                        <a href="extra_profile.html">
                            <i class="icon-user-following"></i>
                            <span class="badge badge-success badge-roundless">new</span>New User Profile</a>
                    </li>
                    <li>
                        <a href="page_todo.html">
                            <i class="icon-check"></i>
                            Todo</a>
                    </li>
                    <li>
                        <a href="inbox.html">
                            <i class="icon-envelope"></i>
                            <span class="badge badge-danger">4</span>Inbox</a>
                    </li>
                    <li>
                        <a href="extra_faq.html">
                            <i class="icon-question"></i>
                            FAQ</a>
                    </li>
                    <li>
                        <a href="page_calendar.html">
                            <i class="icon-calendar"></i>
                            <span class="badge badge-danger">14</span>Calendar</a>
                    </li>
                    <li>
                        <a href="page_coming_soon.html">
                            <i class="icon-flag"></i>
                            Coming Soon</a>
                    </li>
                    <li>
                        <a href="page_blog.html">
                            <i class="icon-speech"></i>
                            Blog</a>
                    </li>
                    <li>
                        <a href="page_blog_item.html">
                            <i class="icon-link"></i>
                            Blog Post</a>
                    </li>
                    <li>
                        <a href="page_news.html">
                            <i class="icon-eye"></i>
                            <span class="badge badge-success">9</span>News</a>
                    </li>
                    <li>
                        <a href="page_news_item.html">
                            <i class="icon-bell"></i>
                            News View</a>
                    </li>
                    <li>
                        <a href="page_timeline_old.html">
                            <i class="icon-paper-plane"></i>
                            <span class="badge badge-warning">2</span>Old Timeline</a>
                    </li>
                    <li>
                        <a href="extra_profile_old.html">
                            <i class="icon-user"></i>
                            Old User Profile</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-present"></i>
                    <span class="title">Extra</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="page_about.html">
                            About Us</a>
                    </li>
                    <li>
                        <a href="page_contact.html">
                            Contact Us</a>
                    </li>
                    <li>
                        <a href="extra_search.html">
                            Search Results</a>
                    </li>
                    <li>
                        <a href="extra_invoice.html">
                            Invoice</a>
                    </li>
                    <li>
                        <a href="page_portfolio.html">
                            Portfolio</a>
                    </li>
                    <li>
                        <a href="extra_pricing_table.html">
                            Pricing Tables</a>
                    </li>
                    <li>
                        <a href="extra_404_option1.html">
                            404 Page Option 1</a>
                    </li>
                    <li>
                        <a href="extra_404_option2.html">
                            404 Page Option 2</a>
                    </li>
                    <li>
                        <a href="extra_404_option3.html">
                            404 Page Option 3</a>
                    </li>
                    <li>
                        <a href="extra_500_option1.html">
                            500 Page Option 1</a>
                    </li>
                    <li>
                        <a href="extra_500_option2.html">
                            500 Page Option 2</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-folder"></i>
                    <span class="title">Multi Level Menu</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="javascript:;">
                            <i class="icon-settings"></i> Item 1 <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="javascript:;">
                                    <i class="icon-user"></i>
                                    Sample Link 1 <span class="arrow"></span>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a href="#"><i class="icon-power"></i> Sample Link 1</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon-paper-plane"></i> Sample Link 1</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="icon-star"></i> Sample Link 1</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-camera"></i> Sample Link 1</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-link"></i> Sample Link 2</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-pointer"></i> Sample Link 3</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="icon-globe"></i> Item 2 <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="#"><i class="icon-tag"></i> Sample Link 1</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-pencil"></i> Sample Link 1</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-graph"></i> Sample Link 1</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="icon-bar-chart"></i>
                            Item 3 </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-user"></i>
                    <span class="title">Login Options</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="login.html">
                            Login Form 1</a>
                    </li>
                    <li>
                        <a href="login_2.html">
                            Login Form 2</a>
                    </li>
                    <li>
                        <a href="login_3.html">
                            Login Form 3</a>
                    </li>
                    <li>
                        <a href="login_soft.html">
                            Login Form 4</a>
                    </li>
                    <li>
                        <a href="extra_lock.html">
                            Lock Screen 1</a>
                    </li>
                    <li>
                        <a href="extra_lock2.html">
                            Lock Screen 2</a>
                    </li>
                </ul>
            </li>
            <li class="heading">
                <h3 class="uppercase">More</h3>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="icon-logout"></i>
                    <span class="title">Quick Sidebar</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="quick_sidebar_push_content.html">
                            Push Content</a>
                    </li>
                    <li>
                        <a href="quick_sidebar_over_content.html">
                            Over Content</a>
                    </li>
                    <li>
                        <a href="quick_sidebar_over_content_transparent.html">
                            Over Content & Transparent</a>
                    </li>
                    <li>
                        <a href="quick_sidebar_on_boxed_layout.html">
                            Boxed Layout</a>
                    </li>
                </ul>
            </li>

            <li class="last ">
                <a href="javascript:;">
                    <i class="icon-pointer"></i>
                    <span class="title">Maps</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="maps_google.html">
                            Google Maps</a>
                    </li>
                    <li>
                        <a href="maps_vector.html">
                            Vector Maps</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>
