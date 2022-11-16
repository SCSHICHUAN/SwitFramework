//
//  LiveInit.swift
//  PRear
//
//  Created by Stan on 2022/11/16.
//

import UIKit
import AgoraRtcKit


extension LiveInit{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        initView()
        initializeAgoraEngine()
        setupLocalVideo()
        joinChannel()
        UIApplication.shared.isIdleTimerDisabled = true
    }
}


class LiveInit: UIViewController, AgoraRtcEngineDelegate {
    
    // 定义 localView 变量
        var localView: UIView!
        // 定义 remoteView 变量
        var remoteView: UIView!
        // 定义 agoraKit
        var agoraKit: AgoraRtcEngineKit!

        // 设置视频窗口布局
        override func viewDidLayoutSubviews(){
            super.viewDidLayoutSubviews()
            remoteView.frame = self.view.bounds
            localView.frame = CGRect(x: self.view.bounds.width - 90, y: 0, width: 90, height: 160)
        }

        func initView(){
            // 初始化远端视频窗口。只有当远端用户为主播时，才会显示视频画面
            remoteView = UIView()
            self.view.addSubview(remoteView)
            // 初始化本地视频窗口。只有当本地用户为主播时，才会显示视频画面
            localView = UIView()
            self.view.addSubview(localView)
        }

    
    func initializeAgoraEngine(){
        let config = AgoraRtcEngineConfig()
        // 在这里输入你的 App ID.
        config.appId = "661227bd32aa47f988c6544c71175cde"
        // 调用 AgoraRtcEngineDelegate
        agoraKit = AgoraRtcEngineKit.sharedEngine(with: config, delegate: self)
    }
    
    func setupLocalVideo(){
        // 启用视频模块
        agoraKit?.enableVideo()
        // 开始本地预览
        agoraKit?.startPreview()
        let videoCanvas = AgoraRtcVideoCanvas()
        videoCanvas.uid = 0
        videoCanvas.renderMode = .hidden
        videoCanvas.view = localView
        // 设置本地视图
        agoraKit?.setupLocalVideo(videoCanvas)
    }
    
    //主播 都是主播就可以视频聊天
    func joinChannel(){
        let option = AgoraRtcChannelMediaOptions()
        // 在视频直播场景下，将频道场景设置为 liveBroadcasting
        option.channelProfile = .of((Int32)(AgoraChannelProfile.liveBroadcasting.rawValue))
        // 设置用户角色为主播
        option.clientRoleType = .of((Int32)(AgoraClientRole.broadcaster.rawValue))
        // 极速直播下的观众，需设置用户级别为 AgoraAudienceLatencyLevelLowLatency
        option.audienceLatencyLevel = .of((Int32)(AgoraAudienceLatencyLevelType.lowLatency.rawValue))

        // 使用临时 token 加入频道，在这里传入你的项目的 token 和频道名。
        agoraKit?.joinChannel(byToken: "007eJxTYPhgt1ykWPmds950gf23y98zMe6o3nR3/cby/KMMkRvtv85SYEhOtkw1TU5NTLFMNDZJSjVLSjWytEwzNjCyTEwxtTQzfDi9JLkhkJGhao8lEyMDBIL4TAyGhgwMAF59H5c=", channelId: "11", uid: 0, mediaOptions: option)
    }

    //观众 没有声音
    func joinChannel2(){
        let option = AgoraRtcChannelMediaOptions()
        // 在视频直播场景下，将频道场景设置为 liveBroadcasting
        option.channelProfile = .of((Int32)(AgoraChannelProfile.liveBroadcasting.rawValue))
        // 设置用户角色为观众
        option.clientRoleType = .of((Int32)(AgoraClientRole.audience.rawValue))
        // 极速直播下的观众，需设置用户级别为 AgoraAudienceLatencyLevelLowLatency
        option.audienceLatencyLevel = .of((Int32)(AgoraAudienceLatencyLevelType.lowLatency.rawValue))

        // 使用临时 token 加入频道，在这里传入你的项目的 token 和频道名。
        agoraKit?.joinChannel(byToken: "007eJxTYPhgt1ykWPmds950gf23y98zMe6o3nR3/cby/KMMkRvtv85SYEhOtkw1TU5NTLFMNDZJSjVLSjWytEwzNjCyTEwxtTQzfDi9JLkhkJGhao8lEyMDBIL4TAyGhgwMAF59H5c=", channelId: "11", uid: 0, mediaOptions: option)
    }
    

}

extension LiveInit{
   func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int){
       let videoCanvas = AgoraRtcVideoCanvas()
       videoCanvas.uid = uid
       videoCanvas.renderMode = .hidden
       videoCanvas.view = remoteView
       agoraKit?.setupRemoteVideo(videoCanvas)
   }
}
