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
declare void @PushVar(%struct.PVal*, i32)
declare void @CalcMulI()
declare void @VarSet(%struct.PVal*, i32, i32)
declare void @PushInt(i32)
declare void @CalcSubI()
declare void @PushDouble(double)
declare void @PushFuncEnd()
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
declare i32 @Hsp3rReset(%struct.Hsp3r*, i32, i32)
declare void @HspVarCoreArray2(%struct.PVal*, i32)

declare double @CallDoubleIntfunc(i32, i32)
declare i32 @CallIntIntfunc(i32, i32)
declare double @CallDoubleSysvar(i32, i32)
declare i32 @CallIntSysvar(i32, i32)

@hspctx = external global %struct.HSPCTX*

define void @HspVarCoreReset(%struct.PVal* %a) {
  %1 = getelementptr %struct.PVal* %a, i32 0, i32 8
  store i32 0, i32* %1
  %2 = getelementptr %struct.PVal* %a, i32 0, i32 7
  store i16 0, i16* %2
  ret void
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

