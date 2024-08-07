//
//  VideoRecorder.swift
//  
//
//  Created by Christian Elies on 19.01.20.
//

import AVFoundation

#if !os(tvOS)
@available(iOS 10, *)
@available(macCatalyst 14, *)
final class VideoRecorder: NSObject {
    private let videoOutput: AVCaptureMovieFileOutput
    private var completion: ResultURLCompletion?

    init(videoOutput: AVCaptureMovieFileOutput) {
        self.videoOutput = videoOutput
    }
}

@available(iOS 10, *)
@available(macCatalyst 14, *)
extension VideoRecorder {
    func start(recordTo url: URL, completion: @escaping ResultURLCompletion) {
        self.completion = completion
        videoOutput.stopRecording()
        videoOutput.startRecording(to: url, recordingDelegate: self)
    }

    func stop() {
        videoOutput.stopRecording()
    }
}

@available(iOS 10, *)
@available(macCatalyst 14, *)
extension VideoRecorder: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput,
                    didFinishRecordingTo outputFileURL: URL,
                    from connections: [AVCaptureConnection], error: Error?) {
        completion?(.success(outputFileURL))
    }
}

#endif

