//
//  PHAsset+anyMedia.swift
//  
//
//  Created by Christian Elies on 01.12.19.
//

import Photos

extension PHAsset {
    var anyMedia: AnyMedia? {
        var anyMedia: AnyMedia?

//        print("Brian - switch media type \(mediaType) subtypes \(mediaSubtypes) \(describeMediaSubtype(mediaSubtypes))")
        
        switch mediaType {
        case .audio:
            let audio = Audio(phAsset: self)
            anyMedia = AnyMedia(audio)
        case .image:
                if(mediaSubtypes.contains(.photoLive)) {
                    let livePhoto = LivePhoto(phAsset: self)
                    anyMedia = AnyMedia(livePhoto)
                } else {
                    let photo = Photo(phAsset: self)
                    anyMedia = AnyMedia(photo)
                }
        case .video:
            let video = Video(phAsset: self)
            anyMedia = AnyMedia(video)
        case .unknown: ()
        @unknown default: ()
        }

        return anyMedia
    }
    
    func describeMediaSubtype(_ subtype: PHAssetMediaSubtype) {
        var subtypeDescriptions: [String] = []
        
        if subtype.contains(.photoPanorama) {
            subtypeDescriptions.append("Photo Panorama")
        }
        if subtype.contains(.photoHDR) {
            subtypeDescriptions.append("Photo HDR")
        }
        if subtype.contains(.photoLive) {
            subtypeDescriptions.append("Photo Live")
        }
        if subtype.contains(.photoDepthEffect) {
            subtypeDescriptions.append("Photo Depth Effect")
        }
        if subtype.contains(.videoStreamed) {
            subtypeDescriptions.append("Video Streamed")
        }
        if subtype.contains(.videoHighFrameRate) {
            subtypeDescriptions.append("Video High Frame Rate")
        }
        if subtype.contains(.videoTimelapse) {
            subtypeDescriptions.append("Video Timelapse")
        }
        
        if subtypeDescriptions.isEmpty {
            print("No specific subtypes")
        } else {
            print("Subtypes: \(subtypeDescriptions.joined(separator: ", "))")
        }
    }
}
