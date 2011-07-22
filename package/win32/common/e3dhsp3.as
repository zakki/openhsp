#regcmd "_hsp3cmdinit@4","e3dhsp3.dll"
#cmd E3DInit $000
#cmd E3DBye $001
#cmd E3DSigLoad $002
#cmd E3DCreateSwapChain $003
#cmd E3DDestroySwapChain $004
#cmd E3DRender $005
#cmd E3DPresent $006
#cmd E3DBeginScene $007
#cmd E3DEndScene $008
#cmd E3DCreateBG $009
#cmd E3DSetBGU $00A
#cmd E3DSetBGV $00B
#cmd E3DDestroyBG $00C
#cmd E3DAddMotion $00D
#cmd E3DSetMotionKind $00E
#cmd E3DGetMotionKind $00F
#cmd E3DSetNewPose $010
#cmd E3DSetMotionStep $011
#cmd E3DChkConflict $012
#cmd E3DChkConflict2 $013
#cmd E3DCreateAfterImage $014
#cmd E3DDestroyAfterImage $015
#cmd E3DSetAlpha $016
#cmd E3DSetAlpha2 $017
#cmd E3DSetPos $018
#cmd E3DGetPos $019
#cmd E3DSetDir $01A
#cmd E3DRotateInit $01B
#cmd E3DRotateX $01C
#cmd E3DRotateY $01D
#cmd E3DRotateZ $01E
#cmd E3DTwist $01F
#cmd E3DPosForward $020
#cmd E3DCloseTo $021
#cmd E3DDirToTheOtherXZ $022
#cmd E3DDirToTheOther $023
#cmd E3DSeparateFrom $024
#cmd E3DGetCameraPos $025
#cmd E3DSetCameraPos $026
#cmd E3DGetCameraDeg $027
#cmd E3DSetCameraDeg $028
#cmd E3DSetCameraTarget $029
#cmd E3DChkInView $02A
#cmd E3DEnableDbgFile $02B
#cmd E3DSetProjection $02C
#cmd E3DGetKeyboardState $02D

#cmd E3DCos $02E
#cmd E3DSin $02F
#cmd E3DACos $030
#cmd E3DDot $031
#cmd E3DCross $032
#cmd E3DAtan $033
#cmd E3DAtan2 $034
#cmd E3DSqrt $035
#cmd E3DDrawText $036
#cmd E3DDrawBigText $037
#cmd E3DRand $038
#cmd E3DSeed $039
#cmd E3DGetFPS $03A
#cmd E3DWaitByFPS $03B
#cmd E3DCreateLight $03C
#cmd E3DSetDirectionalLight $03D
#cmd E3DSetPointLight $03E
#cmd E3DSetSpotLight $03F
#cmd E3DDestroyLight $040
#cmd E3DClearZ $041
#cmd E3DDestroyHandlerSet $042
#cmd E3DSetDispSwitch $043
#cmd E3DSetMotionFrameNo $044
#cmd E3DCreateSprite $045
#cmd E3DBeginSprite $046
#cmd E3DEndSprite $047
#cmd E3DRenderSprite $048
#cmd E3DGetSpriteSize $049
#cmd E3DSetSpriteRotation $04A
#cmd E3DSetSpriteARGB $04B
#cmd E3DDestroySprite $04C
#cmd E3DChkConfBillboard2 $04D
#cmd E3DChkConfBillboard $04E
#cmd E3DChkConfBySphere $04F
#cmd E3DChkConfBySphere2 $050
#cmd E3DCreateProgressBar $051
#cmd E3DSetProgressBar $052
#cmd E3DDestroyProgressBar $053
#cmd E3DLoadGroundBMP $054
#cmd E3DCameraPosForward $055
#cmd E3DSetBeforePos $056
#cmd E3DChkConfGround $057
#cmd E3DChkConfGround2 $058
#cmd E3DGetPartNoByName $059
#cmd E3DGetVertNumOfPart $05A
#cmd E3DGetVertPos $05B
#cmd E3DSetVertPos $05C
#cmd E3DSetPosOnGround $05D
#cmd E3DSetPosOnGroundPart $05E
#cmd E3DCreateBillboard $05F
#cmd E3DRenderBillboard $060
#cmd E3DSetBillboardPos $061
#cmd E3DSetBillboardOnGround $062
#cmd E3DDestroyBillboard $063

#cmd E3DLoadMQOFileAsGround $064
#cmd E3DSaveMQOFile $065
#cmd E3DGetBillboardInfo $066
#cmd E3DGetNearBillboard $067
#cmd E3DGetInvisibleFlag $068
#cmd E3DSetInvisibleFlag $069
#cmd E3DSetMovableArea $06A
#cmd E3DChkConfWall $06B
#cmd E3DChkConfWall2 $06C
#cmd E3DVec3Normalize $06D
#cmd E3DVec2CCW $06E
#cmd E3DVec3RotateY $06F
#cmd E3DLoadMQOFileAsMovableArea $070
#cmd E3DLoadSound $071
#cmd E3DPlaySound $072
#cmd E3DStopSound $073
#cmd E3DSetSoundLoop $074
#cmd E3DSetSoundVolume $075
#cmd E3DSetSoundTempo $076
#cmd E3DDestroySound $077
#cmd E3DSetSoundFrequency $078
#cmd E3DGetSoundVolume $079
#cmd E3DGetSoundFrequency $07A
#cmd E3DSet3DSoundListener $07B
#cmd E3DSet3DSoundListenerMovement $07C
#cmd E3DSet3DSoundDistance $07D
#cmd E3DSet3DSoundMovement $07E
#cmd E3DCreateNaviLine $07F
#cmd E3DDestroyNaviLine $080
#cmd E3DAddNaviPoint $081
#cmd E3DRemoveNaviPoint $082
#cmd E3DGetNaviPointPos $083
#cmd E3DSetNaviPointPos $084
#cmd E3DGetNaviPointOwnerID $085
#cmd E3DSetNaviPointOwnerID $086
#cmd E3DGetNextNaviPoint $087
#cmd E3DGetPrevNaviPoint $088
#cmd E3DGetNearestNaviPoint $089
#cmd E3DFillUpNaviLine $08A
#cmd E3DSetNaviLineOnGround $08B
#cmd E3DControlByNaviLine $08C
#cmd E3DSetDirQ $08D
#cmd E3DGetDirQ $08E
#cmd E3DSetWallOnGround $08F
#cmd E3DCreateNaviPointClearFlag $090
#cmd E3DDestroyNaviPointClearFlag $091
#cmd E3DInitNaviPointClearFlag $092
#cmd E3DSetNaviPointClearFlag $093
#cmd E3DGetOrder $094
#cmd E3DDestroyAllBillboard $095
#cmd E3DSetValidFlag $096
#cmd E3DSetDiffuse $097
#cmd E3DSetSpecular $098
#cmd E3DSetAmbient $099
#cmd E3DSetBlendingMode $09A
#cmd E3DSetRenderState $09B
#cmd E3DSetScale $09C
#cmd E3DGetScreenPos $09D
#cmd E3DGetScreenPos2 $09E
#cmd E3DCreateQ $09F
#cmd E3DDestroyQ $0A0
#cmd E3DInitQ $0A1
#cmd E3DSetQAxisAndDeg $0A2
#cmd E3DGetQAxisAndDeg $0A3
#cmd E3DRotateQX $0A4
#cmd E3DRotateQY $0A5
#cmd E3DRotateQZ $0A6
#cmd E3DMultQ $0A7
#cmd E3DNormalizeQ $0A8
#cmd E3DCopyQ $0A9

#cmd E3DGetBoneNoByName $0AA
#cmd E3DGetNextMP $0AB
#cmd E3DSetMPInfo $0AC
#cmd E3DIsExistMP $0AD
#cmd E3DGetMotionFrameLength $0AE
#cmd E3DSetMotionFrameLength $0AF
#cmd E3DAddMP $0B0
#cmd E3DDeleteMP $0B1
#cmd E3DFillUpMotion $0B2
#cmd E3DCopyMotionFrame $0B3
#cmd E3DGetMPInfo $0B4
#cmd E3DGetDirQ2 $0B5
#cmd E3DSetDirQ2 $0B6
#cmd E3DLookAtQ $0B7
#cmd E3DMultQVec $0B8
#cmd E3DTwistQ $0B9
#cmd E3DInitTwistQ $0BA
#cmd E3DGetTwistQ $0BB
#cmd E3DRotateQLocalX $0BC
#cmd E3DRotateQLocalY $0BD
#cmd E3DRotateQLocalZ $0BE
#cmd E3DGetBonePos $0BF
#cmd E3DCreateLine $0C0
#cmd E3DDestroyLine $0C1
#cmd E3DSetLineColor $0C2
#cmd E3DAddPoint2Line $0C3
#cmd E3DDeletePointOfLine $0C4
#cmd E3DSetPointPosOfLine $0C5
#cmd E3DGetPointPosOfLine $0C6
#cmd E3DGetNextPointOfLine $0C7
#cmd E3DGetPrevPointOfLine $0C8
#cmd E3DWriteDisplay2BMP $0C9
#cmd E3DCreateAVIFile $0CA
#cmd E3DWriteData2AVIFile $0CB
#cmd E3DCompleteAVIFile $0CC
#cmd E3DCameraLookAt $0CD
#cmd E3DCameraOnNaviLine $0CE
#cmd E3DCameraDirUp $0CF
#cmd E3DCameraDirDown $0D0
#cmd E3DCameraDirRight $0D1
#cmd E3DCameraDirLeft $0D2
#cmd E3DCreateFont $0D3
#cmd E3DDrawTextByFontID $0D4
#cmd E3DDrawTextByFontIDWithCnt $0D5
#cmd E3DDrawTextByFontIDWithCnt2 $0D6
#cmd E3DGetCharacterNum $0D7
#cmd E3DDestroyFont $0D8
#cmd E3DSlerpQ $0D9
#cmd E3DSquadQ $0DA
#cmd E3DSplineVec $0DB
#cmd E3DDbgOut $0DC



#cmd E3DGetDiffuse $0DD
#cmd E3DGetAmbient $0DE
#cmd E3DGetSpecular $0DF
#cmd E3DGetAlpha $0E0
#cmd E3DSaveQuaFile $0E1
#cmd E3DSaveSigFile $0E2
#cmd E3DSetMipMapParams $0E3
#cmd E3DPickVert $0E4
#cmd E3DGetCullingFlag $0E5
#cmd E3DGetOrgVertNo $0E6
#cmd E3DChkIM2Status $0E7
#cmd E3DLoadIM2File $0E8
#cmd E3DSaveIM2File $0E9
#cmd E3DGetJointNum $0EA
#cmd E3DGetJointInfo $0EB
#cmd E3DGetFirstJointNo $0EC
#cmd E3DGetDispObjNum $0ED
#cmd E3DGetDispObjInfo $0EE
#cmd E3DEnableTexture $0EF
#cmd E3DJointAddToTree $0F0
#cmd E3DJointRemoveFromParent $0F1
#cmd E3DJointRemake $0F2
#cmd E3DSigImport $0F3
#cmd E3DSigLoadFromBuf $0F4
#cmd E3DSigImportFromBuf $0F5
#cmd E3DAddMotionFromBuf $0F6
#cmd E3DCheckFullScreenParams $0F7
#cmd E3DGetMaxMultiSampleNum $0F8
#cmd E3DChkConfLineAndFace $0F9
#cmd E3DPickFace $0FA
#cmd E3DGetBBox $0FB
#cmd E3DGetVertNoOfFace $0FC
#cmd E3DGetSamePosVert $0FD
#cmd E3DRdtscStart $0FE
#cmd E3DRdtscStop $0FF
#cmd E3DSaveSig2Buf $100
#cmd E3DSaveQua2Buf $101
#cmd E3DCameraShiftLeft $102
#cmd E3DCameraShiftRight $103
#cmd E3DCameraShiftUp $104
#cmd E3DCameraShiftDown $105
#cmd E3DGetCameraQ $106
#cmd E3DInvQ $107
#cmd E3DSetCameraTwist $108


#cmd E3DIKRotateBeta $109
#cmd E3DIKRotateBeta2D $10A
#cmd E3DGetMotionType $10B
#cmd E3DSetMotionType $10C
#cmd E3DGetIKTransFlag $10D
#cmd E3DSetIKTransFlag $10E
#cmd E3DDestroyAllMotion $10F
#cmd E3DGetUserInt1OfPart $110
#cmd E3DSetUserInt1OfPart $111
#cmd E3DGetBSphere $112
#cmd E3DGetChildJoint $113
#cmd E3DDestroyMotionFrame $114
#cmd E3DGetKeyFrameNo $115
#cmd E3DConvScreenTo3D $116
#cmd E3DVec3Length $117
#cmd E3DSetUV $118
#cmd E3DGetUV $119
#cmd E3DPickBone $11A
#cmd E3DShiftBoneTree2D $11B
#cmd E3DGetDispSwitch $11C
#cmd E3DRotateBillboard $11D
#cmd E3DSetBillboardUV $11E
#cmd E3DCreateTexture $11F
#cmd E3DGetTextureInfo $120
#cmd E3DCopyTextureToTexture $121
#cmd E3DGetTextureFromDispObj $122
#cmd E3DSetTextureToDispObj $123
#cmd E3DRasterScrollTexture $124
#cmd E3DCopyTextureToBackBuffer $125
#cmd E3DDestroyTexture $126
#cmd E3DSetLightAmbient $127
#cmd E3DSetLightSpecular $128
#cmd E3DInvColTexture $129
#cmd E3DSaveGndFile $12A
#cmd E3DLoadGndFile $12B
#cmd E3DLoadGndFileFromBuf $12C
#cmd E3DCreateTextureFromBuf $12D
#cmd E3DLoadSoundFromBuf $12E
#cmd E3DTwistBone $12F
#cmd E3DSetStartPointOfSound $130

#cmd E3DGetBoneQ $131
#cmd E3DSetBoneQ $132
#cmd E3DIsSoundPlaying $133
#cmd E3DIKTranslate $134
#cmd E3DSetUVTile $135
#cmd E3DImportMQOFileAsGround $136
#cmd E3DLoadMQOFileAsMovableAreaFromBuf $137
#cmd E3DChkThreadWorking $138
#cmd E3DLoadMQOFileAsGroundThread $139
#cmd E3DSigLoadThread $13A
#cmd E3DSigLoadFromBufThread $13B
#cmd E3DLoadMQOFileAsMovableAreaThread $13C
#cmd E3DLoadMQOFileAsMovableAreaFromBufThread $13D
#cmd E3DLoadGroundBMPThread $13E
#cmd E3DLoadGndFileThread $13F
#cmd E3DLoadGndFileFromBufThread $140
#cmd E3DAddMotionThread $141
#cmd E3DAddMotionFromBufThread $142
#cmd E3DGetShaderType $143
#cmd E3DSetShaderType $144
#cmd E3DSetLightBlendMode $145
#cmd E3DGetLightBlendMode $146
#cmd E3DSetEmissive $147
#cmd E3DSetSpecularPower $148
#cmd E3DGetEmissive $149
#cmd E3DGetSpecularPower $14A
#cmd E3DGetInfElemNum $14B
#cmd E3DGetInfElem $14C
#cmd E3DSetInfElem $14D
#cmd E3DDeleteInfElem $14E
#cmd E3DSetInfElemDefault $14F
#cmd E3DNormalizeInfElem $150
#cmd E3DGetVisiblePolygonNum $151
#cmd E3DChkConfGroundPart $152
#cmd E3DChkConfGroundPart2 $153
#cmd E3DGetMidiMusicTime $154
#cmd E3DSetNextMotionFrameNo $155

#cmd E3DSetLinearFogParams $156
#cmd E3DSetToon0Params $157

#cmd E3DChkConflict3 $158
#cmd E3DChkConfBySphere3 $159

#cmd E3DSetMovableAreaThread $15A
#cmd E3DCreateSpriteFromBMSCR $15B

#cmd E3DEncodeBeta $15C
#cmd E3DDecodeBeta $15D
#cmd E3DChkVertexShader $15E

#cmd E3DGetReferenceTime $15F

#cmd E3DLoadMOAFile $160
#cmd E3DSetNewPoseByMOA $161
#cmd E3DGetKeyboardCnt $162
#cmd E3DResetKeyboardCnt $163
#cmd E3DGetMotionFrameNo $164

#cmd E3DGetMoaInfo $165
#cmd E3DGetNextMotionFrameNo $166
#cmd E3DGetScreenPos3 $167

#cmd E3DEnableToonEdge $168
#cmd E3DSetToonEdge0Color $169
#cmd E3DSetToonEdge0Width $16A
#cmd E3DGetToonEdge0Color $16B
#cmd E3DGetToonEdge0Width $16C

#cmd E3DCreateParticle $16D
#cmd E3DSetParticlePos $16E
#cmd E3DSetParticleGravity $16F
#cmd E3DSetParticleLife $170
#cmd E3DSetParticleEmitNum $171
#cmd E3DSetParticleVel0 $172
#cmd E3DRenderParticle $173
#cmd E3DSetParticleRotation $174
#cmd E3DSetParticleDiffuse $175
#cmd E3DDestroyParticle $176
#cmd E3DSetParticleAlpha $177
#cmd E3DSetParticleUVTile $178
#cmd E3DInitParticle $179

#cmd E3DClone $17A
#cmd E3DPickFace2 $17B
#cmd E3DChkConfWall3 $17C
#cmd E3DGetMotionIDByName $17D
#cmd E3DDot2 $17E
#cmd E3DGetMotionNum $17F

#cmd E3DChkConfParticle $180

#cmd E3DLoadSigFileAsGround $181
#cmd E3DLoadSigFileAsGroundFromBuf $182

#cmd E3DGetCenterPos $183

#cmd E3DGetFaceNum $184
#cmd E3DGetFaceNormal $185
#cmd E3DCreateEmptyMotion $186
#cmd E3DSetTextureMinMagFilter $187
#cmd E3DGetMotionName $188
#cmd E3DSetMotionName $189


#cmd E3DGetMaterialNoByName $18A
#cmd E3DGetMaterialAlpha $18B
#cmd E3DGetMaterialDiffuse $18C
#cmd E3DGetMaterialSpecular $18D
#cmd E3DGetMaterialAmbient $18E
#cmd E3DGetMaterialEmissive $18F
#cmd E3DSetMaterialAlpha $190
#cmd E3DSetMaterialDiffuse $191
#cmd E3DSetMaterialSpecular $192
#cmd E3DSetMaterialAmbient $193
#cmd E3DSetMaterialEmissive $194
#cmd E3DGetTextureFromMaterial $195
#cmd E3DSetTextureToMaterial $196
#cmd E3DGetMaterialPower $197
#cmd E3DSetMaterialPower $198
#cmd E3DGetMaterialBlendingMode $199
#cmd E3DSetMaterialBlendingMode $19A

#cmd E3DGetMaterialNo $19B

#cmd E3DSetMotionKindML $19C
#cmd E3DSetMotionFrameNoML $19D
#cmd E3DSetNewPoseML $19E
#cmd E3DSetMOAEventNoML $19F
#cmd E3DSetNextMotionFrameNoML $1A0
#cmd E3DGetMotionFrameNoML $1A1
#cmd E3DGetNextMotionFrameNoML $1A2

#cmd E3DGetCurrentBonePos $1A3
#cmd E3DGetCurrentBoneQ $1A4

#cmd E3DChkBumpMapEnable $1A5
#cmd E3DEnableBumpMap $1A6
#cmd E3DConvHeight2NormalMap $1A7
#cmd E3DSetBumpMapToMaterial $1A8

#cmd E3DDumpQ $1A9
#cmd E3DSetDbgQ $1AA

#cmd E3DGetMOATrunkInfo $1AB
#cmd E3DGetMOABranchInfo $1AC
#cmd E3DSetMOABranchFrame1 $1AD
#cmd E3DSetMOABranchFrame2 $1AE

#cmd E3DSetDispSwitch2 $1AF

#cmd E3DQtoEuler $1B0
#cmd E3DEnablePhongEdge $1B1
#cmd E3DSetPhongEdge0Params $1B2

#cmd E3DGetDispSwitch2 $1B3
#cmd E3DFreeThread $1B4
#cmd E3DLoadSigFileAsGroundThread $1B5
#cmd E3DLoadSigFileAsGroundFromBufThread $1B6
#cmd E3DSetLightIdOfBumpMap $1B7
#cmd E3DSetSpriteUV $1B8

#cmd E3DCreateRenderTargetTexture $1B9
#cmd E3DDestroyRenderTargetTexture $1BA
#cmd E3DSetDSFillUpMode $1BB
#cmd E3DSetTexFillUpMode $1BC

#cmd E3DSetShadowMapCamera $1BD
#cmd E3DSetShadowMapProjOrtho $1BE
#cmd E3DRenderWithShadow $1BF
#cmd E3DSetShadowBias $1C0
#cmd E3DCheckRTFormat $1C1
#cmd E3DChkShadowEnable $1C2
#cmd E3DEnableShadow $1C3

#cmd E3DRenderBatch $1C4
#cmd E3DSetVertPosBatch $1C5

#cmd E3DSetShadowDarkness $1C6
#cmd E3DSetShadowMapLightDir $1C7
#cmd E3DRenderBatchMode $1C8
#cmd E3DGlobalToLocal $1C9
#cmd E3DLocalToGlobal $1CA
#cmd E3DSetVertPosBatchAOrder $1CB
#cmd E3DSetShadowMapMode $1CC

#cmd E3DLoadTextureFromBuf $1CD
#cmd E3DLoadSpriteFromBMSCR $1CE

#cmd E3DSetShadowMapInterFlag $1CF
#cmd E3DTransformBillboard $1D0
#cmd E3DSetMaterialAlphaTest $1D1
#cmd E3DCalcMLMotion $1D2

#cmd E3DCreateSkinMat $1D3
#cmd E3DSetSymInfElem $1D4
#cmd E3DUpdateSymInfElem $1D5
#cmd E3DGetVersion $1D6
#cmd E3DSetJointInitialPos $1D7

#cmd E3DSetLightId2OfBumpMap $1D8
#cmd E3DSetLightId3OfBumpMap $1D9

#cmd E3DGetCharaDir $1DA
#cmd E3DGetStrSizeByFontID $1DB
#cmd E3DSetUVBatch $1DC
#cmd E3DSetPresentInterval $1DD
#cmd E3DGetScreenPosDouble $1DE
#cmd E3DSetBillboardSize $1DF
#cmd E3DSetHeightFogParams $1E0
#cmd E3DSetTextureToBG $1E1
#cmd E3DGetTextureFromBG $1E2
#cmd E3DChangeMoaIdling $1E3

#cmd E3DSetMotionBlur $1E4
#cmd E3DSetBeforeBlur $1E5
#cmd E3DRenderMotionBlur $1E6 
#cmd E3DInitBeforeBlur $1E7
#cmd E3DSetMotionBlurPart $1E8

#cmd E3DBlurTexture16Box $1E9
#cmd E3DBlurTexture9Corn $1EA
#cmd E3DBlurTextureGauss5x5 $1EB
#cmd E3DBlurTextureGauss $1EC
#cmd E3DBlendRTTexture $1ED

#cmd E3DSetClearCol $1EE
#cmd E3DSetMotionBlurMinAlpha $1EF

#cmd E3DRenderGlow	$1F0
#cmd E3DSetMaterialGlowParams $1F1
#cmd E3DGetMaterialTransparent $1F2
#cmd E3DSetMaterialTransparent $1F3
#cmd E3DGetMaterialGlowParams $1F4

#cmd E3DChkHDR $1F5
#cmd E3DSetHDRLightDiffuse $1F6
#cmd E3DSetHDRLightSpecular $1F7
#cmd E3DDownScaleRTTexture4x4 $1F8
#cmd E3DDownScaleRTTexture2x2 $1F9
#cmd E3DCreateToneMapTexture $1FA
#cmd E3DRenderToneMap $1FB
#cmd E3DBrightPassRTTextureHDR $1FC
#cmd E3DDestroyToneMapTexture $1FD
#cmd E3DRenderHDRFinal $1FE
#cmd E3DDisablePostEffect $1FF
#cmd E3DCheckSpec $200

#cmd E3DMonoRTTexture $201
#cmd E3DCbCrRTTexture $202

#cmd E3DShaderConstOffset16 $203
#cmd E3DShaderConstWeight16 $204
#cmd E3DShaderConstUserFL4 $205
#cmd E3DShaderConstUserTex $206
#cmd E3DCallUserShader $207

#cmd E3DCreateBone $208
#cmd E3DDestroyBone $209

#cmd E3DGetMorphBaseNum $20A
#cmd E3DGetMorphBaseInfo $20B
#cmd E3DGetMorphTargetInfo $20C
#cmd E3DGetMorphKeyNum $20D
#cmd E3DGetMorphKey $20E
#cmd E3DGetCurMorphInfo $20F
#cmd E3DCreateMorph $210
#cmd E3DAddMorphTarget $211
#cmd E3DSetMorphKey $212
#cmd E3DDestroyMorphKey $213

#cmd E3DGetToon1MaterialNum $214
#cmd E3DGetToon1Material $215
#cmd E3DSetToon1Name $216
#cmd E3DSetToon1Diffuse $217
#cmd E3DSetToon1Specular $218
#cmd E3DSetToon1Ambient $219
#cmd E3DSetToon1NL $21A
#cmd E3DSetToon1Edge0 $21B

#cmd E3DChkConfLineAndFacePart $21C

#cmd E3DLoadCameraFile $21D
#cmd E3DDestroyCameraAnim $21E
#cmd E3DSaveCameraFile $21F
#cmd E3DSetCameraAnimNo $220
#cmd E3DGetCameraAnimNo $221
#cmd E3DSetCameraFrameNo $222
#cmd E3DGetCameraFrameNo $223
#cmd E3DSetNewCamera $224
#cmd E3DSetNextCameraAnimFrameNo $225
#cmd E3DGetNextCameraAnimFrameNo $226
#cmd E3DCreateNewCameraAnim $227
#cmd E3DSetCameraFrameNum $228
#cmd E3DGetCameraFrameNum $229
#cmd E3DSetCameraAnimName $22A
#cmd E3DGetCameraAnimName $22B
#cmd E3DSetCameraAnimType $22C
#cmd E3DGetCameraAnimType $22D
#cmd E3DSetCameraKey $22E
#cmd E3DGetCameraKey $22F
#cmd E3DDeleteCameraKey $230
#cmd E3DGetCameraKeyframeNoRange $231
#cmd E3DSetCameraSWKey $232
#cmd E3DGetCameraSWKey $233
#cmd E3DDeleteCameraSWKey $234
#cmd E3DGetCameraSWKeyframeNoRange $235

#cmd E3DSetOrtho $236

#cmd E3DLoadGPFile $237
#cmd E3DDestroyGPAnim $238
#cmd E3DSaveGPFile $239
#cmd E3DSetGPAnimNo $23A
#cmd E3DGetGPAnimNo $23B
#cmd E3DSetGPFrameNo $23C
#cmd E3DGetGPFrameNo $23D
#cmd E3DSetNewGP $23E
#cmd E3DSetNextGPAnimFrameNo $23F
#cmd E3DGetNextGPAnimFrameNo $240
#cmd E3DCreateNewGPAnim $241
#cmd E3DSetGPFrameNum $242
#cmd E3DGetGPFrameNum $243
#cmd E3DSetGPAnimName $244
#cmd E3DGetGPAnimName $245
#cmd E3DSetGPAnimType $246
#cmd E3DGetGPAnimType $247
#cmd E3DSetGPKey $248
#cmd E3DGetGPKey $249
#cmd E3DDeleteGPKey $24A
#cmd E3DGetGPKeyframeNoRange $24B
#cmd E3DCalcGPFullFrame $24C
#cmd E3DSetGPGroundHSID $24D
#cmd E3DGetGPGroundHSID $24E

#cmd E3DLoadMOEFile $24F
#cmd E3DDestroyMOEAnim $250
#cmd E3DSaveMOEFile $251
#cmd E3DSetMOEAnimNo $252
#cmd E3DGetMOEAnimNo $253
#cmd E3DSetMOEFrameNo $254
#cmd E3DGetMOEFrameNo $255
#cmd E3DSetNewMOE $256
#cmd E3DSetNextMOEAnimFrameNo $257
#cmd E3DGetNextMOEAnimFrameNo $258
#cmd E3DCreateNewMOEAnim $259
#cmd E3DSetMOEFrameNum $25A
#cmd E3DGetMOEFrameNum $25B
#cmd E3DSetMOEAnimName $25C
#cmd E3DGetMOEAnimName $25D
#cmd E3DSetMOEAnimType $25E
#cmd E3DGetMOEAnimType $25F
#cmd E3DGetMOEKeyframeNoRange $260
#cmd E3DGetMOEElemNum $261
#cmd E3DGetMOEElem $262
#cmd E3DAddMOEElem $263
#cmd E3DDeleteMOEElem $264
#cmd E3DSetMOEKeyIdling $265
#cmd E3DGetMOEKeyIdling $266
#cmd E3DDeleteMOEKey $267
#cmd E3DCalcMOEFullFrame $268

#cmd E3DUpdateSound $269
#cmd E3DGetSoundSamplesPlayed $26A
#cmd E3DSet3DSoundEmiDist $26B 
#cmd E3DFadeSound $26C

#cmd E3DGlobalToLocalParBone $26D
#cmd E3DLocalToGlobalParBone $26E

#cmd E3DGetBoneTra $26F
#cmd E3DGetBoneScale $270
#cmd E3DSetBoneTra $271
#cmd E3DSetBoneScale $272
#cmd E3DCreateMotionPoint $273
#cmd E3DSet3DSoundDopplerScaler $274
#cmd E3DGet3DSoundDopplerScaler $275
#cmd E3DLoadMQOFileAsChara $276

#cmd E3DLoadSSF $277
#cmd E3DDestroyAllSoundSet $278
#cmd E3DGetSoundSetNum $279
#cmd E3DGetSoundSetInfo $27A
#cmd E3DGetSoundSetBGM $27B
#cmd E3DLoadSAF $27C
#cmd E3DDestroyAllSndAnim $27D
#cmd E3DGetSndAnimFrameNum $27E
#cmd E3DGetSndAnimBGM $27F
#cmd E3DGetSndAnimFPS $280
#cmd E3DGetSndAnimMode $281
#cmd E3DStartSndAnim $282
#cmd E3DSetSndAnimFrameNo $283
#cmd E3DStopSndAnim $284
#cmd E3DGetSoundTotalTime $285
#cmd E3DConvSoundSampleToFrame $286
#cmd E3DGetSoundStartCnt $287
#cmd E3DGetSoundEndCnt $288
#cmd E3DPCWait $289
#cmd E3DSetCameraOffset $28A

#cmd E3DAllClearInfElem $28B
#cmd E3DExtractParts $28C
#cmd E3DSetGPOffset $28D
#cmd E3DSelectLightType $28E
#cmd E3DRenderZandN	$28F

#cmd E3DGetMaterialNum $290
#cmd E3DGetMaterialInfo $291

#cmd E3DGetMOELocalMotionFrameNo $292
#cmd E3DGetMOELocalNextMotionFrameNo $293

#cmd E3DSetMotionBlurMaxAlpha $294
#cmd E3DSetMoeKeyGoOnFlag $295
#cmd E3DGetMoeKeyGoOnFlag $296
#cmd E3DSetMaterial1stTex $297
#cmd E3DGetMaterial1stTex $298
#cmd E3DGetMOATrunkNotComID	$299
#cmd E3DSetMOATrunkNotComID $29A
#cmd E3DGetZa3Euler $29B
#cmd E3DSetZa3Euler $29C
#cmd E3DGetMOELocalMotionFrameNoML $29D
#cmd E3DGetMOELocalNextMotionFrameNoML $29E
#cmd E3DSetDefaultCamera $29F
#cmd E3DSetDefaultGP $300
#cmd E3DValidHsid $301
#cmd E3DGetInViewFlag $302
#cmd E3DWriteBmpFromSurface $303


#cmd E3DKinectLoadLib $304
#cmd E3DKinectSetChara $305
#cmd E3DKinectStartCapture $306
#cmd E3DKinectEndCapture $307
#cmd E3DKinectIsTracking $308
#cmd E3DKinectGetSkelPos $309
#cmd E3DKinectSetSkelPos $30A
#cmd E3DKinectRenderSilhouette $30B

#cmd E3DGetMotionJumpFrame $30C
#cmd E3DSetMotionJumpFrame $30D

;////////////////////////////////////////////////////////////
; E3DGetInfElem, E3DSetInfElemで使用する定数
;////////////////////////////////////////////////////////////
#define global CALCMODE_NOSKIN0	0
#define global CALCMODE_ONESKIN0	1
#define global CALCMODE_ONESKIN1	2
#define global CALCMODE_DIRECT0	3
#define global CALCMODE_SYM		4

#define global PAINT_NOR	0
#define global PAINT_EXC	1
#define global PAINT_ADD	2
#define global PAINT_SUB	3
#define global PAINT_ERA	4


;////////////////////////////////////////////////////////////
; E3DSetLightBlendMode, E3DGetLightBlendMode で使用する定数
;////////////////////////////////////////////////////////////
#define global LBLEND_MULT 		0
#define global LBLEND_SCREEN 		1
#define global LBLEND_OVERLAY		2
#define global LBLEND_HARDLIGHT	3
#define global LBLEND_DODGE		4

;//////////////////////////////////////////////////////
; E3DSetShaderType, E3DGetShaderTypeで使用する定数
;//////////////////////////////////////////////////////

#define global COL_OLD 0
#define global COL_PHONG 1
#define global COL_BLINN 2
#define global COL_SCHLICK 3
#define global COL_MQCLASSIC 4
#define global COL_TOON0	5
#define global COL_TOON1	6
#define global COL_PPHONG	7

#define global OVERFLOW_CLAMP 0
#define global OVERFLOW_SCALE 1
#define global OVERFLOW_ORG 2


;///////////////////////////////////////////////
; E3DCreateTextureで使用する定数
;///////////////////////////////////////////////
#define global D3DPOOL_DEFAULT		0
#define global D3DPOOL_MANAGED		1
#define global D3DPOOL_SYSTEMMEM	2


;///////////////////////////////////////////////
; E3DSetMPInfo, E3DGetMPInfoで使用する定数
;///////////////////////////////////////////////
#define global MPI_QUA		0
#define global MPI_TRAX		1
#define global MPI_TRAY		2
#define global MPI_TRAZ		3
#define global MPI_FRAMENO	4
#define global MPI_DISPSWITCH	5
#define global MPI_INTERP	6
#define global MPI_SCALEX	7
#define global MPI_SCALEY	8
#define global MPI_SCALEZ	9
#define global MPI_USERINT1	10
#define global MPI_SCALEDIV	11
#define global MPI_MAX		12


;//////////////////////////////////////////////
; E3DPlaySound　の　boundaryflagに使用するための定数。
;//////////////////////////////////////////////
#define global DMUS_SEGF_BEAT		(1 << 12)
#define global DMUS_SEGF_DEFAULT	(1 << 14)
#define global DMUS_SEGF_GRID		(1 << 11)
#define global DMUS_SEGF_MEASURE	(1 << 13)
#define global DMUS_SEGF_QUEUE		(1 << 8)
#define global DMUS_SEGF_SEGMENTEND	(1 << 23)


;///////////////////////////////////////////////
; JI_　で始まる定数は、
; E3DGetJointInfoで使用するための、定数です。
;///////////////////////////////////////////////
#define global JI_SERIAL 	0 
#define global JI_NOTUSE	1
#define global JI_PARENT	2
#define global JI_CHILD		3
#define global JI_BROTHER	4
#define global JI_SISTER	5
#define global JI_MAX		6


;///////////////////////////////////////////////
; DOI_　で始まる定数は、
; E3DGetDispObjInfoで使用するための、定数です。
;///////////////////////////////////////////////

#define global DOI_SERIAL	0
#define global DOI_NOTUSE	1
#define global DOI_DISPSWITCH	2
#define global DOI_INVISIBLE	3
#define global DOI_MAX		4


;//////////////////////////////////////////////
; D3DRS_　で始まる定数は、
; E3DSetRenderStateで使用するための、定数です。
;//////////////////////////////////////////////

#define global D3DRS_ZENABLE                      7
#define global D3DRS_FILLMODE                     8
#define global D3DRS_SHADEMODE                    9
#define global D3DRS_LINEPATTERN                 10
#define global D3DRS_ZWRITEENABLE                14
#define global D3DRS_ALPHATESTENABLE             15
#define global D3DRS_LASTPIXEL                   16
#define global D3DRS_SRCBLEND                    19
#define global D3DRS_DESTBLEND                   20
#define global D3DRS_CULLMODE                    22
#define global D3DRS_ZFUNC                       23
#define global D3DRS_ALPHAREF                    24
#define global D3DRS_ALPHAFUNC                   25
#define global D3DRS_DITHERENABLE                26
#define global D3DRS_ALPHABLENDENABLE            27
#define global D3DRS_FOGENABLE                   28
#define global D3DRS_SPECULARENABLE              29
#define global D3DRS_ZVISIBLE                    30
#define global D3DRS_FOGCOLOR                    34
#define global D3DRS_FOGTABLEMODE                35
#define global D3DRS_FOGSTART                    36
#define global D3DRS_FOGEND                      37
#define global D3DRS_FOGDENSITY                  38
#define global D3DRS_EDGEANTIALIAS               40
#define global D3DRS_ZBIAS                       47
#define global D3DRS_RANGEFOGENABLE              48

#define global D3DRS_STENCILENABLE               52
#define global D3DRS_STENCILFAIL                 53
#define global D3DRS_STENCILZFAIL                54
#define global D3DRS_STENCILPASS                 55
#define global D3DRS_STENCILFUNC                 56
#define global D3DRS_STENCILREF                  57
#define global D3DRS_STENCILMASK                 58
#define global D3DRS_STENCILWRITEMASK            59
#define global D3DRS_TEXTUREFACTOR               60

#define global D3DRS_WRAP0                      128
#define global D3DRS_WRAP1                      129
#define global D3DRS_WRAP2                      130
#define global D3DRS_WRAP3                      131
#define global D3DRS_WRAP4                      132
#define global D3DRS_WRAP5                      133
#define global D3DRS_WRAP6                      134
#define global D3DRS_WRAP7                      135
#define global D3DRS_CLIPPING                   136
#define global D3DRS_LIGHTING                   137
#define global D3DRS_AMBIENT                    139
#define global D3DRS_FOGVERTEXMODE              140
#define global D3DRS_COLORVERTEX                141
#define global D3DRS_LOCALVIEWER                142
#define global D3DRS_NORMALIZENORMALS           143
#define global D3DRS_DIFFUSEMATERIALSOURCE      145
#define global D3DRS_SPECULARMATERIALSOURCE     146
#define global D3DRS_AMBIENTMATERIALSOURCE      147
#define global D3DRS_EMISSIVEMATERIALSOURCE     148
#define global D3DRS_VERTEXBLEND                151
#define global D3DRS_CLIPPLANEENABLE            152

#define global D3DRS_SOFTWAREVERTEXPROCESSING   153

#define global D3DRS_POINTSIZE                  154
#define global D3DRS_POINTSIZE_MIN              155
#define global D3DRS_POINTSPRITEENABLE          156

#define global D3DRS_POINTSCALEENABLE           157
#define global D3DRS_POINTSCALE_A               158
#define global D3DRS_POINTSCALE_B               159
#define global D3DRS_POINTSCALE_C               160

#define global D3DRS_MULTISAMPLEANTIALIAS       161
#define global D3DRS_MULTISAMPLEMASK            162

#define global D3DRS_PATCHEDGESTYLE             163
#define global D3DRS_PATCHSEGMENTS              164

#define global D3DRS_DEBUGMONITORTOKEN          165
#define global D3DRS_POINTSIZE_MAX              166
#define global D3DRS_INDEXEDVERTEXBLENDENABLE   167
#define global D3DRS_COLORWRITEENABLE           168
#define global D3DRS_TWEENFACTOR                170
#define global D3DRS_BLENDOP                    171




;//////////////////////////////////////////////////////////
;VK_ で始まる定数は、
;E3DGetKeyboardState 用の、バーチャルキー情報を表す、定数です。
; Windowsの、WinUser.h　と同様のものです。
;//////////////////////////////////////////////////////////

#define global VK_LBUTTON        $01	;マウス　左クリック
#define global VK_RBUTTON        $02	;マウス　右クリック
#define global VK_CANCEL         $03
#define global VK_MBUTTON        $04    ;/* NOT contiguous with L & RBUTTON */

;/*
; * $07 : unassigned
;*/

#define global VK_BACK           $08
#define global VK_TAB            $09

;/*
; * $0A - $0B : reserved
; */

#define global VK_CLEAR          $0C
#define global VK_RETURN         $0D

#define global VK_SHIFT          $10
#define global VK_CONTROL        $11
#define global VK_MENU           $12
#define global VK_PAUSE          $13
#define global VK_CAPITAL        $14

#define global VK_KANA           $15
#define global VK_HANGEUL        $15  ;/* old name - should be here for compatibility */
#define global VK_HANGUL         $15
#define global VK_JUNJA          $17
#define global VK_FINAL          $18
#define global VK_HANJA          $19
#define global VK_KANJI          $19

#define global VK_ESCAPE         $1B	;エスケープキー

#define global VK_CONVERT        $1C
#define global VK_NONCONVERT     $1D
#define global VK_ACCEPT         $1E
#define global VK_MODECHANGE     $1F

#define global VK_SPACE          $20	;スペースキー
#define global VK_PRIOR          $21
#define global VK_NEXT           $22
#define global VK_END            $23
#define global VK_HOME           $24
#define global VK_LEFT           $25	;左矢印キー
#define global VK_UP             $26	;上矢印キー
#define global VK_RIGHT          $27	;右矢印キー
#define global VK_DOWN           $28	;下矢印キー
#define global VK_SELECT         $29
#define global VK_PRINT          $2A
#define global VK_EXECUTE        $2B
#define global VK_SNAPSHOT       $2C
#define global VK_INSERT         $2D
#define global VK_DELETE         $2E
#define global VK_HELP           $2F

;/*
; * VK_0 - VK_9 are the same as ASCII '0' - '9' ($30 - $39)
; * $40 : unassigned
; * VK_A - VK_Z are the same as ASCII 'A' - 'Z' ($41 - $5A)
; */

#define global VK_LWIN           $5B
#define global VK_RWIN           $5C
#define global VK_APPS           $5D

;/*
; * $5E : reserved
; */

#define global VK_SLEEP          $5F

#define global VK_NUMPAD0        $60	;テンキーの０
#define global VK_NUMPAD1        $61	;テンキーの１
#define global VK_NUMPAD2        $62	;テンキーの２
#define global VK_NUMPAD3        $63	;テンキーの３
#define global VK_NUMPAD4        $64	;テンキーの４
#define global VK_NUMPAD5        $65	;テンキーの５
#define global VK_NUMPAD6        $66	;テンキーの６
#define global VK_NUMPAD7        $67	;テンキーの７
#define global VK_NUMPAD8        $68	;テンキーの８
#define global VK_NUMPAD9        $69	;テンキーの９
#define global VK_MULTIPLY       $6A
#define global VK_ADD            $6B
#define global VK_SEPARATOR      $6C
#define global VK_SUBTRACT       $6D
#define global VK_DECIMAL        $6E
#define global VK_DIVIDE         $6F
#define global VK_F1             $70
#define global VK_F2             $71
#define global VK_F3             $72
#define global VK_F4             $73
#define global VK_F5             $74
#define global VK_F6             $75
#define global VK_F7             $76
#define global VK_F8             $77
#define global VK_F9             $78
#define global VK_F10            $79
#define global VK_F11            $7A
#define global VK_F12            $7B
#define global VK_F13            $7C
#define global VK_F14            $7D
#define global VK_F15            $7E
#define global VK_F16            $7F
#define global VK_F17            $80
#define global VK_F18            $81
#define global VK_F19            $82
#define global VK_F20            $83
#define global VK_F21            $84
#define global VK_F22            $85
#define global VK_F23            $86
#define global VK_F24            $87

;/*
; * $88 - $8F : unassigned
; */

#define global VK_NUMLOCK        $90
#define global VK_SCROLL         $91

;/*
; * NEC PC-9800 kbd definitions
; */
#define global VK_OEM_NEC_EQUAL  $92   ;// '=' key on numpad

;/*
; * Fujitsu/OASYS kbd definitions
; */
#define global VK_OEM_FJ_JISHO   $92   ;// 'Dictionary' key
#define global VK_OEM_FJ_MASSHOU $93   ;// 'Unregister word' key
#define global VK_OEM_FJ_TOUROKU $94   ;// 'Register word' key
#define global VK_OEM_FJ_LOYA    $95   ;// 'Left OYAYUBI' key
#define global VK_OEM_FJ_ROYA    $96   ;// 'Right OYAYUBI' key

;/*
; * $97 - $9F : unassigned
; */

;/*
; * VK_L* & VK_R* - left and right Alt, Ctrl and Shift virtual keys.
; * Used only as parameters to GetAsyncKeyState() and GetKeyState().
; * No other API or message will distinguish left and right keys in this way.
; */
#define global VK_LSHIFT         $A0
#define global VK_RSHIFT         $A1
#define global VK_LCONTROL       $A2
#define global VK_RCONTROL       $A3
#define global VK_LMENU          $A4
#define global VK_RMENU          $A5


;/*
; * $B8 - $B9 : reserved
; */

#define global VK_OEM_1          $BA   ;// ';:' for US
#define global VK_OEM_PLUS       $BB   ;// '+' any country
#define global VK_OEM_COMMA      $BC   ;// ',' any country
#define global VK_OEM_MINUS      $BD   ;// '-' any country
#define global VK_OEM_PERIOD     $BE   ;// '.' any country
#define global VK_OEM_2          $BF   ;// '/?' for US
#define global VK_OEM_3          $C0   ;// '`~' for US

;/*
; * $C1 - $D7 : reserved
; */

;/*
; * $D8 - $DA : unassigned
; */

#define global VK_OEM_4          $DB  ;//  '[{' for US
#define global VK_OEM_5          $DC  ;//  '\|' for US
#define global VK_OEM_6          $DD  ;//  ']}' for US
#define global VK_OEM_7          $DE  ;//  ''"' for US
#define global VK_OEM_8          $DF

;/*
; * $E0 : reserved
; */

;/*
; * Various extended or enhanced keyboards
; */
#define global VK_OEM_AX         $E1  ;//  'AX' key on Japanese AX kbd
#define global VK_OEM_102        $E2  ;//  "<>" or "\|" on RT 102-key kbd.
#define global VK_ICO_HELP       $E3  ;//  Help key on ICO
#define global VK_ICO_00         $E4  ;//  00 key on ICO


#define global VK_ICO_CLEAR      $E6

;/*
; * $E8 : unassigned
; */

;/*
; * Nokia/Ericsson definitions
; */
#define global VK_OEM_RESET      $E9
#define global VK_OEM_JUMP       $EA
#define global VK_OEM_PA1        $EB
#define global VK_OEM_PA2        $EC
#define global VK_OEM_PA3        $ED
#define global VK_OEM_WSCTRL     $EE
#define global VK_OEM_CUSEL      $EF
#define global VK_OEM_ATTN       $F0
#define global VK_OEM_FINISH     $F1
#define global VK_OEM_COPY       $F2
#define global VK_OEM_AUTO       $F3
#define global VK_OEM_ENLW       $F4
#define global VK_OEM_BACKTAB    $F5

#define global VK_ATTN           $F6
#define global VK_CRSEL          $F7
#define global VK_EXSEL          $F8
#define global VK_EREOF          $F9
#define global VK_PLAY           $FA
#define global VK_ZOOM           $FB
#define global VK_NONAME         $FC
#define global VK_PA1            $FD
#define global VK_OEM_CLEAR      $FE


;/////////////////////////////////////////////////////////////////
; 以下は、ミップマップ設定関数、E3DSetMipMapParamsに使用する定数です。
;　DirectX SDK d3dx8tex.h　より
;/////////////////////////////////////////////////////////////////

#define global D3DX_FILTER_NONE            (1 << 0)
#define global D3DX_FILTER_POINT           (2 << 0)
#define global D3DX_FILTER_LINEAR          (3 << 0)
#define global D3DX_FILTER_TRIANGLE        (4 << 0)
#define global D3DX_FILTER_BOX             (5 << 0)

#define global D3DX_FILTER_MIRROR_U        (1 << 16)
#define global D3DX_FILTER_MIRROR_V        (2 << 16)
#define global D3DX_FILTER_MIRROR_W        (4 << 16)
#define global D3DX_FILTER_MIRROR          (7 << 16)
#define global D3DX_FILTER_DITHER          (8 << 16)


;/////////////////////////////////////////////////////
;
;　　以下は、moaのイベント番号用の２の乗数の値
;
;/////////////////////////////////////////////////////
dim POW2X, 30
POW2X = 1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216,33554432,67108864,134217728,268435456,536870912


;/////////////////////////////////////////
; E3DSetTextureMinMagFilter 用の　テクスチャーフィルターモード 
;/////////////////////////////////////////

#define global D3DTEXF_NONE	0
#define global D3DTEXF_POINT	1
#define global D3DTEXF_LINEAR	2
#define global D3DTEXF_ANISOTROPIC	3
#define global D3DTEXF_PYRAMIDALQUAD	6
#define global D3DTEXF_GAUSSIANQUAD	7

;//////////////////////////////////////////
#define global D3DCMP_NEVER	1
#define global D3DCMP_LESS	2
#define global D3DCMP_EQUAL	3
#define global D3DCMP_LESSEQUAL	4
#define global D3DCMP_GREATER	5
#define global D3DCMP_NOTEQUAL	6
#define global D3DCMP_GREATEREQUAL	7
#define global D3DCMP_ALWAYS	8

;/////////////////////////////////////////
; E3DLoadMQOFileAsGround 用のボーンタイプ
;/////////////////////////////////////////

#define global BONETYPE_RDB2	0
#define global BONETYPE_MIKO	1


;//////////////////////////////////////////
; E3DGetMOATrunkInfoで使用するデータタイプ
;//////////////////////////////////////////

#define global MOAT_IDLING		0
#define global MOAT_EV0IDLE		1
#define global MOAT_COMID		2
#define global MOAT_NOTCOMID	3
#define global MOAT_BRANCHNUM	4
#define global MOAT_MAX			5

;//////////////////////////////////////////
; E3DGetMOABranchInfoで使用するデータタイプ
;//////////////////////////////////////////

#define global MOAB_MOTID	0
#define global MOAB_EVENTID	1
#define global MOAB_FRAME1	2
#define global MOAB_FRAME2	3
#define global MOAB_NOTFU	4
#define global MOAB_MAX		5

;//////////////////////////////////////////
; E3DSetMaterialMode用
://////////////////////////////////////////

#define global MMODE_VERTEX	0
#define global MMODE_FACE	1

;//////////////////////////////////////////
; E3DGetDispSwitch2用
;//////////////////////////////////////////

#define global DISPSWITCHNUM	100

;////////////////////////////////////////
; E3DCheckRTFormat用
;////////////////////////////////////////

#define global D3DFMT_R8G8B8 20
#define global D3DFMT_A8R8G8B8 21
#define global D3DFMT_X8R8G8B8 22
#define global D3DFMT_R5G6B5 23
#define global D3DFMT_X1R5G5B5 24
#define global D3DFMT_A1R5G5B5 25
#define global D3DFMT_A4R4G4B4 26
#define global D3DFMT_A16B16G16R16F 113
#define global D3DFMT_R32F 114 
#define global D3DFMT_A32B32G32R32F 116

;//////////////////////////////////////////
; E3DSetShadowMapInterFlag用
;//////////////////////////////////////////

#define global SHADOWIN_PROJ	0
#define global SHADOWIN_ALWAYS	1
#define global SHADOWIN_NOT		2
#define global SHADOWIN_EXCLUDE	3

;//////////////////////////////////////////
; E3DSetSymInfElemで使用
;//////////////////////////////////////////
#define global SYMAXIS_X	1
#define global SYMAXIS_Y	2
#define global SYMAXIS_Z	3

;//////////////////////////////////////////
; quaファイル書き出し命令で使用
;//////////////////////////////////////////
#define global QUATYPE_NUM	0
#define global QUATYPE_NAME	1

;//////////////////////////////////////////
; E3DSetMotionBlurで使用
;//////////////////////////////////////////
#define global BLUR_NONE	0
#define global BLUR_WORLD	1
#define global BLUR_CAMERA	2

;//////////////////////////////////////////
; E3DBlendRTTextureで使用
;//////////////////////////////////////////

#define global D3DBLENDOP_ADD			1
#define global D3DBLENDOP_SUBTRACT		2
#define global D3DBLENDOP_REVSUBTRACT	3

#define global D3DBLEND_ZERO				1
#define global D3DBLEND_ONE					2
#define global D3DBLEND_SRCCOLOR			3
#define global D3DBLEND_INVSRCCOLOR			4
#define global D3DBLEND_SRCALPHA			5
#define global D3DBLEND_INVSRCALPHA			6
#define global D3DBLEND_DESTALPHA			7
#define global D3DBLEND_INVDESTALPHA		8
#define global D3DBLEND_DESTCOLOR			9
#define global D3DBLEND_INVDESTCOLOR		10
#define global D3DBLEND_SRCALPHASAT			11
#define global D3DBLEND_BOTHSRCALPHA		12
#define global D3DBLEND_BOTHINVSRCALPHA		13
#define global D3DBLEND_BLENDFACTOR			14
#define global D3DBLEND_INVBLENDFACTOR		15

;///////////////////////////////////////////
; E3DSetMaterialGlowParams
;///////////////////////////////////////////

#define global GLOW_NONE	0
#define global GLOW_NORMAL	1
#define global GLOW_ALPHA	2

;///////////////////////////////////////////
; E3DGetMorphBaseInfo
;///////////////////////////////////////////

#define global MBI_DISPNO		0
#define global MBI_BONENO		1
#define global MBI_TARGETNUM	2
#define global MBI_MAX			3

;///////////////////////////////////////////
; E3DGetToon1Material
;///////////////////////////////////////////
#define global TMD_DIFFUSE_R		0
#define global TMD_DIFFUSE_G		1
#define global TMD_DIFFUSE_B		2
#define global TMD_SPECULAR_R	3
#define global TMD_SPECULAR_G	4
#define global TMD_SPECULAR_B	5
#define global TMD_AMBIENT_R		6
#define global TMD_AMBIENT_G		7
#define global TMD_AMBIENT_B		8
#define global TMD_DARKNL		9
#define global TMD_BRIGHTNL		10
#define global TMD_EDGECOL0_R	11
#define global TMD_EDGECOL0_G	12
#define global TMD_EDGECOL0_B	13
#define global TMD_EDGEWIDTH0	14
#define global TMD_MAX			15

#define global TMI_VALID0		0
#define global TMI_INV0			1
#define global TMI_MAX			2

;////////////////////////////////////////////
; CameraAnime
;////////////////////////////////////////////

#define global CAMI_LOOKTYPE	0
#define global CAMI_HSID		1
#define global CAMI_BONENO		2
#define global CAMI_ORTHO		3
#define global CAMI_INTERP		4
#define global CAMI_MAX			5

#define global CAMD_POSX		0
#define global CAMD_POSY		1
#define global CAMD_POSZ		2
#define global CAMD_TARX		3
#define global CAMD_TARY		4
#define global CAMD_TARZ		5
#define global CAMD_UPX			6
#define global CAMD_UPY			7
#define global CAMD_UPZ			8
#define global CAMD_DIST		9
#define global CAMD_NEARZ		10
#define global CAMD_FARZ		11
#define global CAMD_FOV			12
#define global CAMD_ORTHOSIZE	13
#define global CAMD_MAX			14

#define global CAML_NORMAL		0
#define global CAML_LOOKONCE	1
#define global CAML_LOCK		2
#define global CAML_MAX			3

;/////////////////////////////////////////////
; GPAnim
;/////////////////////////////////////////////

#define global GPI_ONGMODE		0
#define global GPI_INTERP		1
#define global GPI_MAX			2

#define global GPD_POSX			0
#define global GPD_POSY			1
#define global GPD_POSZ			2
#define global GPD_ROTX			3
#define global GPD_ROTY			4
#define global GPD_ROTZ			5
#define global GPD_RAYY			6
#define global GPD_RAYLENG		7
#define global GPD_OFFSETY		8
#define global GPD_MAX			9

#define global GROUND_NONE		0
#define global GROUND_ONE		1
#define global GROUND_ON		2
#define global GROUND_MAX		3

;//////////////////////////////////////////
; MOEAnim
;//////////////////////////////////////////

#define global MOELISTLENG	15

#define global MOEI_LISTNUM		0
#define global MOEI_NOTLISTNUM	1
#define global MOEI_EVENTNO		2
#define global MOEI_MAX			3

;////////////////////////////////////////////
; MaterialInfo
;/////////////////////////////////////////////

#define global MII_MATNO	0
#define global MII_DIFFR	1
#define global MII_DIFFG	2
#define global MII_DIFFB	3
#define global MII_SPCR	4
#define global MII_SPCG	5
#define global MII_SPCB	6
#define global MII_AMBR	7
#define global MII_AMBG	8
#define global MII_AMBB	9
#define global MII_EMIR	10
#define global MII_EMIG	11
#define global MII_EMIB	12
#define global MII_MAX		13

#define global MID_ALPHA	0
#define global MID_POWER	1
#define global MID_MAX		2

/***
typedef struct tag_materialinfo
{
	int materialno;
	char name[256];
	float alpha;
	E3DCOLOR4UC diffuse;
	E3DCOLOR4UC specular;
	E3DCOLOR4UC ambient;
	E3DCOLOR4UC emissive;
	float power;
} MATERIALINFO;
***/

;/////////////////////////////////
; for kinect
;////////////////////////////////

#define global CAPMODE_ALL	0
#define global CAPMODE_ONE	1

#define global POSMODE_TOPOFJOINT	0
#define global POSMODE_GLOBAL		1
#define global POSMODE_ZERO			2

#define global SKEL_TOPOFJOINT		0
#define global SKEL_TORSO			1
#define global SKEL_LEFT_HIP		2
#define global SKEL_LEFT_KNEE		3
#define global SKEL_LEFT_FOOT		4
#define global SKEL_RIGHT_HIP		5
#define global SKEL_RIGHT_KNEE		6
#define global SKEL_RIGHT_FOOT		7
#define global SKEL_NECK			8
#define global SKEL_HEAD			9
#define global SKEL_LEFT_SHOULDER	10
#define global SKEL_LEFT_ELBOW		11
#define global SKEL_LEFT_HAND		12
#define global SKEL_RIGHT_SHOULDER	13
#define global SKEL_RIGHT_ELBOW		14
#define global SKEL_RIGHT_HAND		15
#define global SKEL_MAX				16


