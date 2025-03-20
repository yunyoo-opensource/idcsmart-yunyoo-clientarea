<style>
    .newscontent img {
    width: 90%;
    height: 50%;
    }
    
    .newscontent p {
        display: block!important;
        white-space: normal;
    }
</style>
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="pt-3">
                    <div class="row justify-content-center">
                        <div class="col-xl-8">
                            <div>
                                <div class="text-center">
                                    <div class="mb-4">
                                        <span class="badge badge-light font-size-12">
                                            <i
                                                class="bx bx-purchase-tag-alt align-middle text-muted mr-1"></i>{$KnowledgeBaseArticle.cate_name}
                                        </span>
                                    </div>
                                    <h4>{$KnowledgeBaseArticle.title}</h4>
                                    <p class="text-muted mb-4"><i class="mdi mdi-calendar mr-1"></i>
                                        {$KnowledgeBaseArticle.create_time | date='Y-m-d H:i'}</p>
                                </div>
                                <hr>
                                <div class="mt-4">
                                    <div class="text-muted font-size-14">
                                        <p class="mb-n5">{$KnowledgeBaseArticle.description}</p>

                                        <div class="mb-4">
                                            <pre class="newscontent">
                                            {$KnowledgeBaseArticle.content|raw}
                                            </pre>
                                        </div>
                                    </div>
                                    <hr>
                                </div>

                                {if $KnowledgeBaseArticle.label}
                                <div class="mt-4">
                                    <h5 class="mb-3">{$Lang.label}: </h5>

                                    <div>
                                        <div class="row">
                                            <ul class=" row w-100">
                                                {foreach $KnowledgeBaseArticle.label as $label}
                                                <li class="py-1 col-sm-6">{$label}</li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                {/if}

                                <div class="mt-4 d-flex justify-content-between">
                                    {if $KnowledgeBaseArticle.prev}
                                    <a href="knowledgebaseview?id={$KnowledgeBaseArticle.prev.id}"
                                        class="btn btn-primary"><i
                                            class="bx bx-left-arrow-alt font-size-16 align-middle mr-2"></i> {$KnowledgeBaseArticle.prev.title}</a>
                                    {/if}

                                    {if $KnowledgeBaseArticle.next}
                                    <a href="knowledgebaseview?id={$KnowledgeBaseArticle.next.id}"
                                        class="btn btn-primary"> {$KnowledgeBaseArticle.next.title}<i
                                            class="bx bx-right-arrow-alt font-size-16 align-middle mr-2"></i></a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end card body -->
        </div>
        <!-- end card -->
    </div>
    <!-- end col -->
</div>
<!-- end row -->