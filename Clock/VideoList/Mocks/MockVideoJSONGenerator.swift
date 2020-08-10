//
//  MockVideoJSONGenerator.swift
//  Clock
//
//  Created by Tommy Martin on 8/3/20.
//  Copyright © 2020 Unanonymous. All rights reserved.
//

import Foundation

class MockVideoJSONGenerator {
    static func generateJSON() {
        // Users
        let nbaUser = UserSummary(uuid: "DE5F1605-4A71-4000-9C07-BBD5C84F0F8A", username: "nba")
        let coldplay = ArtistSummary(uuid: "BEFB54F1-0BFF-411E-B018-D50926567FA0", name: "Coldplay")

        // Artists
        let nbaArtist = ArtistSummary(uuid: "DE5F1605-4A71-4000-9C07-BBD5C84F0F8A", name: "nba")
        let justroverz = ArtistSummary(uuid: "DCBF4C55-1788-4588-AC9E-A027F4B4D654", name: "justroverz")

        // Songs
        let song1 = SongSummary(uuid: "3C7D8573-7B30-45EB-A4A7-AEF579F0123B", artist: nbaArtist, name: "originalSound")
        let song2 = SongSummary(uuid: "F3D148CA-5E07-43FF-8BE9-C48A3AC7BE76", artist: nbaArtist, name: "originalSound")
        let song3 = SongSummary(uuid: "57CD9152-6B3A-48BE-9FC7-994B579312A9", artist: nbaArtist, name: "originalSound")
        let song4 = SongSummary(uuid: "B223BE07-4666-430A-958F-D53FF1D18863", artist: nbaArtist, name: "originalSound")
        let song5 = SongSummary(uuid: "65334313-D89F-4842-8143-220F7BD431AE", artist: nbaArtist, name: "originalSound")
        let song6 = SongSummary(uuid: "8A8C1A60-E76E-462A-BA27-CE941503C8F9", artist: nbaArtist, name: "originalSound")
        let song7 = SongSummary(uuid: "7099829-1B97-4999-BB52-7C231C0643F8", artist: nbaArtist, name: "originalSound")
        let xgamesMode = SongSummary(uuid: "F7EC8382-133E-46C0-981E-FF744898017E", artist: justroverz, name: "Just X Games Mode")
        let paradise = SongSummary(uuid: "879F3C15-71EE-4596-84D4-9B37F07D3395", artist: coldplay, name: "Paradise")

        let mockVideos: [Video] = [
            Video(
                uuid: "994CC39E-DF52-412B-8194-D548EDAA01CF",
                commentCount: 402,
                description: "You can get an up close and personal look at the NBA action! Show your reaction to your favorite NBA plays! #WholeNewGame",
                likeCount: 35812,
                song: song1,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6573.MOV")!,
                user: nbaUser),
            Video(
                uuid: "738D3273-1BEE-4E57-8A8B-1DB13007F0E6",
                commentCount: 165,
                description: "Steven Adams @okcthunder #xgamesmode",
                likeCount: 47615,
                song: xgamesMode,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6574.MOV")!,
                user: nbaUser),
            Video(
                uuid: "402786A5-AA50-49B0-AA6A-E955AAC6613D",
                commentCount: 159,
                description: "Do your dance Luke #wholenewgame",
                likeCount: 30612,
                song: song2,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6576.MOV")!,
                user: nbaUser),
            Video(
                uuid: "B985E672-8278-4428-895D-567EEB508587",
                commentCount: 304,
                description: "Best birthday. @okcthunder #wholesomemomemts #birthday",
                likeCount: 42123,
                song: paradise,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6577.MOV")!,
                user: nbaUser),
            Video(
                uuid: "4924BCB0-4DED-4074-BA99-8B53501B1FA4",
                commentCount: 220,
                description: "The third one @pelicansnba #mascotmonday #pose #poseathome",
                likeCount: 15412,
                song: song3,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6578.MOV")!,
                user: nbaUser),
            Video(
                uuid: "4221555B-3E6E-47DB-B026-D3FCF8995E8C",
                commentCount: 283,
                description: "Boban with the ferious flush! @dallasmavs #wholenewgame #nba #dunk",
                likeCount: 57023,
                song: song4,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6579.MOV")!,
                user: nbaUser),
            Video(
                uuid: "03976C85-4EBF-4E08-898F-C686F038ED9C",
                commentCount: 178,
                description: "Fultz lets it fly to beat the buzzer! #wholenewgame #xgamesmode",
                likeCount: 37700,
                song: xgamesMode,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6580.MOV")!,
                user: nbaUser),
            Video(
                uuid: "F2196DC9-8AE1-4B6D-9938-287E45154AA2",
                commentCount: 192,
                description: "Some familiar faces behind the @celtics bench #wholenewgame",
                likeCount: 38912,
                song: song5,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6581.MOV")!,
                user: nbaUser),
            Video(
                uuid: "69E688A8-AFB5-43E5-9014-87C1676720D9",
                commentCount: 415,
                description: "Caught in action #wholenewgame @laclippers",
                likeCount: 119123,
                song: song6,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6582.MOV")!,
                user: nbaUser),
            Video(
                uuid: "4719F8BC-0E43-483A-ADD9-6DA02D7A524D",
                commentCount: 242,
                description: "Caught in action #wholenewgame @laclippers",
                likeCount: 102312,
                song: song7,
                url: URL(string: "https://s3.amazonaws.com/com.unanonymous.clock.test-data/IMG_6583.MOV")!,
                user: nbaUser)
        ]
        
        let data = try! JSONEncoder().encode(mockVideos)
        let jsonString = String(data: data, encoding: .utf8)!
        print(jsonString)
    }

    
}
