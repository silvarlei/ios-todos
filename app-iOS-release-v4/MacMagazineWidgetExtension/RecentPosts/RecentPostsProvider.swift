//
//  RecentPostsProvider.swift
//  MacMagazineWidgetExtensionExtension
//
//  Created by Ailton Vieira Pinto Filho on 16/01/21.
//  Copyright © 2021 MacMagazine. All rights reserved.
//

import Foundation
import Kingfisher
import WidgetKit

struct RecentPostsProvider: TimelineProvider {
    func placeholder(in context: Context) -> RecentPostsEntry {
        RecentPostsEntry(date: Date(), posts: [.placeholder, .placeholder, .placeholder])
    }

    func getSnapshot(in context: Context, completion: @escaping (RecentPostsEntry) -> Void) {
        getWidgetContent { posts in
            let entry = RecentPostsEntry(date: Date(), posts: posts)
            completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RecentPostsEntry>) -> Void) {
        getWidgetContent { posts in
            let timeline = Timeline(entries: [RecentPostsEntry(date: Date(), posts: posts)], policy: .atEnd)
            completion(timeline)
        }
    }
}

extension RecentPostsProvider {
    fileprivate func getWidgetContent(onCompletion: @escaping (([PostData]) -> Void)) {
        var posts = [PostData]()

        API().getWidgets { xmlPost in
            guard let xmlPost = xmlPost else {
                let urls = posts.compactMap { $0.thumbnail }.compactMap { URL(string: $0) }
                ImagePrefetcher(urls: urls, completionHandler: { _, _, _ in
                    onCompletion(posts)
                }).start()

                return
            }
            let post = PostData(title: xmlPost.title,
                                link: xmlPost.link,
                                thumbnail: xmlPost.artworkURL,
                                favorito: xmlPost.favorite,
                                pubDate: xmlPost.pubDate,
                                excerpt: xmlPost.excerpt,
                                postId: xmlPost.postId,
                                shortURL: xmlPost.shortURL)
            posts.append(post)
        }
    }
}
