<!-- IMPORT partials/breadcrumbs.tpl -->
<div widget-area="header">
	<!-- BEGIN widgets.header -->
	{{widgets.header.html}}
	<!-- END widgets.header -->
</div>
<div class="row">
	<div class="topic <!-- IF widgets.sidebar.length -->col-lg-9 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">

		<div class="topic-header">
			<div class="Table header-title">
				<div class="Table-item topic-title">
					<h1 class="topic-text" component="topic/title">{title}</h1>
					<!-- IF config.enableShowTid -->
					<span class="topic-number">#{tid}</span>
					<!-- ENDIF config.enableShowTid -->
				</div>

				<!-- IF config.loggedIn -->
				<div class="Table-item header-actions hidden-xs">
					<a href="/compose?cid={category.cid}" component="category/post" id="new_topic" class="btn btn-success" data-ajaxify="false" role="button">[[category:new_topic_button]]</a>
				</div>
				<!-- ENDIF config.loggedIn -->
			</div>

			<div class="Table header-meta">
				<div class="Table-item pins" component="post/header">
					<!-- IF pinned --><i class="pin-item fa fa-thumb-tack" title="[[topic:pinned]]"></i><!-- ENDIF pinned -->
					<!-- IF locked --><i class="pin-item fa fa-lock" title="[[topic:locked]]"></i><!-- ENDIF locked -->
					<!-- IF oldCid --><i class="pin-item fa fa-arrow-circle-right" title="[[topic:moved]]"></i><!-- ENDIF oldCid -->
					<!-- BEGIN icons -->@value<!-- END icons -->
				</div>

				<div class="Table-item topic-stats">
					<!-- IMPORT partials/topic/stats.tpl -->
				</div>
			</div>

			<div class="header-info">

			<!-- IF merger -->
			<div component="topic/merged/message" class="alert alert-warning clearfix">
				<span class="pull-left">[[topic:merged_message, {mergeIntoTid}, {merger.mergedIntoTitle}]]</span>
				<span class="pull-right">
					<a href="{config.relative_path}/user/{merger.userslug}">
						<strong>{merger.username}</strong>
					</a>
					<small class="timeago" title="{mergedTimestampISO}"></small>
				</span>
			</div>
			<!-- ENDIF merger -->

			<div component="topic/deleted/message" class="alert alert-warning<!-- IF !deleted --> hidden<!-- ENDIF !deleted --> clearfix">
				<span class="pull-left">[[topic:deleted_message]]</span>
				<span class="pull-right">
					<!-- IF deleter -->
					<a href="{config.relative_path}/user/{deleter.userslug}">
						<strong>{deleter.username}</strong>
					</a>
					<small class="timeago" title="{deletedTimestampISO}"></small>
					<!-- ENDIF deleter -->
				</span>
			</div>
			</div>
		</div>

		<ul component="topic" class="posts" data-tid="{tid}" data-cid="{cid}">
			<!-- BEGIN posts -->
				<li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
					<a component="post/anchor" data-index="{posts.index}" id="{posts.index}"></a>

					<meta itemprop="datePublished" content="{posts.timestampISO}">
					<meta itemprop="dateModified" content="{posts.editedISO}">

					<!-- IMPORT partials/topic/post.tpl -->

					<!-- IF !posts.index -->
					<ul class="tags">
						<!-- BEGIN tags -->
						<li>
							<a href="{config.relative_path}/tags/{tags.value}" class="tag" style="<!-- IF tags.color -->color: {tags.color};<!-- ENDIF tags.color --><!-- IF tags.bgColor -->background-color: {tags.bgColor};<!-- ENDIF tags.bgColor -->">
								<span class="tag-item" data-tag="{tags.value}">{tags.valueEscaped}</span>
							</a>
						</li>
						<!-- END tags -->
					</ul>
					<!-- ENDIF !posts.index -->

				</li>
			<!-- END posts -->
		</ul>

		<!-- IF config.enableQuickReply -->
		<!-- IMPORT partials/topic/quickreply.tpl -->
		<!-- ENDIF config.enableQuickReply -->

		<div class="post-bar">
			<!-- IMPORT partials/post_bar.tpl -->
		</div>

		<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
		<!-- ENDIF config.usePagination -->

		<div class="navigator-thumb text-center hidden">
			<strong class="text"></strong><br />
			<span class="time"></span>
		</div>
		<div class="visible-xs visible-sm pagination-block text-center">
			<div class="progress-bar"></div>
			<div class="wrapper">
				<i class="fa fa-2x fa-angle-double-up pointer fa-fw pagetop widebtn"></i>
				<i class="fa fa-2x fa-angle-up pointer fa-fw pageup widebtn"></i>
				<span class="pagination-text"></span>
				<i class="fa fa-2x fa-angle-down pointer fa-fw pagedown widebtn"></i>
				<i class="fa fa-2x fa-angle-double-down pointer fa-fw pagebottom widebtn"></i>
			</div>
		</div>
	</div>
	<div widget-area="sidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
		<!-- BEGIN widgets.sidebar -->
		{{widgets.sidebar.html}}
		<!-- END widgets.sidebar -->
	</div>
</div>
<div widget-area="footer">
	<!-- BEGIN widgets.footer -->
	{{widgets.footer.html}}
	<!-- END widgets.footer -->
</div>

<!-- IF !config.usePagination -->
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
<!-- ENDIF !config.usePagination -->