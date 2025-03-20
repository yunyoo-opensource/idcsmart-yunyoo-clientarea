{include file="includes/tablestyle"}


<div class="card">
    <div class="card-body">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link" href="systemlog">
                    <!-- <span class="d-block d-sm-none"><i class="fas fa-home"></i></span> -->
                    <span">{$Lang.system_log}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="loginlog">
                    <!-- <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->
                    <span">{$Lang.log_in}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active">
                    <!-- <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->
                    <span">{$Lang.api_log}</span>
                </a>
            </li>
        </ul>



        <div class="table-container mt-3">
            <div class="table-header">
                <div class="table-filter">
                    <div class="row">
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
                <div class="table-search">
                    {include file="includes/tablesearch" url="apilog"}
                </div>
            </div>
            <div class="table-responsive">
                <table class="table tablelist">
                    <colgroup>
                        <col width="50%">
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead class="bg-light">
                    <tr>
                        <!--<th class="pointer" prop="description">
								<span>{$Lang.operation_details}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>-->
                        <th>
                            <span>{$Lang.operation_details}</span>
                        </th>
                        <th class="pointer" prop="create_time">
                            <span>{$Lang.operation_time}</span>
                            <span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
                        </th>
                        <!--<th class="pointer" prop="ipaddr">
								<span>{$Lang.ip_address}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>-->
                        <th>
                            <span>{$Lang.ip_address}</span>
                        </th>
                        <!--<th class="pointer" prop="user">
								<span>{$Lang.operator}</span>
								<span class="text-black-50 d-inline-flex flex-column justify-content-center ml-1 offset-3">
									<i class="bx bx-caret-up"></i>
									<i class="bx bx-caret-down"></i>
								</span>
							</th>-->
                        <th>
                            <span>{$Lang.operator}</span>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach $APILog as $list}
                        <tr>
                            <td class="d-flex">{$list.description}</td>
                            <td>{$list.create_time|date="Y-m-d H:i"}</td>
                            <td>{$list.ipaddr}</td>
                            <td>{$list.user}</td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
            <!-- 表单底部调用开始 -->
            {include file="includes/tablefooter" url="apilog"}
        </div>
    </div>
</div>