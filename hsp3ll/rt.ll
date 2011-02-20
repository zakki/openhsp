%struct.HSPCTX = type { %struct.HSPHED*, i16*, i16*, i8*, i8*, i32*, %struct.IRQDAT*, i32, i32, i32, i32, %struct.PVal*, %struct.HSPEXINFO30, i32, i32, i32, i32, i32, i32, [32 x %struct.LOOPDAT], i32, i32, i32, i32, i32, i8*, i8*, i8*, i32, %struct.PVal*, i32, %struct.PVal*, i32, i8*, i8*, %struct.LIBDAT*, %struct.STRUCTPRM*, %struct.STRUCTDAT*, i32, i32, void (%struct.HSPCTX*)*, i8*, double, i8*, %struct.HSPEXINFO* }
%struct.HSPEXINFO = type { i16, i16, i32*, i8*, i8*, %struct.PVal**, i32*, i32*, i32*, i32*, i8*, i8* ()*, i32 ()*, i32 (i32)*, i8* ()*, i8* (i8*)*, i32 (%struct.PVal*, i32, i32)*, i32 (i8*, i8*, i32, i32)*, i32 (i8*)*, i8* (i32)*, i32 (i32, i32, i8*)*, i32 (i32, i32, i8*)*, i32*, %struct.HSPCTX*, i32 (i32)*, void (i32)*, %struct.HspVarProc* (i32)*, %struct.HspVarProc* (i8*)*, void ()*, i32 ()*, double ()*, double (double)*, i16* ()*, %struct.PVal* ()*, i32 (%struct.PVal**)*, void (%struct.PVal*, i32, i32, i8*)*, i8* (i32)*, void (i8*)*, i8* (i8*, i32)*, %struct.IRQDAT* ()*, i32 (i32, i32, i32, i8*)*, void (i32, void (%struct.HspVarProc*)*)*, void (i16*)*, void (i16*)*, void (%struct.PVal*, i32)*, void (%struct.PVal*, i32, i32, i32, i32, i32, i32)*, void (%struct.PVal*, i32, i32)*, void (%struct.PVal*, i32)*, i8* (i32)*, i32 (i8*)* }
%struct.HSPEXINFO30 = type { i16, i16, i32*, i8*, i8*, %struct.PVal**, i32*, i32*, i32*, i32*, i8*, i8* ()*, i32 ()*, i32 (i32)*, i8* ()*, i8* (i8*)*, i32 (%struct.PVal*, i32, i32)*, i32 (i8*, i8*, i32, i32)*, i32 (i8*)*, i8* (i32)*, i32 (i32, i32, i8*)*, i32 (i32, i32, i8*)*, i32*, %struct.HSPCTX*, i32 (i32)*, void (i32)*, %struct.HspVarProc* (i32)*, %struct.HspVarProc* (i8*)*, void ()*, i32 ()*, double ()*, double (double)*, i16* ()*, %struct.PVal* ()*, i32 (%struct.PVal**)*, void (%struct.PVal*, i32, i32, i8*)*, i8* (i32)*, void (i8*)*, i8* (i8*, i32)*, %struct.IRQDAT* ()*, i32 (i32, i32, i32, i8*)*, void (i32, void (%struct.HspVarProc*)*)*, void (i16*)*, void (i16*)*, void (%struct.PVal*, i32)*, void (%struct.PVal*, i32, i32, i32, i32, i32, i32)*, void (%struct.PVal*, i32, i32)*, void (%struct.PVal*, i32)* }
%struct.HSPHED = type { i8, i8, i8, i8, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16, i16, i32, i32 }
%struct.HspVarProc = type { i16, i16, i16, i16, i16, i16, i8*, i8*, i8* (i8*, i32)*, i8* (i8*, i32)*, i8** (%struct.PVal*)*, i8* (%struct.PVal*, i32*)*, void (%struct.PVal*)*, void (%struct.PVal*, i8*, i32)*, void (%struct.PVal*)*, void (%struct.PVal*, %struct.PVal*)*, void (%struct.PVal*)*, i32 (i8**)*, i32 (i8**)*, i8* (%struct.PVal*, i8**, i32*)*, void (%struct.PVal*, i8**, i32)*, void (%struct.PVal*, i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)*, void (i8**, i8*)* }
%struct.IRQDAT = type { i16, i16, i32, i32, i32, i16*, void (%struct.IRQDAT*, i32, i32)* }
%struct.LIBDAT = type { i32, i32, i8*, i32 }
%struct.LOOPDAT = type { i32, i32, i32, i16* }
%struct.PVal = type { i16, i16, [5 x i32], i32, i8*, i8*, i16, i16, i32, i32 }
%struct.STRUCTDAT = type { i16, i16, i32, i32, i32, i32, i32, %"struct.STRUCTDAT::._34" }
%"struct.STRUCTDAT::._34" = type { i8* }
%struct.STRUCTPRM = type { i16, i16, i32 }

%struct.Hsp3 = type { %struct.HSPCTX, i8*, i8*, i32, i32, i32, i32 }

declare void @Prgcmd(i32, i32)
declare void @Modcmd(i32, i32)
declare void @PushVar(%struct.PVal*, i32)
declare void @CalcMulI()
declare void @VarSet(%struct.PVal*, i32, i32)
declare void @PushInt(i32)
declare void @CalcSubI()
declare void @PushDouble(double)
declare void @PushFuncEnd()

declare void @PushFuncPrm1(i32)
declare void @PushFuncPrmI(i32)
declare void @PushFuncPrmD(i32)
declare void @PushFuncPrm(i32, i32)
declare void @PushFuncPAP(i32, i32)
declare %struct.PVal* @FuncPrm(i32)
declare %struct.PVal* @LocalPrm(i32)

declare i32 @FuncPrmI(i32)
declare double @FuncPrmD(i32)

declare void @CalcAddI()
declare void @PushIntfunc(i32, i32)
declare void @CalcDivI()
declare void @PushVAP(%struct.PVal*, i32)
declare void @VarCalc(%struct.PVal*, i32, i32)
declare void @VarInc(%struct.PVal*, i32)
declare void @TaskSwitch(i32)
declare void @CalcEqI()
declare i8 @HspIf() zeroext
declare void @CalcGtI()
declare void @PushLabel(i32)
declare void @CalcLtI()
declare void @PushSysvar(i32, i32)
declare void @PushDllfunc(i32, i32)
declare void @PushModcmd(i32, i32)
declare void @Extcmd(i32, i32)
declare void @PushStr(i8*)
declare void @CalcAndI()
declare void @CalcNeI()
declare void @CalcGtEqI()
declare void @CalcXorI()
declare void @PushExtvar(i32, i32)
declare void @CalcRrI()
declare void @PushDefault()
declare void @Intcmd(i32, i32)
declare i32 @GetCurTaskId()
declare i32 @Hsp3rReset(%struct.Hsp3r*, i32, i32)
declare void @HspVarCoreArray2(%struct.PVal*, i32)

declare double @CallDoubleIntfunc(i32, i32)
declare i32 @CallIntIntfunc(i32, i32)
declare double @CallDoubleSysvar(i32, i32)
declare i32 @CallIntSysvar(i32, i32)

define void @ThrowCppException(i32) {
  ret void
}

@hspctx = external global %struct.HSPCTX*

define void @HspVarCoreReset(%struct.PVal* %a) {
  %1 = getelementptr %struct.PVal* %a, i32 0, i32 8
  store i32 0, i32* %1
  %2 = getelementptr %struct.PVal* %a, i32 0, i32 7
  store i16 0, i16* %2
  ret void
}

define i32 @HspVarCoreArray2b(%struct.PVal* %pval, i32 %offset) {
entry:
  %tmp2 = getelementptr %struct.PVal* %pval, i32 0, i32 7 ; <i16*> [#uses=2]
  %tmp3 = load i16* %tmp2, align 4                ; <i16> [#uses=4]
  %tmp4 = icmp sgt i16 %tmp3, 4                   ; <i1> [#uses=1]
  br i1 %tmp4, label %UnifiedReturnBlock, label %bb6

bb6:                                              ; preds = %entry
  %tmp10 = icmp eq i16 %tmp3, 0                   ; <i1> [#uses=1]
  %tmp15 = getelementptr %struct.PVal* %pval, i32 0, i32 9 ; <i32*> [#uses=2]
  br i1 %tmp10, label %bb31, label %bb16

bb16:                                             ; preds = %bb6
  %tmp19 = load i32* %tmp15, align 4              ; <i32> [#uses=1]
  %tmp2223 = sext i16 %tmp3 to i32                ; <i32> [#uses=1]
  %tmp26 = getelementptr %struct.PVal* %pval, i32 0, i32 2, i32 %tmp2223 ; <i32*> [#uses=1]
  %tmp27 = load i32* %tmp26, align 4              ; <i32> [#uses=1]
  %tmp28 = mul i32 %tmp27, %tmp19                 ; <i32> [#uses=2]
  br label %bb31

bb31:                                             ; preds = %bb16, %bb6
  %storemerge = phi i32 [ %tmp28, %bb16 ], [ 1, %bb6 ] ; <i32> [#uses=1]
  %tmp94.rle = phi i32 [ %tmp28, %bb16 ], [ 1, %bb6 ] ; <i32> [#uses=1]
  store i32 %storemerge, i32* %tmp15
  %tmp35 = add i16 %tmp3, 1                       ; <i16> [#uses=2]
  store i16 %tmp35, i16* %tmp2, align 4
  %tmp39 = icmp slt i32 %offset, 0                ; <i1> [#uses=1]
  br i1 %tmp39, label %UnifiedReturnBlock, label %bb43

bb43:                                             ; preds = %bb31
  %tmp4748 = sext i16 %tmp35 to i32               ; <i32> [#uses=1]
  %tmp51 = getelementptr %struct.PVal* %pval, i32 0, i32 2, i32 %tmp4748 ; <i32*> [#uses=1]
  %tmp52 = load i32* %tmp51, align 4              ; <i32> [#uses=1]
  %tmp54 = icmp sgt i32 %tmp52, %offset           ; <i1> [#uses=1]
  br i1 %tmp54, label %bb88, label %UnifiedReturnBlock

bb88:                                             ; preds = %bb43
  %tmp90 = getelementptr %struct.PVal* %pval, i32 0, i32 8 ; <i32*> [#uses=2]
  %tmp91 = load i32* %tmp90, align 4              ; <i32> [#uses=1]
  %tmp96 = mul i32 %tmp94.rle, %offset            ; <i32> [#uses=1]
  %tmp97 = add i32 %tmp96, %tmp91                 ; <i32> [#uses=1]
  store i32 %tmp97, i32* %tmp90, align 4
  ret i32 0

UnifiedReturnBlock:                               ; preds = %bb43, %bb31, %entry
  ret i32 7
}

define i32 @HspVarCoreArray2c(%struct.PVal* %pval, i32 %offset, i32 %arraycnt) {
entry:
  %tmp2 = icmp sgt i32 %arraycnt, 4               ; <i1> [#uses=1]
  br i1 %tmp2, label %UnifiedReturnBlock, label %bb4

bb4:                                              ; preds = %entry
  %tmp6 = icmp eq i32 %arraycnt, 0                ; <i1> [#uses=1]
  %tmp11 = getelementptr %struct.PVal* %pval, i32 0, i32 9 ; <i32*> [#uses=3]
  %tmp27 = icmp slt i32 %offset, 0                ; <i1> [#uses=2]
  br i1 %tmp6, label %bb9, label %bb12

bb9:                                              ; preds = %bb4
  store i32 1, i32* %tmp11, align 4
  br i1 %tmp27, label %UnifiedReturnBlock, label %bb31

bb12:                                             ; preds = %bb4
  %tmp15 = load i32* %tmp11, align 4              ; <i32> [#uses=1]
  %tmp19 = getelementptr %struct.PVal* %pval, i32 0, i32 2, i32 %arraycnt ; <i32*> [#uses=1]
  %tmp20 = load i32* %tmp19, align 4              ; <i32> [#uses=1]
  %tmp21 = mul i32 %tmp20, %tmp15                 ; <i32> [#uses=2]
  store i32 %tmp21, i32* %tmp11, align 4
  br i1 %tmp27, label %UnifiedReturnBlock, label %bb31

bb31:                                             ; preds = %bb12, %bb9
  %tmp74.rle = phi i32 [ 1, %bb9 ], [ %tmp21, %bb12 ] ; <i32> [#uses=1]
  %tmp33 = add i32 %arraycnt, 1                   ; <i32> [#uses=1]
  %tmp36 = getelementptr %struct.PVal* %pval, i32 0, i32 2, i32 %tmp33 ; <i32*> [#uses=1]
  %tmp37 = load i32* %tmp36, align 4              ; <i32> [#uses=1]
  %tmp39 = icmp sgt i32 %tmp37, %offset           ; <i1> [#uses=1]
  br i1 %tmp39, label %bb68, label %UnifiedReturnBlock

bb68:                                             ; preds = %bb31
  %tmp70 = getelementptr %struct.PVal* %pval, i32 0, i32 8 ; <i32*> [#uses=2]
  %tmp71 = load i32* %tmp70, align 4              ; <i32> [#uses=1]
  %tmp76 = mul i32 %tmp74.rle, %offset            ; <i32> [#uses=1]
  %tmp77 = add i32 %tmp76, %tmp71                 ; <i32> [#uses=1]
  store i32 %tmp77, i32* %tmp70, align 4
  ret i32 0

UnifiedReturnBlock:                               ; preds = %bb31, %bb12, %bb9, %entry
  ret i32 7
}

define void @Nop() {
  ret void
}

define i32 @llvmRtSysvar_000() {
entry:
  ret i32 0
}

define i32 @llvmRtSysvar_001() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 22 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_002() {
entry:
  ret i32 12808
}

define i32 @llvmRtSysvar_003() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 23 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_004() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=2]
  %tmp3 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 20 ; <i32*> [#uses=1]
  %tmp4 = load i32* %tmp3, align 4                ; <i32> [#uses=1]
  %tmp7 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 19, i32 %tmp4, i32 1 ; <i32*> [#uses=1]
  %tmp8 = load i32* %tmp7, align 4                ; <i32> [#uses=1]
  ret i32 %tmp8
}

define i32 @llvmRtSysvar_005() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 21 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_006() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 24 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_007() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 20 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_008() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 18 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_009() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 8 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_00a() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 9 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}

define i32 @llvmRtSysvar_00b() {
entry:
  %tmp1 = load %struct.HSPCTX** @hspctx, align 4 ; <%struct.HSPCTX*> [#uses=1]
  %tmp2 = getelementptr %struct.HSPCTX* %tmp1, i32 0, i32 10 ; <i32*> [#uses=1]
  %tmp3 = load i32* %tmp2, align 4                ; <i32> [#uses=1]
  ret i32 %tmp3
}


define i32 @llvmRtIntfunc_010(i32 %ivalue) {
entry:
  %tmp2 = icmp slt i32 %ivalue, 0                 ; <i1> [#uses=1]
  br i1 %tmp2, label %bb, label %UnifiedReturnBlock

bb:                                               ; preds = %entry
  %tmp5 = sub i32 0, %ivalue                      ; <i32> [#uses=1]
  ret i32 %tmp5

UnifiedReturnBlock:                               ; preds = %entry
  ret i32 %ivalue
}

define double @llvmRtIntfunc_182(double %dval) {
entry:
  ret double %dval
}

define double @llvmRtIntfunc_186(double %dval) {
entry:
  %tmp3 = fcmp olt double %dval, 0.000000e+00     ; <i1> [#uses=1]
  br i1 %tmp3, label %bb, label %UnifiedReturnBlock

bb:                                               ; preds = %entry
  %tmp6 = fsub double -0.000000e+00, %dval        ; <double> [#uses=1]
  ret double %tmp6

UnifiedReturnBlock:                               ; preds = %entry
  ret double %dval
}

define double @llvmRtIntfunc_189(double %d1, double %d2, double %d3) {
entry:
  %tmp3 = fcmp olt double %d1, %d2                ; <i1> [#uses=1]
  %d1_addr.0 = select i1 %tmp3, double %d2, double %d1 ; <double> [#uses=2]
  %tmp9 = fcmp ogt double %d1_addr.0, %d3         ; <i1> [#uses=1]
  %retval = select i1 %tmp9, double %d3, double %d1_addr.0 ; <double> [#uses=1]
  ret double %retval
}

define double @llvmRtIntfunc_188(double %dval) {
entry:
  %tmp2 = tail call double @log(double %dval)     ; <double> [#uses=1]
  ret double %tmp2
}

declare double @log(double)

define double @llvmRtIntfunc_187(double %dval) {
entry:
  %tmp2 = tail call double @exp(double %dval)     ; <double> [#uses=1]
  ret double %tmp2
}

declare double @exp(double)

define double @llvmRtIntfunc_184(double %dval) {
entry:
  %tmp2 = tail call double @sqrt(double %dval)    ; <double> [#uses=1]
  ret double %tmp2
}

declare double @sqrt(double)

define double @llvmRtIntfunc_181(double %dval) {
entry:
  %tmp2 = tail call double @cos(double %dval)     ; <double> [#uses=1]
  ret double %tmp2
}

declare double @cos(double)

define double @llvmRtIntfunc_180(double %dval) {
entry:
  %tmp2 = tail call double @sin(double %dval)     ; <double> [#uses=1]
  ret double %tmp2
}

declare double @sin(double)

