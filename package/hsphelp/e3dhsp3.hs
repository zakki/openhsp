; (2011/7/18)
; HSP HELP Browser II�p HELP�\�[�X�t�@�C��
; Easy3D for HSP3
;
;http://www5d.biglobe.ne.jp/~ochikko/e3dhsp3_func.htm ����
;HS�`���ւ̈ڐB Easy3DHelp2Hs Ver1.30
;WebSite : http://yutopp.org.jp/
%type
Easy3D For HSP3 ����
%ver
5.5.0.2

%note
e3dhsp3.as���C���N���[�h���邱�ƁB
%date
2011/07/18

%author
���������
%dll
Easy3D For HSP3
%url
http://www5d.biglobe.ne.jp/~ochikko/

%index
E3DInit
Direct3D�̏�����������B
%group
Easy3D For HSP3 : ������

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] �ϐ��܂��́A���l�@�F�@wid
p2 : [IN] �ϐ��܂��́A���l�@�F�@objid
p3 : [IN] �ϐ��܂��́A���l�@�F�@fullscreenflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@bits
p5 : [IN] �ϐ��܂��́A���l�@�F�@multisamplenum
p6 : [OUT] �ϐ��@�F�@scid
p7 : [IN] �ϐ��܂��́A���l�@�F�@gpuflag
p8 : [IN] �ϐ��܂��́A���l�@�F�@enablereverb
p9 : [IN] �ϐ��܂��́A���l�@�F�@index32bit

%inst
Direct3D�̏�����������B

�t���X�N���[���ɂ��Ή����Ă��܂��B

�t���X�N���[���̉𑜓x�́A
�w�肵���E�C���h�E�h�c�̕���
��ԋ߂����̂������őI�т܂��B

�U�S�O�~�S�W�O�A
�W�O�O�~�U�O�O�A
�P�O�Q�S�~�V�U�W�A
�P�Q�W�O�~�P�O�Q�S�A
�P�S�O�O�~�P�O�T�O�A
�P�U�O�O�~�P�Q�O�O
�̒�����I�т܂��B


�g�`�k�i�n�[�h�E�F�A�̋@�\�j���g���Ȃ��ꍇ�́A�G���[�ɂȂ�܂��B

�w�肵���r�b�g�����g���Ȃ��ꍇ�ɂ��A
�G���[�ɂȂ�܂��B


�G���[�ŃA�v���P�[�V�������I������̂�
���ȏꍇ�́A
���̖��߂��ĂԑO�ɁAE3DCheckFullScreenParams���Ă��
�`�F�b�N���邱�Ƃ��������߂��܂��B

�t���X�N���[���̋�̓I�Ȏg�p��́A
e3dhsp3_fullscreen.hsp
�ɏ����܂����̂ŁA�������������B



�A���`�G�C���A�X�ɂ��āB
multisamplenum�͂O�܂��͂Q����P�U�̒l���w�肵�Ă��������B
multisamplenum�̒l���傫���قǁA
�摜�̃G�b�W���Ȃ߂炩�ɂȂ�܂��B
�O���w�肷��ƃA���`�G�C���A�X�͎g���܂���B

multisamplenum�ɂO�ȊO���w�肷��ꍇ�́A
���̑O�ɁA
E3DGetMaxMultiSampleNum��
�w��ł���ő�l���擾���Ă��������B

html{
<strong>�A���`�G�C���A�X���I���ɂ���Ɓi�O�ȊO���w�肷��Ɓj�A
�a�l�o�ۑ���A�`�u�h�ۑ��̖��߂��g���Ȃ��Ȃ�܂��B
</strong>
}html
�iE3DWriteDisplay2BMP�AE3DCreateAVIFile�Ƒ��̂`�u�h�֘A�֐����g�p�ł��Ȃ��Ȃ�܂��B�j


�A���`�G�C���A�X��L���ɂ���ɂ́A
�쐬�����S�Ă�hsid�ɑ΂��āA
E3DSetRenderState hsid, -1, D3DRS_MULTISAMPLEANTIALIAS, 1 ���Ă�ł��������B


�A���`�G�C���A�X�̋�̓I�Ȏg�p��́A
e3dhsp3_antialias.hsp
�ɏ����܂����̂ŁA�������������B


ver5.1.0.2��index32bit������ǉ����܂����B
index32bit�����ɂP���w�肷��ƂR�Q�r�b�g�C���f�b�N�X���[�h�ŋN�����A�O���w�肷��ƂP�U�r�b�g�C���f�b�N�X���[�h�ŋN�����܂��B
�R�Q�r�b�g�C���f�b�N�X���[�h�ł͂U�T�T�R�T/�R�|���S���܂ł̐������Ȃ��Ȃ�܂��B
�R�Q�r�b�g�C���f�b�N�X���[�h�ł̓r�f�I�J�[�h�ɔ\�͂������ꍇ�͋N���ł��Ȃ��Ȃ�܂��B
�����̃l�b�g�u�b�N�Ȃǂł͂R�Q�r�b�g�C���f�b�N�X���[�h�͓����Ȃ��悤�Ȃ̂Œ��ӂ��Ă��������B


ver5.3.1.3��fullscreenflag�̒l�w����g���B





������

1. [IN] �ϐ��܂��́A���l�@�F�@wid
�@�@�E�C���h�E�̂h�c��n���Ă��������B
�@�@screen���߂�bgscr���߂Ɏw�肵���̂Ɠ����ԍ���
�@�@�w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@objid
�@�@�I�u�W�F�N�g�h�c�B
�@�@�g�r�o�Ń{�^���Ȃǂ̃I�u�W�F�N�g�����A
�@�@���̏�ɂR�c�\���������ꍇ�ɁA���̈������g���܂��B
�@�@�g�r�o�ł́A�I�u�W�F�N�g�쐬�����stat�ϐ��ɁA
�@�@�I�u�W�F�N�g�h�c�������Ă��܂��B
�@�@���̂h�c���w�肵�Ă��������B
�@�@wid�Ŏw�肵���E�C���h�E�S�̂ɁA
�@�@3D�`����s�������ꍇ�́A
�@�@���̈����ɂ�-1���w�肵�Ă��������B


3. [IN] �ϐ��܂��́A���l�@�F�@fullscreenflag
�@�@�t���X�N���[���ɂ���Ƃ��͂P���A
�@�@���Ȃ��Ƃ��i�E�C���h�E���[�h�j�͂O���w�肵�Ă��������B
�@�@�ȗ������ꍇ�́A�E�C���h�E���[�h�ɂȂ�܂��B

�@�@E3DCheckFullScreenParams��flag�ɂQ���w�肵���ꍇ�́Afullscreenflag�ɂ��Q���w�肵�Ă��������B
�@�@�܂����̏ꍇ�A�E�C���h�E�̍쐬��screen���߂ł͂Ȃ�bgscr���߂��g���Ă��������B


4. [IN] �ϐ��܂��́A���l�@�F�@bits
�@�@�F�������߂�r�b�g�����w�肵�Ă��������B
�@�@�P�U���邢�́A�R�Q�̂ݗL���ł��B
�@�@fullscreenflag�ɂP�܂��͂Q���w�肵���Ƃ��̂݁A���ʂɔ��f����܂��B


5. [IN] �ϐ��܂��́A���l�@�F�@multisamplenum
�@�@�}���`�T���v���̐��B
�@�@�ڂ����́A�E�L���������������B


6. [OUT] �ϐ��@�F�@scid
�@�@�X���b�v�`�F�C���h�c���������܂��B
�@�@���̂h�c�́A�ǂ̕����ɕ`����s�������w�肷��̂�
�@�@�g���܂��B
�@�@E3DChkInView, E3DRender, E3DBeginScene, E3DPresent �@�@�Ȃǂ�
�@�@�K�v�ɂȂ�܂��B


7. [IN] �ϐ��܂��́A���l�@�F�@gpuflag
�@�@�P���w�肷��ƃr�f�I�J�[�h�ɒ��_�V�F�[�_�[�A
�@�@�s�N�Z���V�F�[�_�[������ꍇ�ɂ́A
�@�@������g���Ē��_�������܂��B
�@�@�O���w�肷��ƁA�\�t�g�E�F�A�Œ��_�������܂��B

�@�@�ȗ������ꍇ�͂P���K�p����܂��B

8. [IN] �ϐ��܂��́A���l�@�F�@enablereverb
�@�@�P���w�肷��ƃX�e���I�T�E���h�̃��o�[�u��
�@�@�I���ɂȂ�܂��B
�@�@�O���w�肷��ƃ��o�[�u���I�t�ɂȂ�܂��B

�@�@�ȗ������ꍇ�́A�P���K�p����܂��B

9. [IN] �ϐ��܂��́A���l�@�F�@index32bit
�@�@�P���w�肷��ƂR�Q�r�b�g�C���f�b�N�X���[�h�ɂȂ�܂��B�O���w�肷��ƂP�U�r�b�g�C���f�b�N�X���[�h�ɂȂ�܂��B
�ȗ�����ƂO���w�肵���̂Ɠ����ɂȂ�܂��B
�ڂ����͑O�L���������������B


�o�[�W���� : ver1.0.0.1<BR>
      ver5.1.0.2�Ŋg��<BR>
      ver5.3.1.3�Ŋg��<BR>
      

%index
E3DBye
Direct3D�̌㏈��������B
%group
Easy3D For HSP3 : �㏈��

%prm
�Ȃ�

%inst
Direct3D�̌㏈��������B

�쐬�����������Ȃǂ̉�����s���܂��B
�A�v���P�[�V�����̏I�����ɌĂ�ł��������B




������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DSigLoad
�`��f�[�^�i*.sig�j��ǂݍ���ŁAhsid�𓾂�B
%group
Easy3D For HSP3 : ���f���f�[�^

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p2 : [OUT] �ϐ��@�F�@hsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@mult

%inst
�`��f�[�^�i*.sig�j��ǂݍ���ŁAhsid�𓾂�B


������
1. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.sig �̃p�X������B

2. [OUT] �ϐ��@�F�@hsid
�@�@�ǂݍ��񂾌`��f�[�^�����ʂ���hsid

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


4. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@�����B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DCreateSwapChain
�X���b�v�`�F�C�����쐬���܂��B
%group
Easy3D For HSP3 : �X���b�v�`�F�C��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@wid
p2 : [IN] �ϐ��܂��́A���l�@�F�@objid
p3 : [OUT] �ϐ��@�F�@scid

%inst
�X���b�v�`�F�C�����쐬���܂��B

�X���b�v�`�F�C���Ƃ́A�����̉�ʂɕ`����s�����߂̂��̂ł��B
E3DInit�Ŏw�肵���E�C���h�E�ƃI�u�W�F�N�g�ȊO�̂Ƃ���ɁA
�`�悵�����ꍇ�ɁA���̖��߂��Ăт܂��B

���̖��߂Ŏ擾����scid���A
E3DChkInView, E3DBeginScene, E3DRender, E3DPresent�Ȃǂɓn�����Ƃɂ��A
������ʂɂR�c�`��ł���悤�ɂȂ�܂��B

��̓I�Ȏg�p��́A
e3dhsp3_SwapChain.hsp
�ɏ����܂����̂ŁA�������������B





������
 1. [IN] �ϐ��܂��́A���l�@�F�@wid
�@�@�E�C���h�E�̂h�c��n���Ă��������B
�@�@screen���߂�bgscr���߂Ɏw�肵���̂Ɠ����ԍ���
�@�@�w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@objid
�@�@�I�u�W�F�N�g�h�c�B
�@�@�g�r�o�Ń{�^���Ȃǂ̃I�u�W�F�N�g�����A
�@�@���̏�ɂR�c�\���������ꍇ�ɁA���̈������g���܂��B
�@�@�g�r�o�ł́A�I�u�W�F�N�g�쐬�����stat�ϐ��ɁA
�@�@�I�u�W�F�N�g�h�c�������Ă��܂��B
�@�@���̂h�c���w�肵�Ă��������B
�@�@wid�Ŏw�肵���E�C���h�E�S�̂ɁA
�@�@3D�`����s�������ꍇ�́A
�@�@���̈����ɂ�-1���w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@scid
�@�@�X���b�v�`�F�C���h�c���������܂��B
�@�@���̂h�c�́A�ǂ̕����ɕ`����s�������w�肷��̂�
�@�@�g���܂��B
�@�@E3DChkInView, E3DRender, E3DBeginScene, E3DPresent�@�@�Ȃǂ�
�@�@�K�v�ɂȂ�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroySwapChain
�X���b�v�`�F�C����j�����܂��B
%group
Easy3D For HSP3 : �X���b�v�`�F�C��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�X���b�v�`�F�C����j�����܂��B

E3DCreateSwapChain�ō쐬�����X���b�v�`�F�C�����A
��������Ȃ��Ȃ����ꍇ�ɁA�Ă�ł��������B

E3DInit�Ŏ擾����scid�ɑ΂��ẮA�Ăяo���Ȃ��ł��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DCreateSwapChain�Ŏ擾�����h�c���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DRender
�o�b�N�o�b�t�@�Ƀ����_�����O����B
%group
Easy3D For HSP3 : �`��

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@withalpha
p4 : [IN] �ϐ��܂��́A���l�@�F�@framecnt
p5 : [IN] �ϐ��܂��́A���l�@�F�@projection mode
p6 : [IN] �ϐ��܂��́A���l�@�F�@lastparent
p7 : [IN] �ϐ��܂��́A���l�@�F�@sigLightFlag
p8 : [IN] �ϐ��܂��́A���l�@�F�@transskip

%inst
�o�b�N�o�b�t�@�Ƀ����_�����O����B


�ύX�����{�[���̒��ŁA
��Ԑe�̔ԍ���lastparent�Ɏw�肷��ƁA
���̃{�[���c���[�̉e�����󂯂钸�_�݂̂�
���o���āA�v�Z���܂��B

lastparent�́A�������̂��߂̂��̂ł��B
E3DIKRotateBeta�Ŏ擾�ł���lastparent�̒l��
�n�����Ƃ�z�肵�Ă��܂��B

�L�����N�^�[�S�̂��ړ������ꍇ��A
�J�������ړ������ꍇ�ɂ́A�g��Ȃ��ł��������B
�܂��AE3DRender�̏���̌Ăяo�����ɂ�
�g��Ȃ��ł��������B

html{
<strong>lastparent���g�p�������Ȃ��ꍇ�́A
�O���Z�b�g���Ă��������B</strong>
}html





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@withalpha
�@�@�O���w�肷��ƁA�s�����p�[�c�̂݃����_�����O����B
�@�@�P���w�肷��ƁA�������p�[�c�̂݃����_�����O����B

4. [IN] �ϐ��܂��́A���l�@�F�@framecnt
�@�@E3DSetNewPose���s���nextframe�̒l���w�肷��B

5. [IN] �ϐ��܂��́A���l�@�F�@projection mode
�@�@�v���W�F�N�V�����́A���[�h���w�肷��B
�@�@�O���w�肷��ƁA�ʏ�̕\���B
�@�@�P���w�肷��ƁA��ʒ����Ƀ����Y������悤�ɕ\�������B

6. [IN] �ϐ��܂��́A���l�@�F�@lastparent
�@�@�ύX����������Ԑe�̃{�[���̔ԍ����w�肵�܂��B
�@�@�ڂ����́A���L���������������B

7. [IN] �ϐ��܂��́A���l�@�F�@sigLightFlag
�@�@sig�̃��C�e�B���O�v�Z��L���ɂ������Ƃ��͂P���A
�@�@�����ɂ������Ƃ��͂O���w�肵�Ă��������B
�@�@�f�t�H���g�͂P�ł��B

�@�@�w�ʃJ�����O���s�킸�ɁA
�@�@�S�Ă̒��_�̐F�v�Z���������ꍇ�ɂ́A
�@�@�Q���w�肵�Ă��������B

8. [IN] �ϐ��܂��́A���l�@�F�@transskip
�@�@transskip�ɂP���Z�b�g����ƁA
�@�@���_�ϊ��������X�L�b�v����܂��B
�@�@�s�����A�������ƁA�Q��AE3DRender���Ăяo���ꍇ�́A
�@�@�Q��ڂ̌Ăяo�����ɁAtransskip�ɂP���w�肵�Ă��������B






�o�[�W���� : ver1.0.0.1<BR>
      <BR>
      ver1.0.0.5�ň����ǉ�<BR>
      

%index
E3DPresent
�o�b�N�o�b�t�@�̓��e���A
�v���C�}���o�b�t�@�ɓ]������B
%group
Easy3D For HSP3 : �`��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�o�b�N�o�b�t�@�̓��e���A
�v���C�}���o�b�t�@�ɓ]������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DBeginScene
�A�v���P�[�V�����ł́A�����_�����O�����s����O�ɂ͕K�����̃��\�b�h���Ăяo���A
�����_�����O�̏I�����A
����эēxE3DBeginScene���Ăяo���O�ɂ́A
�K�� E3DEndScene���Ăяo���B
%group
Easy3D For HSP3 : �`��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@skipflag
p3 : [IN] �ϐ��܂��́A���l�@�F�@zscid

%inst
�A�v���P�[�V�����ł́A�����_�����O�����s����O�ɂ͕K�����̃��\�b�h���Ăяo���A
�����_�����O�̏I�����A
����эēxE3DBeginScene���Ăяo���O�ɂ́A
�K�� E3DEndScene���Ăяo���B

��̓I�ɂ́A
E3DRender, E3DDrawText, E3DDrawBigText���A
E3DBeginScene�ƁAE3DEndScene�ŃT���h�C�b�`����悤�ɋL�q����B


ver5.2.0.8��zscid�������ǉ�����܂����B
ver5.2.1.0��skipflag���g�����܂����B





������

1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@skipflag
�@�@skipflag�ɂO���w�肷��ƐF�̏�������Z�o�b�t�@�̏������Ɣw�i�̕`����s���܂��B
�@�@skipflag�ɂP�𑫂��ƐF�̏�������Z�o�b�t�@�̏������Ɣw�i�̕`����s���܂���B
�@�@skipflag�ɂQ�𑫂��ƃV�F�[�_�[�萔�̃r�f�I�J�[�h�ւ̓]�����L�����Z�����܂��B
�@�@skipflag�ɂS�𑫂��ƐF�̏������͍s���܂���Z�o�b�t�@�̏������Ɣw�i�̕`��͍s���܂���B�@

3. [IN] �ϐ��܂��́A���l�@�F�@zscid
�@�@Z�o�b�t�@���w��ł��܂��B
�@�@�`��Ɏg�p������Z�o�b�t�@���������_�[�^�[�Q�b�g�e�N�X�`���Ȃǂ̃X���b�v�`�F�C��ID���w�肵�܂��B
�@�@���̈������ȗ������ꍇ��scid�Ŏw�肵��Z�o�b�t�@���g�p����܂��B
�@�@zscid���w�肵���ꍇ�͎w�肵��Z�o�b�t�@�͂��̖��߂ŏ���������܂���B
�@�@zscid�Ŏw�肷��Z�o�b�t�@��scid�Ŏw�肵���T�[�t�F�X�̑傫���Ƒ傫�����������̂ݗL���ł��B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.2.0.8�Ŋg��<BR>
      ver5.2.1.0�Ŋg��<BR>
      

%index
E3DEndScene
���̃��\�b�h����������ƁA�V�[���������_�����O����A�����_�����O��̃V�[�����f�o�C�X �T�[�t�F�X�ɕێ������B
%group
Easy3D For HSP3 : �`��

%prm
�Ȃ�

%inst
���̃��\�b�h����������ƁA�V�[���������_�����O����A�����_�����O��̃V�[�����f�o�C�X �T�[�t�F�X�ɕێ������B


������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DCreateBG
��ʂ̈�ԉ��ɕ\�������w�i���Z�b�g���܂��B
%group
Easy3D For HSP3 : �w�i

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ������܂��́A������ϐ��@�F�@filename1
p3 : [IN] ������܂��́A������ϐ��@�F�@filename2
p4 : [IN] �ϐ��܂��́A���l�@�F�@u
p5 : [IN] �ϐ��܂��́A���l�@�F�@v
p6 : [IN] �ϐ��܂��́A���l�@�F�@isround
p7 : [IN] �ϐ��܂��́A���l�@�F�@fogdist

%inst
��ʂ̈�ԉ��ɕ\�������w�i���Z�b�g���܂��B

�摜�t�@�C���́A�Q�܂ŁA�w��ł��܂��B
�Q�ڂ̉摜�́A�_��A����p��z�肵�Ă��܂��B
�P�ڂ̉摜�ƂQ�ڂ̉摜�́A���W�����[�g����āA�\������܂��B

isround�ɂP���Z�b�g����ƁA
�w�i���A���_�̉�]�ɑΉ����āA��]����悤�ɂȂ�܂��B


�r�f�I�J�[�h���}���`�e�N�X�`���ɑΉ����Ă��Ȃ��ꍇ�A
�܂��́A���W�����[�g�������o���Ȃ��ꍇ�́A
1�ڂ̃e�N�X�`���[�����\�����Ȃ��悤��
�Ȃ��Ă��܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ������܂��́A������ϐ��@�F�@filename1
�@�@�P�ڂ̉摜�t�@�C�����B


3. [IN] ������܂��́A������ϐ��@�F�@filename2
�@�@�Q�ڂ̉摜�t�@�C�����B
�@�@�Q�ڂ��s�K�v�ȏꍇ�́A���݂��Ȃ��t�@�C�������A
�@�@�n���Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@u
5. [IN] �ϐ��܂��́A���l�@�F�@v
�@�@�Q���ڂ̉摜�́A�t�u���W���A���t���[���A�ǂꂭ�炢�A
�@�@�ړ������邩���w�肵�܂��B
�@�@�ʏ�́A0����P�܂ł̒l���w�肵�Ă��������B
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@isround
�@�@isround�ɁA�P���w�肷��ƁA
�@�@�r���[�̉�]�ɑΉ����āA
�@�@��ڂ̉摜�t�@�C���̂t�u���W���A��]���܂��B
�@�@���̍ہA�摜�t�@�C���̍��[�ƁA�E�[���A
�@�@�A������悤�ȃf�[�^�łȂ��ƁA
�@�@�Ȃ��ڂ������Ă��܂��܂��̂ŁA���ӂ��Ă��������B
�@�@isround�ɂO���w�肷��ƁA
�@�@�P�ڂ̉摜�́A��]���܂���B

7. [IN] �ϐ��܂��́A���l�@�F�@fogdist
�@�@�t�H�O�̌v�Z�Ɏg���A�J��������̋������w�肵�܂��B
�@�@���̈����ɁAE3DSetLinearFogParams�Ŏw�肷��
�@�@end��菬�����l���w�肷��΁A
�@�@�w�i�́A�t�H�O�̐F�ɐ��܂�Ȃ�����A
�@�@��������ƌ�����悤�ɏo���܂��B





�o�[�W���� : ver1.0.0.1<BR>
      <BR>
      ver2.0.0.9�ň����ǉ�<BR>
      

%index
E3DSetBGU
�w�i�̂t�u���W�̂t���W���w�肵�܂��B
%group
Easy3D For HSP3 : �w�i

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@startu
p3 : [IN] ���l�܂��́A�ϐ��@�F�@endu

%inst
�w�i�̂t�u���W�̂t���W���w�肵�܂��B

��ʂ̍��[�̂t���W�̒l��startu�����ɁA

��ʂ̉E�[�̂t���W�̒l��endu�����ɁA
���ꂼ��A�w�肵�Ă��������B

���̋@�\���g�����A�w�i�̃X�N���[���̗�́A
e3dhsp3_scrollBG.hsp
�ɂ���܂��B




������

1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@startu
�@�@��ʍ��[�̂t���W�̒l�B
�@�@�����B

3. [IN] ���l�܂��́A�ϐ��@�F�@endu
�@�@��ʉE�[�̂t���W�̒l�B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DSetBGV
�w�i�̂t�u���W�̂u���W���w�肵�܂��B
%group
Easy3D For HSP3 : �w�i

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@startv
p3 : [IN] ���l�܂��́A�ϐ��@�F�@endv

%inst
�w�i�̂t�u���W�̂u���W���w�肵�܂��B

��ʂ̈�ԏ�̂u���W�̒l��startv�����ɁA

��ʂ̈�ԉ��̂u���W�̒l��endv�����ɁA
���ꂼ��A�w�肵�Ă��������B


���̋@�\���g�����A�w�i�̃X�N���[���̗�́A
e3dhsp3_scrollBG.hsp
�ɂ���܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@startv
�@�@��ʍ��[��V���W�̒l�B
�@�@�����B

3. [IN] ���l�܂��́A�ϐ��@�F�@endv
�@�@��ʉE�[��V���W�̒l�B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyBG
�w�i��j�����܂��B
%group
Easy3D For HSP3 : �w�i

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�w�i��j�����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DAddMotion
���[�V�����f�[�^(*.qua)��ǂݍ��ށB
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p3 : [OUT] �ϐ��@�F�@mk
p4 : [OUT] �ϐ��@�F�@maxframe
p5 : [IN] �ϐ��܂��́A���l�@�F�@mvmult

%inst
���[�V�����f�[�^(*.qua)��ǂݍ��ށB


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�ǂ̃��f���f�[�^�ɑ΂��郂�[�V���������w�肷��B

2. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.qua�̃p�X������B

3. [OUT] �ϐ��@�F�@mk
�@�@�ǂݍ��񂾃��[�V���������ʂ���ԍ�

4. [OUT] �ϐ��@�F�@maxframe
�@�@�ǂݍ��񂾃��[�V�����̍ő�t���[���ԍ�
�@�@�i���t���[���� - 1 �Ɠ����j

5. [IN] �ϐ��܂��́A���l�@�F�@mvmult
�@�@���[�V�����̈ړ������Ɋ|����{��
�@�@�ȗ�����ƂP�D�O
�@�@����



�o�[�W���� : ver1.0.0.1<BR>
      ver4.0.1.6�ň����ǉ�<BR>
      

%index
E3DSetMotionKind
�J�����g�́A���[�V�����ԍ����w�肷��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@mk

%inst
�J�����g�́A���[�V�����ԍ����w�肷��B
�i�J�����g���[�V������ύX����B�j

���̊֐������s����ƁA
���[�V�����̃t���[���ԍ��́A
�O�ɃZ�b�g�����B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@mk
�@�@���[�V���������ʂ���ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DGetMotionKind
�J�����g�́A���[�V�����ԍ����擾����B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@mk

%inst
�J�����g�́A���[�V�����ԍ����擾����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [OUT] �ϐ��@�F�@mk
�@�@���[�V���������ʂ���ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DSetNewPose
�J�����g�̃��[�V�������A
E3DSetMotionStep�ŃZ�b�g����step�t���[�������A
�i�܂���B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@nextframe

%inst
�J�����g�̃��[�V�������A
E3DSetMotionStep�ŃZ�b�g����step�t���[�������A
�i�܂���B

nextframe�ɁA
���ɍĐ�����t���[���ԍ����Z�b�g�����B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [OUT] �ϐ��@�F�@nextframe
�@�@���ɍĐ������t���[���ԍ����������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetMotionStep
���[�V�����̃X�e�b�v�����w�肷��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@mk
p3 : [IN] �ϐ��܂��́A���l�@�F�@step

%inst
���[�V�����̃X�e�b�v�����w�肷��B
�Ⴆ�΁Astep�ɁA�Q���w�肷��ƁA
�Q�t���[�����ƂɁi�P�t���[�������Ɂj�A
���[�V�������Đ�����悤�ɂȂ�B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@mk
�@�@���[�V���������ʂ���ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@step
�@�@���t���[�����ƂɁA���[�V�������Đ����邩���w�肷��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConflict
�Q�̌`��f�[�^���A�Փ˂��Ă��邩�ǂ����𔻒肷��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p3 : [OUT] �ϐ��@�F�@confflag
p4 : [OUT] �ϐ��@�F�@inviewflag

%inst
�Q�̌`��f�[�^���A�Փ˂��Ă��邩�ǂ����𔻒肷��B

�i����̌��ɂȂ�f�[�^�́A
E3DChkInView���߂ɂ���čX�V�����B�j


hsid1������O�ɂ���ꍇ�́Ainviewflag�ɂP���A
hsid2������O�ɂ���ꍇ�́Ainviewflag�ɂQ���A
�����Ƃ�����O�̏ꍇ�́Ainviewflag�ɂR���A
�����Ƃ�������̏ꍇ�́Ainviewflag�ɂO���������܂��B

���݂́A
html{
<strong>E3DChkConflict2</strong>
}html������܂��B
�p�[�c���m�̂����蔻�肪�o����悤�ɂȂ�܂����B
���f���S�̂̂����蔻����o���܂��B
���f���S�̂̂����蔻�������ꍇ�ł��A
E3DChkConflict2�̕����A�p�[�c���Ƃ̌v�Z������̂ŁA���̊֐������v�Z���x�������ł��B

�V�����AE3DChkConflict2�����g�����������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@�`��f�[�^�����ʂ���id

3. [OUT] �ϐ��@�F�@confflag
�@�@hsid1, hsid2�Ŏ��ʂ����`�󓯎m���A
�@�@�Փ˂��Ă���ꍇ�́A�P���A
�@�@�Փ˂��Ă��Ȃ��ꍇ�͂O���Z�b�g�����B

4. [OUT] �ϐ��@�F�@inviewflag
�@�@ hsid1������O�ɂ���ꍇ�́Ainviewflag�ɂP���A
�@�@hsid2������O�ɂ���ꍇ�́Ainviewflag�ɂQ���A
�@�@�����Ƃ�����O�̏ꍇ�́Ainviewflag�ɂR���A
�@�@�����Ƃ�������̏ꍇ�́Ainviewflag�ɂO�������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DChkConflict2
�Q�̌`��f�[�^�̎w�肵���p�[�c���m���A�Փ˂��Ă��邩�ǂ��𔻒肵�܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno1
p3 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p4 : [IN] �ϐ��܂��́A���l�@�F�@partno2
p5 : [OUT] �ϐ��@�F�@confflag
p6 : [OUT] �ϐ��@�F�@inviewflag

%inst
�Q�̌`��f�[�^�̎w�肵���p�[�c���m���A�Փ˂��Ă��邩�ǂ��𔻒肵�܂��B

partno1, partno2�ɂ́A
E3DGetPartNoByName�Ŏ擾�����A
�p�[�c�̔ԍ���n���Ă��������B

partno��-1���w�肷��ƁA
���f���S�̂Ƃ����蔻������܂��B


�i����̌��ɂȂ�f�[�^�́A
E3DChkInView���߂ɂ���āA�X�V����܂��B�j


hsid1������O�ɂ���ꍇ�́Ainviewflag�ɂP���A
hsid2������O�ɂ���ꍇ�́Ainviewflag�ɂQ���A
�����Ƃ�����O�̏ꍇ�́Ainviewflag�ɂR���A
�����Ƃ�������̏ꍇ�́Ainviewflag�ɂO���������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�`��f�[�^�����ʂ���id
2. [IN] �ϐ��܂��́A���l�@�F�@partno1
�@�@hsid1�̃��f�����̃p�[�c�̔ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@�`��f�[�^�����ʂ���id
4. [IN] �ϐ��܂��́A���l�@�F�@partno2
�@�@hsid2�̃��f�����̃p�[�c�̔ԍ�

5. [OUT] �ϐ��@�F�@confflag
�@�@hsid1, hsid2�Ŏ��ʂ����`�󓯎m���A
�@�@�Փ˂��Ă���ꍇ�͂P���A
�@�@�Փ˂��Ă��Ȃ��ꍇ�͂O���Z�b�g�����B

6. [OUT] �ϐ��@�F�@inviewflag
�@�@ hsid1������O�ɂ���ꍇ�́Ainviewflag�ɂP���A
�@�@hsid2������O�ɂ���ꍇ�́Ainviewflag�ɂQ���A
�@�@�����Ƃ�����O�̏ꍇ�́Ainviewflag�ɂR���A
�@�@�����Ƃ�������̏ꍇ�́Ainviewflag�ɂO�������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DCreateAfterImage
���̊֐��́A���݁A�@�\���Ă��܂���B
%group
Easy3D For HSP3 : �c��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@imagenum

%inst
���̊֐��́A���݁A�@�\���Ă��܂���B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id
2. [IN] �ϐ��܂��́A���l�@�F�@imagenum
�@�@�\������c���̐����w�肷��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyAfterImage
E3DCreateAfterImage�ō쐬�����A�c���p�̃I�u�W�F�N�g��j������B
%group
Easy3D For HSP3 : �c��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
E3DCreateAfterImage�ō쐬�����A�c���p�̃I�u�W�F�N�g��j������B
�i�c�����\������Ȃ��Ȃ�B�j

�K�v�񐔂�葽�����s���Ă��A�Q�͂Ȃ����A
���s���Y���ƁA
���������[�N����̂Œ��ӂ��Ă��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id


�o�[�W���� : ver1.0.0.1

%index
E3DSetAlpha
�������̐ݒ�B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@usealphaflag
p3 : [IN] �ϐ��܂��́A���l�@�F�@updateflag

%inst
�������̐ݒ�B
���̊֐��́A�ߋ��̃o�[�W�����Ƃ̌݊����̂��߂����ɁA���݂��܂��B
�������̐ݒ�́A
E3DSetAlpha2 �֐����A���g�p���������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@usealphaflag
�@�@�O���w�肷��ƁA�s�����ŕ`�悳��A
�@�@�P���w�肷��ƁAalpha = 0.5 �ŕ`�悳��܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@updateflag
�@�@1���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DSetAlpha2
�r���{�[�h�̒��_�̃A���t�@�l��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@alphaval
p3 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p4 : [IN] �ϐ��܂��́A���l�@�F�@updateflag

%inst
�r���{�[�h�̒��_�̃A���t�@�l��ݒ肵�܂��B

sig���f���f�[�^�̃A���t�@�̐ݒ��
E3DSetMaterialAlpha�����g�����������B


alphaval ���P�D�O�̎��́A�s�����ɁA
alphaval���O�D�O�̎��́A���S�ɓ����ɂȂ�܂��B

alphaval�ɂP�D�O�ȊO�̒l���w�肵���ꍇ�́A
E3DRender��2�Ԗڂ̈���withalpha�ɁA
�P���w�肵�ĕ`�悵�܂��B


��̓I�Ȏg�p���zip���́A
e3dhsp3_alpha.hsp�@���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̓����x��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@alphaval
�@�@���_�̃A���t�@�l���w�肵�܂��B
�@�@
�@�@���_�̃A���t�@�l�́A�O�D�O����P�D�O�̒l��
�@�@�w�肵�Ă��������B
�@�@�͈͊O�̒l�́A�N�����v���ăZ�b�g���܂��B
�@�@�����B

3. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɃA���t�@���Z�b�g�ł��܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@updateflag
�@�@1���w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1

%index
E3DSetPos
�`��f�[�^�̈ʒu���Z�b�g����B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@posx
p3 : [IN] �ϐ��܂��́A���l�@�F�@posy 
p4 : [IN] �ϐ��܂��́A���l�@�F�@posz

%inst
�`��f�[�^�̈ʒu���Z�b�g����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@posx
3. [IN] �ϐ��܂��́A���l�@�F�@posy 
4. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�����B
�@�`��f�[�^���@( posx, posy, posz) �Ɉړ�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetPos
�`��f�[�^�̈ʒu���擾����B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@posx
p3 : [OUT] �ϐ��@�F�@posy 
p4 : [OUT] �ϐ��@�F�@posz

%inst
�`��f�[�^�̈ʒu���擾����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [OUT] �ϐ��@�F�@posx
3. [OUT] �ϐ��@�F�@posy 
4. [OUT] �ϐ��@�F�@posz
�@�@�����^�̕ϐ��B
�@�@�`��f�[�^�̈ʒu���擾����B



�o�[�W���� : ver1.0.0.1

%index
E3DSetDir
�`��f�[�^�̌������w�肷��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@degx
p3 : [IN] �ϐ��܂��́A���l�@�F�@degy 
p4 : [IN] �ϐ��܂��́A���l�@�F�@degz

%inst
�`��f�[�^�̌������w�肷��B


ver5.2.2.9����Z,X,Y���̏��Ԃŉ�]����悤�ɂȂ�܂����B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@degx
3. [IN] �ϐ��܂��́A���l�@�F�@degy 
4. [IN] �ϐ��܂��́A���l�@�F�@degz
�@�@�`��f�[�^�̌������A
�@�@X,Y,Z���̂��ꂼ��̊p�x�idegree�j�Ŏw�肷��B
�@�@�����B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.2.2.9�Ŏd�l�ύX<BR>
      

%index
E3DRotateInit
�`��f�[�^�̌��������������܂��B
%group
Easy3D For HSP3 : ���f������

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
�`��f�[�^�̌��������������܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id


�o�[�W���� : ver1.0.0.1

%index
E3DRotateX
�`��f�[�^���AX���Ɋւ��āAdegx �x������]���܂��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@degx

%inst
�`��f�[�^���AX���Ɋւ��āAdegx �x������]���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@degx
�@�@��]�p�x�B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DRotateY
�`��f�[�^���A�x���Ɋւ��āAdegy �x������]���܂��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@degy

%inst
�`��f�[�^���A�x���Ɋւ��āAdegy �x������]���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@degy
�@�@��]�p�x�B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DRotateZ
�`��f�[�^���AZ���Ɋւ��āAdegz �x������]���܂��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@degz

%inst
�`��f�[�^���AZ���Ɋւ��āAdegz �x������]���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@degz
�@�@��]�p�x�B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DTwist
�`��f�[�^���A���݌����Ă�����������Ƃ��āAdeg�x�����A��]���܂��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@deg

%inst
�`��f�[�^���A���݌����Ă�����������Ƃ��āAdeg�x�����A��]���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@deg
�@�@��]�p�x�B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DPosForward
�`��f�[�^���A���݌����Ă�������ɁAstep�����ړ�����B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@step

%inst
�`��f�[�^���A���݌����Ă�������ɁAstep�����ړ�����B

�������A�`��f�[�^���Adefault��ԂŁA
Z���̕����������Ă���Ɖ��肷��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@step
�@�@�ړ��������w�肷��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCloseTo
hsid1�Ŏ��ʂ����`����Ahsid2�Ŏ��ʂ����`��̕����ɁA�������B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p3 : [IN] �ϐ��܂��́A���l�@�F�@step

%inst
hsid1�Ŏ��ʂ����`����Ahsid2�Ŏ��ʂ����`��̕����ɁA�������B

�����ŁAE3DDirToTheOther���Ăяo���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�ړ�����`��f�[�^���A���ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@hsid2�Ŏw�肵���`��f�[�^�̕����Ɉړ�����B

3. [IN] �ϐ��܂��́A���l�@�F�@step
�@�@�ړ��������w�肷��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DDirToTheOtherXZ
hsid1�Ŏ��ʂ����`����AXZ���ʂŁAhsid2�Ŏ��ʂ����`��̕������A�����悤�ɂ���B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid2

%inst
hsid1�Ŏ��ʂ����`����AXZ���ʂŁAhsid2�Ŏ��ʂ����`��̕������A�����悤�ɂ���B

�������A�`��f�[�^���A������ԂŁA
Z���̕��̕���(0.0, 0.0, -1.0)�������Ă�����̂Ɖ��肵�Ă��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@������ς���`��f�[�^���A���ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@hsid2�Ŏw�肵���`��f�[�^�̕����������B



�o�[�W���� : ver1.0.0.1

%index
E3DDirToTheOther
E3DDirToTheOtherXZ�̂R�����ŁB
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid2

%inst
E3DDirToTheOtherXZ�̂R�����ŁB

�������A�`��f�[�^���A������ԂŁA
Z���̕��̕���(0.0, 0.0, -1.0)�������Ă�����̂Ɖ��肵�Ă��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@������ς���`��f�[�^���A���ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@hsid2�Ŏw�肵���`��f�[�^�̕����������B



�o�[�W���� : ver1.0.0.1

%index
E3DSeparateFrom
hsid1�Ŏ��ʂ����`����Ahsid2�Ŏ��ʂ����`��ƁA�t�̕����ɁA�������B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p3 : [IN] �ϐ��܂��́A���l�@�F�@dist

%inst
hsid1�Ŏ��ʂ����`����Ahsid2�Ŏ��ʂ����`��ƁA�t�̕����ɁA�������B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�ړ�����`��f�[�^���A���ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@hsid2�Ŏw�肵���`��f�[�^�Ɣ��Ε����Ɉړ�����B

3. [IN] �ϐ��܂��́A���l�@�F�@dist
�@�@�`�󓯎m���ǂ̂��炢�̋����A���������w�肷��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetCameraPos
�J�����̈ʒu���擾����B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [OUT] �ϐ��@�F�@posx
p2 : [OUT] �ϐ��@�F�@posy 
p3 : [OUT] �ϐ��@�F�@posz

%inst
�J�����̈ʒu���擾����B


������
1. [OUT] �ϐ��@�F�@posx
2. [OUT] �ϐ��@�F�@posy 
3. [OUT] �ϐ��@�F�@posz
�@�@�����^�̕ϐ��B
�@�@�J�����̈ʒu�A�@( posx, posy, posz) ���擾����B



�o�[�W���� : ver1.0.0.1

%index
E3DSetCameraPos
�J�����̈ʒu���w�肷��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@posx
p2 : [IN] �ϐ��܂��́A���l�@�F�@posy 
p3 : [IN] �ϐ��܂��́A���l�@�F�@posz

%inst
�J�����̈ʒu���w�肷��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@posx
2. [IN] �ϐ��܂��́A���l�@�F�@posy 
3. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�J�������@( posx, posy, posz) �Ɉړ�����B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetCameraDeg
�J�����̌������擾����B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [OUT] �ϐ��@�F�@degxz
p2 : [OUT] �ϐ��@�F�@degy

%inst
�J�����̌������擾����B


������
1. [OUT] �ϐ��@�F�@degxz
�@�@�J������XZ���ʂł̊p�x���擾����B
�@�@�����^�̕ϐ��B

2. [OUT] �ϐ��@�F�@degy
�@�@�J�����̋��p�x���擾����B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetCameraDeg
�J�����̌������w�肷��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@degxz
p2 : [IN] �ϐ��܂��́A���l�@�F�@degy

%inst
�J�����̌������w�肷��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@degxz
�@�@�J������XZ���ʂł̊p�x���w�肷��B
�@�@�����B

2. [IN] �ϐ��܂��́A���l�@�F�@degy
�@�@�J�����̋��p�x���w�肷��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DSetCameraTarget
�J�����̒����_���w�肷��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@targetx
p2 : [IN] �ϐ��܂��́A���l�@�F�@targety 
p3 : [IN] �ϐ��܂��́A���l�@�F�@targetz
p4 : [IN] �ϐ��܂��́A���l�@�F�@upvecx
p5 : [IN] �ϐ��܂��́A���l�@�F�@upvecy 
p6 : [IN] �ϐ��܂��́A���l�@�F�@upvecz

%inst
�J�����̒����_���w�肷��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@targetx
2. [IN] �ϐ��܂��́A���l�@�F�@targety 
3. [IN] �ϐ��܂��́A���l�@�F�@targetz
�@�@�J�����̒����_��(targetx, targety, targetz)�ɃZ�b�g����B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@upvecx
5. [IN] �ϐ��܂��́A���l�@�F�@upvecy 
6. [IN] �ϐ��܂��́A���l�@�F�@upvecz
�@�@�J�����̏�����̃x�N�g�����w�肷��B
�@�@�����ŁA���K�����Ďg�p�����B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DChkInView
hsid�Ŏ��ʂ���郂�f�����A������ɂ��邩�ǂ������A���肵�܂��B
%group
Easy3D For HSP3 : �`�揀��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
hsid�Ŏ��ʂ���郂�f�����A������ɂ��邩�ǂ������A���肵�܂��B

���ʂ́AE3DHSP�̓����f�[�^�ɁA�Z�b�g����܂��B

����O�̃I�u�W�F�N�g��A�p�[�c�́A
E3DRender���ɁA
�����I�ɁA�������X�L�b�v����悤�ɂȂ�܂��B

html{
<strong>�K���AE3DSetPos��AE3DSetNewPose����A
E3DRender��A�����蔻����O�ɁA
�Ăяo���Ă��������B
</strong>
}html���̖��߂��Ăяo���������stat�V�X�e���ϐ��ɂ́A
�ЂƂ�������Ƀp�[�c���Ȃ��ꍇ�͂O���A
���Ȃ��Ƃ��P�͎�����Ƀp�[�c������ꍇ�͂P���Z�b�g����܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id



�o�[�W���� : ver1.0.0.1

%index
E3DEnableDbgFile
�f�o�b�O�����Adbg.txt�ɏo�͂���悤�ɁA���܂��B
%group
Easy3D For HSP3 : �f�o�b�O

%prm
�Ȃ�

%inst
�f�o�b�O�����Adbg.txt�ɏo�͂���悤�ɁA���܂��B


������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DSetProjection
�v���W�F�N�V�������w�肷��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@near
p2 : [IN] �ϐ��܂��́A���l�@�F�@far 
p3 : [IN] �ϐ��܂��́A���l�@�F�@fovdeg

%inst
�v���W�F�N�V�������w�肷��B

���̊֐����Ăяo���Ȃ������ꍇ�́A
near�ʁF100.0, far�ʁF10000.0, ����p�F45.0�x
��default�œK�p�����B

�����ɕs���Ȓl���n���ꂽ�ꍇ���A
default�l���K�p�����B




������
1. [IN] �ϐ��܂��́A���l�@�F�@near
�@�@�N���b�s���O�̋߂����̋���
�@�@�����B

2. [IN] �ϐ��܂��́A���l�@�F�@far 
�@�@�N���b�s���O�̉������̋���
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@fovdeg
�@�@����p�idegree�j
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetKeyboardState
256 �̉��z�L�[�̏�Ԃ��A�w�肳�ꂽ�o�b�t�@keybuf�փR�s�[���܂��B
%group
Easy3D For HSP3 : �L�[�{�[�h

%prm
p1
p1 : [OUT] �ϐ��@�F�@keybuf

%inst
256 �̉��z�L�[�̏�Ԃ��A�w�肳�ꂽ�o�b�t�@keybuf�փR�s�[���܂��B

keybuf �́A���̊֐����g�p����O�ɁA
dim keybuf, 256
�ŁA�m�ۂ��Ă��������B

�����̃L�[�̏�Ԃ��A��x�̌Ăяo���ŁA
�擾�ł��܂��B

�Ⴆ�΁A�`�L�[��������Ă��邩�ǂ�����
�m���߂�ꍇ�́A
E3DGetKeyboardState
�Ăяo����ɁA
keybuf('A') �̒l�𒲂ׂ܂��B
�i�@�f�@��Y�ꂸ�ɁB�@�j
�O�������Ă����ꍇ�́A������Ă��܂���B
�P�������Ă����ꍇ�́A������Ă��܂��B

��̓I�Ȏg�p��́Azip���́Ahsp �t�@�C�����������������B

�o�[�`�����L�[���́Azip���́A
e3dhsp3.as �ŁA
VK_ �Ŏn�܂�萔�Ƃ��āA�錾���Ă��܂��B

html{
<table border="1">
	<tr><th>�萔</th>	<th>�L�[����</th>	<th>�L�[����</th></tr>
	<tr><td>VK_LBUTTON</td>	<td>�}�E�X�@���N���b�N</td>	<td></td></tr>
	<tr><td>VK_RBUTTON</td>	<td>�}�E�X�@�E�N���b�N</td>	<td></td></tr>
	<tr><td>VK_CANCEL </td>	<td>Ctrl + Break</td>	<td></td></tr>

	<tr><td>VK_MBUTTON</td>	<td>�z�C�[���N���b�N</td>	<td></td></tr>
	<tr><td>VK_BACK   </td>	<td>Back Space</td>	<td></td></tr>
	<tr><td>VK_TAB    </td>	<td>Tab�L�[</td>	<td></td></tr>

	<tr><td>VK_CLEAR  </td>	<td>NumLock ���O������Ԃ̃e���L�[5</td>	<td></td></tr>
	<tr><td>VK_RETURN </td>	<td>Enter</td>	<td></td></tr>
	<tr><td>VK_SHIFT  </td>	<td>Shift</td>	<td></td></tr>

	<tr><td>VK_CONTROL</td>	<td>Ctrl</td>	<td></td></tr>
	<tr><td>VK_MENU   </td>	<td>Alt</td>	<td></td></tr>
	<tr><td>VK_PAUSE  </td>	<td>Pause</td>	<td>Ctrl + NumLock</td></tr>

	<tr><td>VK_CAPITAL</td>	<td>Shift + CapsLock</td>	<td></td></tr>
	<tr><td>VK_HANJA  </td>	<td>Alt + ���p�^�S�p�i�����j</td>	<td></td></tr>
	<tr><td>VK_KANJI  </td>	<td>Alt + ���p�^�S�p�i�����j</td>	<td></td></tr>
	<tr><td>VK_ESCAPE </td>	<td>Esc</td>	<td></td></tr>
	<tr><td>VK_SPACE   </td>	<td>�X�y�[�X�L�[</td>	<td></td></tr>

	<tr><td>VK_PRIOR   </td>	<td>PageUp</td>	<td></td></tr>
	<tr><td>VK_NEXT    </td>	<td>PageDown</td>	<td></td></tr>
	<tr><td>VK_END     </td>	<td>End</td>	<td>Shift + �e���L�[1</td></tr>

	<tr><td>VK_HOME    </td>	<td>Home</td>	<td>Shift + �e���L�[7</td></tr>
	<tr><td>VK_LEFT    </td>	<td>�����L�[</td>	<td>Shift + �e���L�[4</td></tr>
	<tr><td>VK_UP      </td>	<td>����L�[</td>	<td>Shift + �e���L�[8</td></tr>
	<tr><td>VK_RIGHT   </td>	<td>�E���L�[</td>	<td>Shift + �e���L�[6</td></tr>
	<tr><td>VK_DOWN    </td>	<td>�����L�[</td>	<td>Shift + �e���L�[2</td></tr>
	<tr><td>VK_SNAPSHOT</td>	<td>PrintScreen</td>	<td></td></tr>
	<tr><td>VK_INSERT  </td>	<td>Insert</td>	<td>Shift + �e���L�[0</td></tr>

	<tr><td>VK_DELETE  </td>	<td>Delete</td>	<td>Shift + �e���L�[.</td></tr>
	<tr><td>'0'</td>	<td>0</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>'9'</td>	<td>9</td>	<td></td></tr>
	<tr><td>'A'</td>	<td>A</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>'Z'</td>	<td>Z</td>	<td></td></tr>
	<tr><td>VK_LWIN </td>	<td>�E�B���h�E�Y�L�[�i���j</td>	<td></td></tr>
	<tr><td>VK_RWIN </td>	<td>�E�B���h�E�Y�L�[�i�E�j</td>	<td></td></tr>
	<tr><td>VK_APPS </td>	<td>Application�L�[	�i�E�N���b�N�Ɠ����@�\�̃L�[�̂��Ƃł��B�j</td>	<td></td></tr>

	<tr><td>VK_NUMPAD0  </td>	<td>�e���L�[�̂O</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>VK_NUMPAD9  </td>	<td>�e���L�[�̂X</td>	<td></td></tr>

	<tr><td>VK_MULTIPLY </td>	<td>�e���L�[�� *</td>	<td></td></tr>
	<tr><td>VK_ADD      </td>	<td>�e���L�[�� +</td>	<td></td></tr>
	<tr><td>VK_SUBTRACT </td>	<td>�e���L�[�� -</td>	<td></td></tr>
	<tr><td>VK_DECIMAL  </td>	<td>�e���L�[�� .</td>	<td></td></tr>
	<tr><td>VK_DIVIDE   </td>	<td>�e���L�[�� /</td>	<td></td></tr>

	<tr><td>VK_F1 </td>	<td>F1</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>VK_F12</td>	<td>F12</td>	<td></td></tr>
	<tr><td>VK_NUMLOCK</td>	<td>NumLock</td>	<td></td></tr>
	<tr><td>VK_SCROLL </td>	<td>ScrollLock</td>	<td></td></tr>
</table>

<br>
<table border="1">
	<tr><th>�萔</th>	<th>�L�[����</th>	<th>�L�[����</th></tr>

	<tr><td>VK_LSHIFT  </td>	<td>Shift�i���j</td>	<td></td></tr>
	<tr><td>VK_RSHIFT  </td>	<td>Shift�i�E�j</td>	<td></td></tr>
	<tr><td>VK_LCONTROL</td>	<td>Ctrl�i���j</td>	<td></td></tr>

	<tr><td>VK_RCONTROL</td>	<td>Ctrl�i�E�j</td>	<td></td></tr>
	<tr><td>VK_LMENU   </td>	<td>Alt�i���j</td>	<td></td></tr>
	<tr><td>VK_RMENU   </td>	<td>Alt�i�E�j</td>	<td></td></tr>

	<tr><td>VK_OEM_1     </td>	<td>';:' for US</td>	<td>:*</td></tr>
	<tr><td>VK_OEM_PLUS  </td>	<td>'+' any country</td>	<td>;+</td></tr>
	<tr><td>VK_OEM_COMMA </td>	<td>',' any country</td>	<td>,&lt;</td></tr>

	<tr><td>VK_OEM_MINUS </td>	<td>'-' any country</td>	<td>-=</td></tr>
	<tr><td>VK_OEM_PERIOD</td>	<td>'.' any country</td>	<td>.&gt;</td></tr>
	<tr><td>VK_OEM_2     </td>	<td>'/?' for US</td>	<td>/?</td></tr>

	<tr><td>VK_OEM_3     </td>	<td>'`~' for US</td>	<td>@`</td></tr>
	<tr><td>VK_OEM_4</td>	<td>'[{' for US</td>	<td>[{</td></tr>
	<tr><td>VK_OEM_5</td>	<td>'\|' for US</td>	<td>\ |</td></tr>

	<tr><td>VK_OEM_6</td>	<td>']}' for US</td>	<td>]}</td></tr>
	<tr><td>VK_OEM_7</td>	<td>''"' for US</td>	<td>^~</td></tr>
</table>

<br>
<table border="1">
	<tr><th>�萔</th>	<th>�L�[����</th>	<th>�L�[����</th></tr>
	<tr><td>VK_OEM_102  </td>	<td>"<>" or "\|" on RT 102-key kbd.</td>	<td>_��</td></tr>
</table>
}html


������
1. [OUT] �ϐ��@�F�@keybuf
�@�@keybuf�ɁA�L�[�̏�Ԃ��A�������܂��B
�@�@keybuf�́Adim keybuf, 256 �ŁA
�@�@�쐬����Ă���K�v������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DCos
cos���擾����B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@degree
p2 : [OUT] �ϐ��@�F�@ret

%inst
cos���擾����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@degree
�@�@degree�x��cos���v�Z���܂��B
�@�@�����B

2. [OUT] �ϐ��@�F�@ret
�@�@cos �̌��ʂ��Z�b�g�����B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSin
sin���擾����B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@degree
p2 : [OUT] �ϐ��@�F�@ret

%inst
sin���擾����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@degree
�@�@degree�x��sin���v�Z���܂��B
�@�@�����B

2. [OUT] �ϐ��@�F�@ret
�@�@sin �̌��ʂ��Z�b�g�����B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DACos
acos���擾����B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@dot
p2 : [OUT] �ϐ��@�F�@degree

%inst
acos���擾����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@dot
�@�@���Ƃ��΁A���ς������B

2. [OUT] �ϐ��@�F�@degree
�@�@acos( dot ) ��
�@�@degree�ɃZ�b�g�����B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DDot
(vecx1, vecy1, vecz1)�ƁA�ivecx2, vecy2, vecz2�j���A���ꂼ�ꐳ�K���������̓��m�̓��ς��擾����B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@vecx1
p2 : [IN] �ϐ��܂��́A���l�@�F�@vecy1 
p3 : [IN] �ϐ��܂��́A���l�@�F�@vecz1
p4 : [IN] �ϐ��܂��́A���l�@�F�@vecx2
p5 : [IN] �ϐ��܂��́A���l�@�F�@vecy2 
p6 : [IN] �ϐ��܂��́A���l�@�F�@vecz2
p7 : [OUT] �ϐ��@�F�@ret

%inst
(vecx1, vecy1, vecz1)�ƁA�ivecx2, vecy2, vecz2�j���A���ꂼ�ꐳ�K���������̓��m�̓��ς��擾����B




������
1. [IN] �ϐ��܂��́A���l�@�F�@vecx1
2. [IN] �ϐ��܂��́A���l�@�F�@vecy1 
3. [IN] �ϐ��܂��́A���l�@�F�@vecz1
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@vecx2
5. [IN] �ϐ��܂��́A���l�@�F�@vecy2 
6. [IN] �ϐ��܂��́A���l�@�F�@vecz2
�@�@�����B

7. [OUT] �ϐ��@�F�@ret
�@�@���ʂ���������B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DCross
(vecx1, vecy1, vecz1)�ƁA�ivecx2, vecy2, vecz2�j�̗����ɐ����ŁA�傫�����P �ȃx�N�g��(retx, rety,
retz)���擾����B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] �ϐ��܂��́A���l�@�F�@vecx1
p2 : [IN] �ϐ��܂��́A���l�@�F�@vecy1 
p3 : [IN] �ϐ��܂��́A���l�@�F�@vecz1
p4 : [IN] �ϐ��܂��́A���l�@�F�@vecx2
p5 : [IN] �ϐ��܂��́A���l�@�F�@vecy2 
p6 : [IN] �ϐ��܂��́A���l�@�F�@vecz2
p7 : [OUT] �ϐ��@�F�@retx
p8 : [OUT] �ϐ��@�F�@rety
p9 : [OUT] �ϐ��@�F�@retz

%inst
(vecx1, vecy1, vecz1)�ƁA�ivecx2, vecy2, vecz2�j�̗����ɐ����ŁA�傫�����P �ȃx�N�g��(retx, rety,
retz)���擾����B




������
1. [IN] �ϐ��܂��́A���l�@�F�@vecx1
2. [IN] �ϐ��܂��́A���l�@�F�@vecy1 
3. [IN] �ϐ��܂��́A���l�@�F�@vecz1
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@vecx2
5. [IN] �ϐ��܂��́A���l�@�F�@vecy2 
6. [IN] �ϐ��܂��́A���l�@�F�@vecz2
�@�@�����B

7. [OUT] �ϐ��@�F�@retx
8. [OUT] �ϐ��@�F�@rety
9. [OUT] �ϐ��@�F�@retz
�@�@���ʂ���������B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DAtan
atan ( val ) ��degree���擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@val
p2 : [OUT] �ϐ��@�F�@retdeg

%inst
atan ( val ) ��degree���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@val
�@�@�����B

2. [OUT] �ϐ��@�F�@retdeg
�@�@retdeg�ɁAatan( val ) �̊p�x(degree)������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DAtan2
atan2( y, x ) ��degree���擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@y
p2 : [IN] �ϐ��܂��́A���l�@�F�@x 
p3 : [OUT] �ϐ��@�F�@retdeg

%inst
atan2( y, x ) ��degree���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@y
2. [IN] �ϐ��܂��́A���l�@�F�@x 
�@�@�����B

3. [OUT] �ϐ��@�F�@retdeg
�@�@retdeg�ɁAatan2( y, x ) �̊p�x(degree)������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSqrt
sqrt( val ) ���擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@val
p2 : [OUT] �ϐ��@�F�@ret

%inst
sqrt( val ) ���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@val
�@�@�����B

2. [OUT] �ϐ��@�F�@ret
�@�@ret�ɁAsqrt( val ) ������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DDrawText
��ʏ��(posx, posy) �ɁAr, g, b �Ŏw�肵���F�ŁAstr�̕�����������B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@posx
p2 : [IN] �ϐ��܂��́A���l�@�F�@posy 
p3 : [IN] �ϐ��܂��́A���l�@�F�@scale
p4 : [IN] �ϐ��܂��́A���l�@�F�@r 
p5 : [IN] �ϐ��܂��́A���l�@�F�@g
p6 : [IN] �ϐ��܂��́A���l�@�F�@b 
p7 : [IN] ������܂��́A������ϐ��@�F�@str

%inst
��ʏ��(posx, posy) �ɁAr, g, b �Ŏw�肵���F�ŁAstr�̕�����������B

�p�����̂݁B
scale���P.0�̂Ƃ��́A�P�Q�|�C���g�̑傫���B
\n�ŉ��s�ł��܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@posx
2. [IN] �ϐ��܂��́A���l�@�F�@posy 
�@�@���W�B�����B

3. [IN] �ϐ��܂��́A���l�@�F�@scale
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@r 
5. [IN] �ϐ��܂��́A���l�@�F�@g
6. [IN] �ϐ��܂��́A���l�@�F�@b 
�@�@�F�i�O����Q�T�T�j

7. [IN] ������܂��́A������ϐ��@�F�@str
�@�@�\��������B



�o�[�W���� : ver1.0.0.1

%index
E3DDrawBigText
��ʏ��(posx, posy) �ɁAr, g, b �Ŏw�肵���F�ŁAstr�̕�����������B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@posx
p2 : [IN] �ϐ��܂��́A���l�@�F�@posy 
p3 : [IN] �ϐ��܂��́A���l�@�F�@scale
p4 : [IN] �ϐ��܂��́A���l�@�F�@r 
p5 : [IN] �ϐ��܂��́A���l�@�F�@g
p6 : [IN] �ϐ��܂��́A���l�@�F�@b 
p7 : [IN] ������܂��́A������ϐ��@�F�@str

%inst
��ʏ��(posx, posy) �ɁAr, g, b �Ŏw�肵���F�ŁAstr�̕�����������B

�p�����̂݁B
scale���P�̂Ƃ��́A�R�U�|�C���g�̑傫���B




������
1. [IN] �ϐ��܂��́A���l�@�F�@posx
2. [IN] �ϐ��܂��́A���l�@�F�@posy 
�@�@���W�B�����B

3. [IN] �ϐ��܂��́A���l�@�F�@scale
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@r 
5. [IN] �ϐ��܂��́A���l�@�F�@g
6. [IN] �ϐ��܂��́A���l�@�F�@b 
�@�@�F�i�O����Q�T�T�j

7. [IN] ������܂��́A������ϐ��@�F�@str
�@�@�\��������B



�o�[�W���� : ver1.0.0.1

%index
E3DRand
0����irange - 1�j�܂ł̊Ԃ́A�������擾����B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@range
p2 : [OUT] �ϐ��@�F�@rand

%inst
0����irange - 1�j�܂ł̊Ԃ́A�������擾����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@range
�@�@�����͈̔͂��w�肷��B
�@�@�����B

2. [OUT] �ϐ��@�F�@rand
�@�@�������Z�b�g�����B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DSeed
�����̏�����������B
%group
Easy3D For HSP3 : �Z�p

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@seed

%inst
�����̏�����������B
�i������seed���Z�b�g����B�j
srand( (unsigned)seed )�����s����B



������
1. [IN] �ϐ��܂��́A���l�@�F�@seed
�@�@srand�ɓn���l���w�肷��B



�o�[�W���� : ver1.0.0.1

%index
E3DWaitByFPS
�w�肵��fps�ɁA�߂��Ȃ�悤�ɁAwait���܂��B
%group
Easy3D For HSP3 : ����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@������
p2 : [OUT] �ϐ��@�F�@retfps

%inst
�w�肵��fps�ɁA�߂��Ȃ�悤�ɁAwait���܂��B

�������Ƃ́A1�b�Ԃɕ`�悷��̂��Ɖ񐔂ł��B

�w�肵���������ȏ�A
�������s��Ȃ��悤�ɂ��邽�߂̖��߂ł��B

�x���}�V�����A�����Ȃ�킯�ł͂Ȃ��̂ŁA
���ӂ��Ă��������B

�K���AHSP�̕W�����߁A�hawait 0�h��
�Z�b�g�Ŏg�p���Ă��������B

���ۂ̂��������Aretfps�ϐ��ɁA�������܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@������
�@�@�w�肵���������ɁA�߂��Ȃ�悤�ɁAwait���܂��B
�@�@�����B

2. [OUT] �ϐ��@�F�@retfps
�@�@���ۂ�fps���������܂��B
�@�@�����B


�o�[�W���� : ver1.0.0.1

%index
E3DGetFPS
fps���v�����܂��B
%group
Easy3D For HSP3 : ����

%prm
p1
p1 : [OUT] �ϐ��@�F�@retfps

%inst
fps���v�����܂��B

���C�����[�v�̍Ō�ȂǂŌĂяo�����Ƃ�z�肵�Ă��܂��B
E3DGetFPS���Ă΂�鎞�ԊԊu����A
1�b�Ԃ�����ɁA����Ăяo����邩���v�Z���܂��B





������
1. [OUT] �ϐ��@�F�@retfps
�@�@fps���������܂��B
�@�@�����B


�o�[�W���� : ver1.0.0.1

%index
E3DCreateLight
�������쐬���܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1
p1 : [OUT] �ϐ��@�F�@lightID

%inst
�������쐬���܂��B

�����̎��ʔԍ��AlightID���擾�ł��܂��B
�Ȍ�A�����̃p�����[�^�̐ݒ�ɂ́A
���́AlightID���g�p���܂��B




������
1. [OUT] �ϐ��@�F�@lightID
�@�@�쐬�������C�g�����ʂ���ID�B


�o�[�W���� : ver1.0.0.1

%index
E3DSetDirectionalLight
lightID�Ŏ��ʂ��������ɁA���s�����̃p�����[�^���Z�b�g����B
%group
Easy3D For HSP3 : ���C�g

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@lightID
p2 : [IN] �ϐ��܂��́A���l�@�F�@dirx
p3 : [IN] �ϐ��܂��́A���l�@�F�@diry 
p4 : [IN] �ϐ��܂��́A���l�@�F�@dirz
p5 : [IN] �ϐ��܂��́A���l�@�F�@r
p6 : [IN] �ϐ��܂��́A���l�@�F�@g 
p7 : [IN] �ϐ��܂��́A���l�@�F�@b

%inst
lightID�Ŏ��ʂ��������ɁA���s�����̃p�����[�^���Z�b�g����B




������
1. [IN] �ϐ��܂��́A���l�@�F�@lightID
�@�@���������ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@dirx
3. [IN] �ϐ��܂��́A���l�@�F�@diry 
4. [IN] �ϐ��܂��́A���l�@�F�@dirz
�@�@���s�����̌������A
�@�@�x�N�g��(dirx, diry, dirz)�𐳋K�������x�N�g���ɁA
�@�@�ݒ肷��B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@r
6. [IN] �ϐ��܂��́A���l�@�F�@g 
7. [IN] �ϐ��܂��́A���l�@�F�@b
�@�@���s�����̐F���A
�@�@�ir, g, b�j�ɐݒ肷��B
�@�@�e�F�̒l�́A�O����Q�T�T�܂ł̒l�Ƃ���B



�o�[�W���� : ver1.0.0.1

%index
E3DSetPointLight
lightID�Ŏ��ʂ��������ɁA�|�C���g���C�g�̃p�����[�^���Z�b�g����B
%group
Easy3D For HSP3 : ���C�g

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] �ϐ��܂��́A���l�@�F�@lightID
p2 : [IN] �ϐ��܂��́A���l�@�F�@posx
p3 : [IN] �ϐ��܂��́A���l�@�F�@posy 
p4 : [IN] �ϐ��܂��́A���l�@�F�@posz
p5 : [IN] �ϐ��܂��́A���l�@�F�@dist
p6 : [IN] �ϐ��܂��́A���l�@�F�@r
p7 : [IN] �ϐ��܂��́A���l�@�F�@g 
p8 : [IN] �ϐ��܂��́A���l�@�F�@b

%inst
lightID�Ŏ��ʂ��������ɁA�|�C���g���C�g�̃p�����[�^���Z�b�g����B


������
1. [IN] �ϐ��܂��́A���l�@�F�@lightID
�@�@���������ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@posx
3. [IN] �ϐ��܂��́A���l�@�F�@posy 
4. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�|�C���g���C�g�̈ʒu���A
�@�@�iposx, posy, posz�j�ɐݒ肷��B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@dist
�@�@�|�C���g���C�g�̌����͂�������ݒ肵�܂��B
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@r
7. [IN] �ϐ��܂��́A���l�@�F�@g 
8. [IN] �ϐ��܂��́A���l�@�F�@b
�@�@�|�C���g���C�g�̐F���A
�@�@�ir, g, b�j�ɐݒ肷��B
�@�@�e�F�̒l�́A�O����Q�T�T�܂ł̒l�Ƃ���B



�o�[�W���� : ver1.0.0.1

%index
E3DSetSpotLight
lightID�Ŏ��ʂ��������ɁA�X�|�b�g���C�g�̃p�����[�^���Z�b�g����B
%group
Easy3D For HSP3 : ���C�g

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12
p1 : [IN] �ϐ��܂��́A���l�@�F�@lightID
p2 : [IN] �ϐ��܂��́A���l�@�F�@posx
p3 : [IN] �ϐ��܂��́A���l�@�F�@posy 
p4 : [IN] �ϐ��܂��́A���l�@�F�@posz
p5 : [IN] �ϐ��܂��́A���l�@�F�@dirx
p6 : [IN] �ϐ��܂��́A���l�@�F�@diry 
p7 : [IN] �ϐ��܂��́A���l�@�F�@dirz
p8 : [IN] �ϐ��܂��́A���l�@�F�@dist
p9 : [IN] �ϐ��܂��́A���l�@�F�@angle
p10 : [IN] �ϐ��܂��́A���l�@�F�@r
p11 : [IN] �ϐ��܂��́A���l�@�F�@g 
p12 : [IN] �ϐ��܂��́A���l�@�F�@b

%inst
lightID�Ŏ��ʂ��������ɁA�X�|�b�g���C�g�̃p�����[�^���Z�b�g����B


���̖��߂́A���݃T�|�[�g����Ă��܂���B



������
1. [IN] �ϐ��܂��́A���l�@�F�@lightID
�@�@���������ʂ���id


2. [IN] �ϐ��܂��́A���l�@�F�@posx
3. [IN] �ϐ��܂��́A���l�@�F�@posy 
4. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�X�|�b�g���C�g�̈ʒu���A
�@�@�iposx, posy, posz�j�ɐݒ肷��B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@dirx
6. [IN] �ϐ��܂��́A���l�@�F�@diry 
7. [IN] �ϐ��܂��́A���l�@�F�@dirz
�@�@�X�|�b�g���C�g�̌������A
�@�@�x�N�g��(dirx, diry, dirz)�𐳋K�������x�N�g���ɁA
�@�@�ݒ肷��B
�@�@�����B

8. [IN] �ϐ��܂��́A���l�@�F�@dist
�@�@�X�|�b�g���C�g�̌����͂�������ݒ肵�܂��B
�@�@�����B

9. [IN] �ϐ��܂��́A���l�@�F�@angle
�@�@�X�|�b�g���C�g�̏Ƃ炷�p�x�idegree�j��ݒ肵�܂��B
�@�@�����B

10. [IN] �ϐ��܂��́A���l�@�F�@r
11. [IN] �ϐ��܂��́A���l�@�F�@g 
12. [IN] �ϐ��܂��́A���l�@�F�@b
�@�@�X�|�b�g���C�g�̐F���A
�@�@�ir, g, b�j�ɐݒ肷��B
�@�@�e�F�̒l�́A�O����Q�T�T�܂ł̒l�Ƃ���B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyLight
���C�g��j�����܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@lightID

%inst
���C�g��j�����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@lightID
�@�@�폜����������A���ʂ���id



�o�[�W���� : ver1.0.0.1

%index
E3DClearZ
�y�o�b�t�@�[���N���A�[���܂��B
%group
Easy3D For HSP3 : �`��

%prm
�Ȃ�

%inst
�y�o�b�t�@�[���N���A�[���܂�


������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DDestroyHandlerSet
E3DSigLoad, E3DAddMotion�ō쐬�����A
�I�u�W�F�N�g��j�����܂��B
%group
Easy3D For HSP3 : �㏈��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
E3DSigLoad, E3DAddMotion�ō쐬�����A
�I�u�W�F�N�g��j�����܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id


�o�[�W���� : ver1.0.0.1

%index
E3DSetDispSwitch
�f�B�X�v���C�X�C�b�`�̃I���A�I�t��
�s�����Ƃ��o���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@mk
p3 : [IN] �ϐ��܂��́A���l�@�F�@switchID
p4 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p5 : [IN] �ϐ��܂��́A���l�@�F�@flag

%inst
�f�B�X�v���C�X�C�b�`�̃I���A�I�t��
�s�����Ƃ��o���܂��B

�f�B�X�v���C�X�C�b�`�̏ڍׂ́A
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_dispswitch.htm )�f�B�X�v���C�X�C�b�`�̐������������������B



mk������-1���w�肷��ƁA
���[�V������ǂݍ���ł��Ȃ��Ă��A
�f�B�X�v���C�X�C�b�`���I���I�t���邱�Ƃ��o���܂��B
mk��-1���w�肵�āA
�X�C�b�`����ł��I���ɂ����ꍇ�́A
���[�V������ǂݍ��񂾏ꍇ���A
���[�V�����̃X�C�b�`��Ԃ����D�悳��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@mk
�@�@���[�V���������ʂ���ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@switchID
�@�@�ύX�������X�C�b�`�̔ԍ�

4. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ��Aframeno����̃t���[����
�@�@�X�C�b�`���A
�@�@flag�Ɋ�Â��āA�I���A�I�t���܂��B

5. [IN] �ϐ��܂��́A���l�@�F�@flag
�@�@flag�ɂP���w�肷��ƁA�X�C�b�`���I���ɁA
�@�@�O���w�肷��ƁA�X�C�b�`���I�t�ɂ��܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetMotionFrameNo
E3DSetMotionKind�̊g���łł��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@mk
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno

%inst
E3DSetMotionKind�̊g���łł��B

���[�V�����̎�ނƁA�t���[���ԍ���
�Z�b�g���邱�Ƃ��o���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@mk
�@�@���[�V���������ʂ���ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DCreateSprite
�X�v���C�g���쐬���܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@transparentflag
p3 : [OUT] �ϐ��@�F�@spriteID
p4 : [IN] �ϐ��܂��́A���l�@�F�@tpR
p5 : [IN] �ϐ��܂��́A���l�@�F�@tpG
p6 : [IN] �ϐ��܂��́A���l�@�F�@tpB

%inst
�X�v���C�g���쐬���܂��B
spriteID�ŁA�X�v���C�g�����ʂ���h�c���A
�擾�ł��܂��B

�X�v���C�g�̑��쎞�ɂ́A���́AspriteID��
�g�p���܂��B

�쐬�����X�v���C�g�̃T�C�Y�́A
���̉摜�t�@�C���̑傫���ƁA
�قȂ�ꍇ������܂��B

�T�C�Y�́AE3DGetSpriteSize �ŁA
�m�F���Ă��������B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�摜�t�@�C�����B

2. [IN] �ϐ��܂��́A���l�@�F�@transparentflag
�@�@���߃t���O�B

�@�@�摜�t�@�C���̃A���t�@�����Ƃɓ��߂���ꍇ�A
�@�@���邢�́A�摜�t�@�C���ɃA���t�@���������߂����Ȃ��ꍇ�A
�@�@�O���w�肵�Ă��������B

�@�@�P���Z�b�g����ƁA���F�𓧉ߐF�Ƃ��ĐF�������܂��B

�@�@�Q���Z�b�g����ƁA�itpR, tpG, tpB�j�Ŏw�肵���F��
�@�@���ߐF�Ƃ��܂�

�@�@���̊֐���transparetflag�̈Ӗ��́A
�@�@���̊֐���transparent�Ƃ́A�Ⴄ�̂ŁA
�@�@�C��t���Ă��������B


3. [OUT] �ϐ��@�F�@spriteID
�@�@�쐬�����X�v���C�g�����ʂ���h�c�B

4. [IN] �ϐ��܂��́A���l�@�F�@tpR
5. [IN] �ϐ��܂��́A���l�@�F�@tpG
6. [IN] �ϐ��܂��́A���l�@�F�@tpB
�@�@transparentflag = 2 �̂Ƃ��A
�@�@���ߐF���A(tpR, tpG, tpB)�Ŏw�肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DBeginSprite
�X�v���C�g��`��ł���悤�ɁA
�f�o�C�X���������܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
�Ȃ�

%inst
�X�v���C�g��`��ł���悤�ɁA
�f�o�C�X���������܂��B

E3DRenderSprite���߂��A
E3DBeginSprite�ƁAE3DEndSprite�ŁA
�T���h�C�b�`����悤�ɁA�L�q���Ă��������B

E3DBeginSprite��E3DEndSprite�́A
E3DBeginScene��E3DEndScene�̊ԂɋL�q���Ă��������B

�X�v���C�g��`�悷��ƁA�����_�[�X�e�[�g���ω�����̂ŁA
hsid�Ȃǂ�`�悵����A�Ō�ɁA�X�v���C�g�̕`�施�߂��������Ƃ��������߂��܂��B




������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DEndSprite

E3DRenderSprite���߂��A
E3DBeginSprite�ƁAE3DEndSprite�ŁA
�T���h�C�b�`����悤�ɁA�L�q���Ă��������B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
�Ȃ�

%inst

E3DRenderSprite���߂��A
E3DBeginSprite�ƁAE3DEndSprite�ŁA
�T���h�C�b�`����悤�ɁA�L�q���Ă��������B



������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DRenderSprite
spriteID�Ŏ��ʂ����A�X�v���C�g���A�����_�����O���܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@spriteID
p2 : [IN] �ϐ��܂��́A���l�@�F�@scalex
p3 : [IN] �ϐ��܂��́A���l�@�F�@scaley
p4 : [IN] �ϐ��܂��́A���l�@�F�@trax
p5 : [IN] �ϐ��܂��́A���l�@�F�@tray
p6 : [IN] �ϐ��܂��́A���l�@�F�@traz

%inst
spriteID�Ŏ��ʂ����A�X�v���C�g���A�����_�����O���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@spriteID
�@�@�X�v���C�g�����ʂ���h�c�B

2. [IN] �ϐ��܂��́A���l�@�F�@scalex
3. [IN] �ϐ��܂��́A���l�@�F�@scaley
�@�@�X�v���C�g�̂����A���������̔{�����w�肵�܂��B
�@�@�������w��B�i���{�͂P�D�O�j


4. [IN] �ϐ��܂��́A���l�@�F�@trax
5. [IN] �ϐ��܂��́A���l�@�F�@tray
�@�@�X�v���C�g�̕`��ʒu�itrax, tray�j���w�肵�܂��B
�@�@�w�肵���ʒu���A�X�v���C�g�̍���̍��W�ƂȂ�܂��B
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@traz
�@�@�`�掞�̉��s�����B
�@�@�RD�`��Ƃ̑O��֌W�ɂ��A���f����܂��B

�@�@0.0����1.0�̎������w�肵�Ă��������B
�@�@0.0�̂Ƃ��A��Ԏ�O�ɕ`�悳��A
�@�@1.0�̂Ƃ��A��ԉ��ɕ`�悳��܂��B

�@�@0.0����1.0�̊Ԃ́A�ϓ��Ȍ��ʂł͂���܂���B
�@�@�l�𑝂₵�Ă��A���܂���ʂ̖����ꏊ��A
�@�@�����A�l�𑝂₵�������ŁA���ʂ��傫���Ȃ�͈͂��@�@����܂��B
�@�@Easy3D�̏ꍇ�́A0.99�ȍ~���A
�@�@�����l�𑝂₵�������ŁA
�@�@���ʂ��傫���͈͂ƂȂ�܂��B



�o�[�W���� : ver1.0.0.1<BR>
      <BR>
      ver2.0.0.4�ň����ǉ�<BR>
      

%index
E3DGetSpriteSize
spriteID�Ŏ��ʂ����A�X�v���C�g�́A�T�C�Y���擾���܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@spriteID
p2 : [OUT] �ϐ��@�F�@spriteWidth
p3 : [OUT] �ϐ��@�F�@spriteHeight

%inst
spriteID�Ŏ��ʂ����A�X�v���C�g�́A�T�C�Y���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@spriteID
�@�@�X�v���C�g�����ʂ���h�c�B

2. [OUT] �ϐ��@�F�@spriteWidth
3. [OUT] �ϐ��@�F�@spriteHeight
�@�@���ƁA�������A���ꂼ��AspriteWidth, spriteHeight��
�@�@�������܂��B
�@�@�����^�ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetSpriteRotation
E3DCreateSprite���߂ō쐬�����X�v���C�g����]�����܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@spid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@centerx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@centery
p4 : [IN] ���l�܂��́A�ϐ��@�F�@rotdeg

%inst
E3DCreateSprite���߂ō쐬�����X�v���C�g����]�����܂��B

�icenterx, centery�j�̍��W�𒆐S�ɉ�]���܂��B
�i0, 0�j���w�肷��ƁA�X�v���C�g�̍���𒆐S�ɉ�]���܂��B

�X�v���C�g�̒����𒆐S�ɉ�]�������Ƃ��́A
�܂��AE3DGetSpriteSize���߂ŁA
�X�v���C�g�̃T�C�Y�Asizex, sizey ���擾���܂��B
centerx = sizex / 2
centery = sizey / 2
�̒l�����̊֐��ɓn���΁A�n�j�ł��B

��]�p�x�́A��Ηʂł��B
���Ηʂł͂���܂���B

E3DSetSpriteRotation���߂́A
��x�A�Ăяo���΁A�����ŁA�����L�����܂��̂ŁA���ɈقȂ�p�����[�^�ŌĂяo���܂ŁA
���̒l���L���ɂȂ�܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@spid
�@�@�X�v���C�g�f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@centerx
3. [IN] ���l�܂��́A�ϐ��@�F�@centery
�@�@(centerx, centery)�̍��W�𒆐S�ɉ�]���܂��B
�@�@�����Ή��B

4. [IN] ���l�܂��́A�ϐ��@�F�@rotdeg
�@�@rotdeg �x�����A�X�v���C�g����]���܂��B
�@�@�����B


�o�[�W���� : ver1.0.0.1

%index
E3DSetSpriteARGB
�X�v���C�g�ɏ�Z����F���w�肵�܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@spid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@alpha
p3 : [IN] ���l�܂��́A�ϐ��@�F�@r
p4 : [IN] ���l�܂��́A�ϐ��@�F�@g
p5 : [IN] ���l�܂��́A�ϐ��@�F�@b

%inst
�X�v���C�g�ɏ�Z����F���w�肵�܂��B

alpha, r, g, b �ɂ́A���ꂼ��A
html{
<strong>�O����Q�T�T�܂ł̒l</strong>
}html��n���Ă��������B

alpha ��255��菬�����l��n���΁A
�������̃X�v���C�g�̕`�悪�o���܂��B

�X�v���C�g�̐F��ς������Ȃ��ꍇ�ɂ́A
r, g, b�ɂ́A255��n���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@spid
�@�@�X�v���C�g�f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@alpha
3. [IN] ���l�܂��́A�ϐ��@�F�@r
4. [IN] ���l�܂��́A�ϐ��@�F�@g
5. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�X�v���C�g�ɏ�Z����F���w�肵�܂��B
�@�@�������ɂ���ꍇ�ɂ́A
�@�@alpha��255��菬�����l�����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroySprite
spriteID�Ŏ��ʂ����A�X�v���C�g���A
�j�����܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@spriteID

%inst
spriteID�Ŏ��ʂ����A�X�v���C�g���A
�j�����܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@spriteID
�@�@�X�v���C�g�����ʂ���h�c�B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfBillboard2
�w�肵�����E���i���S�Ɣ��a�j�ƁA�S�Ẵr���{�[�h�Ƃ̂����蔻������܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] �ϐ��܂��́A���l�@�F�@centerx
p2 : [IN] �ϐ��܂��́A���l�@�F�@centery
p3 : [IN] �ϐ��܂��́A���l�@�F�@centerz
p4 : [IN] �ϐ��܂��́A���l�@�F�@r
p5 : [IN] �ϐ��܂��́A���l�@�F�@confrate
p6 : [OUT] �ϐ��@�F�@resultptr
p7 : [OUT] �ϐ��@�F�@confbbid
p8 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng
p9 : [OUT] �ϐ��@�F�@confnum

%inst
�w�肵�����E���i���S�Ɣ��a�j�ƁA�S�Ẵr���{�[�h�Ƃ̂����蔻������܂��B

hsid�̑���ɁA���E�����w�肷�邱�ƈȊO�́A
E3DChkConfBillboard�Ɠ����ł��B

�Փ˂����r���{�[�h�̂h�c���擾�ł��܂��B




������

1. [IN] �ϐ��܂��́A���l�@�F�@centerx
2. [IN] �ϐ��܂��́A���l�@�F�@centery
3. [IN] �ϐ��܂��́A���l�@�F�@centerz
�@�@���E���̒��S���W( centerx, centery, centerz )
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@r
�@�@���E���̔��a
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@confrate
�@�@�r���{�[�h�̋��E���̔��a�ɁA�|����W��
�@�@���a�@�~�@confrate
�@�@�Ōv�Z����܂��B
�@�@�����B

6. [OUT] �ϐ��@�F�@resultptr
�@�@�����蔻��̌��ʂ��������܂��B
�@�@���������ꍇ�͂P���A
�@�@������Ȃ������ꍇ�͂O���������܂��B


7. [OUT] �ϐ��@�F�@confbbid
8. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@�Փ˂����r���{�[�h�̂h�c���i�[���邽�߂̔z��
�@�@dim confbbid, arrayleng
�@�@�Ȃǂ̖��߂ŁA�z����쐬���āA
�@�@���̊֐��Ɏw�肵�Ă��������B

�@�@arrayleng�ȏ�̃r���{�[�h�ƁA
�@�@�����ɏՓ˂����ꍇ�ɂ́A�G���[�ɂȂ�̂ŁA
�@�@�z�񒷂�arrayleng�́A�����傫�߂̒l�ɂ��Ă��������B

9. [OUT] �ϐ��@�F�@confnum
�@�@�Փ˂����r���{�[�h�̌����������܂��B
�@�@maxno = confnum - 1
�@�@�Ƃ���ƁA
�@�@confbbid(0) ����Aconfbbid(maxno) �܂ł̊ԂɁA
�@�@�Փ˂����r���{�[�h�̂h�c���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfBillboard
hsid�Ŏ��ʂ���郂�f���f�[�^�ƁA�S�Ẵr���{�[�h�̂����蔻������܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@confrate
p3 : [OUT] �ϐ��@�F�@result
p4 : [OUT] �ϐ��@�F�@confbbid
p5 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng
p6 : [OUT] �ϐ��@�F�@confnum

%inst
hsid�Ŏ��ʂ���郂�f���f�[�^�ƁA�S�Ẵr���{�[�h�̂����蔻������܂��B

���E���ɂ�锻����s���܂��B

������Ȃ������ꍇ�́A
result�ɂO���������A
���������ꍇ�́A
result�ɂP���������܂��B

confrate�ŁA�r���{�[�h�̋��E���̑傫����ύX���邱�Ƃ��o���܂��B


�Ⴆ�΁Aconfrate��0.5������ƁA
�@���ۂ̔��a�~0.5
�܂�A�����̔��a�Ōv�Z����܂��B

confrate�ɏ����Ȓl�����邱�ƂŁA
���f�����r���{�[�h�̋߂���
���蔲���邱�Ƃ��o����悤�ɂȂ�܂��B


�Փ˂����r���{�[�h�̂h�c���擾�ł��܂��B

��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_ground.hsp</strong>
}html
���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ԍ�

2. [IN] �ϐ��܂��́A���l�@�F�@confrate
�@�@�r���{�[�h�̋��E���̔��a�ɁA�|����W��
�@�@���a�@�~�@confrate
�@�@�Ōv�Z����܂��B
�@�@�����B

3. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@���������ꍇ�͂P���A
�@�@������Ȃ������ꍇ�͂O���������܂��B

4. [OUT] �ϐ��@�F�@confbbid
5. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@�Փ˂����r���{�[�h�̂h�c���i�[���邽�߂̔z��
�@�@dim confbbid, arrayleng
�@�@�Ȃǂ̖��߂ŁA�z����쐬���āA
�@�@���̊֐��Ɏw�肵�Ă��������B

�@�@arrayleng�ȏ�̃r���{�[�h�ƁA
�@�@�����ɏՓ˂����ꍇ�ɂ́A�G���[�ɂȂ�̂ŁA
�@�@�z�񒷂�arrayleng�́A�����傫�߂̒l�ɂ��Ă��������B

6. [OUT] �ϐ��@�F�@confnum
�@�@�Փ˂����r���{�[�h�̌����������܂��B
�@�@maxno = confnum - 1
�@�@�Ƃ���ƁA
�@�@confbbid(0) ����Aconfbbid(maxno) �܂ł̊ԂɁA
�@�@�Փ˂����r���{�[�h�̂h�c���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfBySphere
���E���ɂ�邠���蔻����s���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p3 : [IN] �ϐ��܂��́A���l�@�F�@conflevel
p4 : [OUT] �ϐ��@�F�@confflag

%inst
���E���ɂ�邠���蔻����s���܂��B
����̍ۂɁAE3DChkInView�ŃZ�b�g����
�f�[�^���g�p���܂��B

conflevel�ɂP���w�肵���ꍇ�́A
���f���P�ʂ̑e������݂̂��s���܂��B

conflevel�ɂQ���w�肵���ꍇ�́A
�p�[�c�P�ʂ̔�����s���܂��B


���݂́A
�C�ӂ̃p�[�c���m�̂����蔻��̏o����A
E3DChkConfBySphere2������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@�`��f�[�^�����ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@conflevel
�@�@�P���w�肵���ꍇ�́A���f���P�ʂ̔�����A
�@�@�Q���w�肵���ꍇ�́A�p�[�c�P�ʂ̔�������܂��B

4. [OUT] �ϐ��@�F�@confflag
�@�@hsid1, hsid2�Ŏ��ʂ����`�󓯎m���A
�@�@�Փ˂��Ă���ꍇ�́A�P���A
�@�@�Փ˂��Ă��Ȃ��ꍇ�͂O���Z�b�g�����B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfBySphere2
���E���ɂ�邠���蔻����A�C�ӂ̃p�[�c���Ƃɍs���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno1
p3 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p4 : [IN] �ϐ��܂��́A���l�@�F�@partno2
p5 : [OUT] �ϐ��@�F�@confflag

%inst
���E���ɂ�邠���蔻����A�C�ӂ̃p�[�c���Ƃɍs���܂��B

����̍ۂɁAE3DChkInView�ŃZ�b�g����
�f�[�^���g�p���܂��B


partno1, partno2�ɂ́A
E3DGetPartNoByName�Ŏ擾����
�p�[�c�̔ԍ���n���Ă��������B

partno��-1���w�肷��ƁA
���f���S�̂Ƃ����蔻������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�`��f�[�^�����ʂ���id
2. [IN] �ϐ��܂��́A���l�@�F�@partno1
�@�@hsid1�̃��f�����̃p�[�c�̔ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@�`��f�[�^�����ʂ���id
4. [IN] �ϐ��܂��́A���l�@�F�@partno2
�@�@hsid2�̃��f�����̃p�[�c�̔ԍ�

5. [OUT] �ϐ��@�F�@confflag
�@�@hsid1, hsid2�Ŏ��ʂ����`�󓯎m���A
�@�@�Փ˂��Ă���ꍇ�́A�P���A
�@�@�Փ˂��Ă��Ȃ��ꍇ�͂O���Z�b�g�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCreateProgressBar
���C���E�C���h�E�̉��̕����ɁA�v���O���X�o�[�����܂��B
%group
Easy3D For HSP3 : �v���O���X�o�[

%prm
�Ȃ�

%inst
���C���E�C���h�E�̉��̕����ɁA�v���O���X�o�[�����܂��B




������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DSetProgressBar
��Ƃ̒B�����Ȃǂ��A
�v���O���X�o�[�ɕ\�������܂��B
%group
Easy3D For HSP3 : �v���O���X�o�[

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@newpos

%inst
��Ƃ̒B�����Ȃǂ��A
�v���O���X�o�[�ɕ\�������܂��B

newpos �́A�O����P�O�O�̊Ԃ̐����A
�Z�b�g���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@newpos
�@�@0����P�O�O�̒l�B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyProgressBar
�v���O���X�o�[���폜���܂��B
%group
Easy3D For HSP3 : �v���O���X�o�[

%prm
�Ȃ�

%inst
�v���O���X�o�[���폜���܂��B




������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DLoadGroundBMP
BMP�f�[�^����A�n�ʂ𐶐����܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10
p1 : [IN] ������܂��́A������ϐ��@�F�@filename1
p2 : [IN] ������܂��́A������ϐ��@�F�@filename2
p3 : [IN] ������܂��́A������ϐ��@�F�@filename3
p4 : [IN] ������܂��́A������ϐ��@�F�@filename4
p5 : [IN] �ϐ��܂��́A���l�@�F�@maxx
p6 : [IN] �ϐ��܂��́A���l�@�F�@maxz
p7 : [IN] �ϐ��܂��́A���l�@�F�@divx
p8 : [IN] �ϐ��܂��́A���l�@�F�@divz
p9 : [IN] �ϐ��܂��́A���l�@�F�@maxheight
p10 : [OUT] �ϐ��@�F�@hsid

%inst
BMP�f�[�^����A�n�ʂ𐶐����܂��B

�ڂ����́A(Link http://www5d.biglobe.ne.jp/~ochikko/e3dhsp_ground.htm )�n�ʃf�[�^�̍������������������B



������
1. [IN] ������܂��́A������ϐ��@�F�@filename1
�@�@�n�ʂ̍��W���̌��ƂȂ�A�a�l�o�t�@�C����

2. [IN] ������܂��́A������ϐ��@�F�@filename2
�@�@�n�ʂ̓��̏��̌��ƂȂ�A�a�l�o�t�@�C����

3. [IN] ������܂��́A������ϐ��@�F�@filename3
�@�@�n�ʂ̐�̏��̌��ƂȂ�A�a�l�o�t�@�C����

4. [IN] ������܂��́A������ϐ��@�F�@filename4
�@�@�n�ʁA���A��̖͗l�����߂�A�a�l�o�t�@�C����

5. [IN] �ϐ��܂��́A���l�@�F�@maxx
�@�@�n�ʂ̂w���W�̍ő�l
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@maxz
�@�@�n�ʂ̂y���W�̍ő�l
�@�@�����B

7. [IN] �ϐ��܂��́A���l�@�F�@divx
�@�@X�����̕�����

8. [IN] �ϐ��܂��́A���l�@�F�@divz
�@�@Z�����̕�����

9. [IN] �ϐ��܂��́A���l�@�F�@maxheight
�@�@�n�ʂ̍����̍ő�l
�@�@�����B

10. [OUT] �ϐ��@�F�@hsid
�@�@�쐬�����n�ʃf�[�^�����ʂ���A�h�c



�o�[�W���� : ver1.0.0.1

%index
E3DCameraPosForward
�J�������A�����Ă�������ɁA
step�̋�������
�ړ������܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@step

%inst
�J�������A�����Ă�������ɁA
step�̋�������
�ړ������܂��B

step�Ƀ}�C�i�X��^����ƁA
���ɐi�߂܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@step
�@�@�i�ދ������w�肵�Ă��������B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DSetBeforePos
E3DChkConfGround�Ŏg�p������W��ۑ����܂��B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@charahsid

%inst
E3DChkConfGround�Ŏg�p������W��ۑ����܂��B
��O�̍��W��ۑ����邽�߂̖��߂ł��B
�ۑ������l�́A�����ŁA�����蔻�薽�߂Ŏg�p���܂��B

���C�����[�v�̍Ō�̕����ȂǂŁA
�Ă�ł��������B
��ԍŏ���E3DPos�̒���ł��A
�Ă�ł��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@charahsid
�@�@�`��f�[�^�����ʂ���id



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfGround
groundhsid�Ŏ��ʂ����n�ʂƁAcharahsid�Ŏ��ʂ����L�����N�^�[�Ƃ̂����蔻������܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12
p1 : [IN] �ϐ��܂��́A���l�@�F�@charahsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@groundhsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@mode
p4 : [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
p5 : [IN] �ϐ��܂��́A���l�@�F�@mapminy
p6 : [OUT] �ϐ��@�F�@result
p7 : [OUT] �ϐ��@�F�@adjustx
p8 : [OUT] �ϐ��@�F�@adjusty
p9 : [OUT] �ϐ��@�F�@adjustz
p10 : [OUT] �ϐ��@�F�@nx
p11 : [OUT] �ϐ��@�F�@ny
p12 : [OUT] �ϐ��@�F�@nz

%inst
groundhsid�Ŏ��ʂ����n�ʂƁAcharahsid�Ŏ��ʂ����L�����N�^�[�Ƃ̂����蔻������܂��B

groundhsid�́AE3DLoadGroundBMP�A
�܂��́AE3DLoadMQOFileAsGround�Ŏ擾�������̂łȂ���΂����܂���B

�L�����N�^�[�̌��݂̍��W�ƁAhtml{
<strong>E3DSetBeforePos</strong>
}html�ŕۑ����ꂽ�Â����W�Ƃ����Ԑ����ƁA
�n�ʂ̊e�|���S���Ƃ̂����蔻������܂��B

�n�ʂ̏�𔇂��悤�ɓ������߂̃��[�h�ƁA
��s�@�̂悤�ɔ�Ԃ��߂̃��[�h��
�Q��ނ���܂��B

�������[�h�̎��́A����Aadjustx,y,z��
�n�ʂ̍��W���Ԃ���܂��B
��ԃ��[�h�̎��́A�n�ʂƏՓ˂����Ƃ��ɁA
���̍��W��adjustx,y,z�ɕԂ���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@charahsid
�@�@�ړ�����`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@groundhsid
�@�@E3DLoadGroundBMP�A
�@�@�܂��́AE3DLoadMQOFileAsGround��
�@�@�쐬�����`��f�[�^��
�@�@���ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@mode
�@�@�O���w�肷��ƁA��ԃ��[�h
�@�@�P���w�肷��ƁA�n�ʂ𔇂����[�h

4. [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
�@�@��x�̈ړ��œo�邱�Ƃ��o���鍂���̍ő�l��
�@�@�w�肵�Ă��������B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@mapminy
�@�@groundhsid�Ŏ��ʂ����f�[�^�̈�ԒႢ�x���W�̒l
�@�@�ʏ�́A0.0�ł��B
�@�@�����B

6. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@
�@�@mode == 0 �̂Ƃ�
�@�@�@�@�Ԃ���Ȃ������ꍇ�́Aresutl = 0
�@�@�@�@�Ԃ������ꍇ�́Aresult = 1
�@�@mode == 1�̂Ƃ�
�@�@�@�@�L�����N�^�[�̉��ɒn�ʂ����������ꍇ�A
�@�@�@�@�܂��́A�S���ړ����Ȃ������ꍇ�A
�@�@�@�@result = 0

�@�@�@�@diffmaxy��荂��������o�낤�Ƃ����Ƃ��A
�@�@�@�@result = 1

�@�@�@�@�n�ʂ����ɍ~�肽�Ƃ��A
�@�@�@�@�܂��́Adiffmaxy���Ⴂ������o�����Ƃ��A
�@�@�@�@result = 2

�@�@�ƂȂ�܂��B

7. [OUT] �ϐ��@�F�@adjustx
8. [OUT] �ϐ��@�F�@adjusty
9. [OUT] �ϐ��@�F�@adjustz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ��������W
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̍��W��
�@�@�@�@(adjustx, adjusty, adjustz)�ɑ������܂��B
�@�@�����^�̕ϐ��B


10. [OUT] �ϐ��@�F�@nx
11. [OUT] �ϐ��@�F�@ny
12. [OUT] �ϐ��@�F�@nz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ������|���S��
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̃|���S����
�@�@�@�@�@���x�N�g�����A
�@�@�@�@(nx ny, nz)�ɑ������܂��B
�@�@�@�@
�@�@�@�@���˕Ԃ���������߂�Ƃ��Ȃǂ�
�@�@�@�@�g�p�ł���̂ł͂Ȃ����Ǝv���A
�@�@�@�@�����Ă݂܂����B

�@�@�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfGround2
befpos��newpos�����Ԑ����ƁAgroundhsid�Ŏ��ʂ����n�ʂƂ�
�����蔻������܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17
p1 : [IN] �ϐ��܂��́A���l�@�F�@befposx
p2 : [IN] �ϐ��܂��́A���l�@�F�@befposy
p3 : [IN] �ϐ��܂��́A���l�@�F�@befposz
p4 : [IN] �ϐ��܂��́A���l�@�F�@newposx
p5 : [IN] �ϐ��܂��́A���l�@�F�@newposy
p6 : [IN] �ϐ��܂��́A���l�@�F�@newposz
p7 : [IN] �ϐ��܂��́A���l�@�F�@groundhsid
p8 : [IN] �ϐ��܂��́A���l�@�F�@mode
p9 : [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
p10 : [IN] �ϐ��܂��́A���l�@�F�@mapminy
p11 : [OUT] �ϐ��@�F�@result
p12 : [OUT] �ϐ��@�F�@adjustx
p13 : [OUT] �ϐ��@�F�@adjusty
p14 : [OUT] �ϐ��@�F�@adjustz
p15 : [OUT] �ϐ��@�F�@nx
p16 : [OUT] �ϐ��@�F�@ny
p17 : [OUT] �ϐ��@�F�@nz

%inst
befpos��newpos�����Ԑ����ƁAgroundhsid�Ŏ��ʂ����n�ʂƂ�
�����蔻������܂��B

�����̍��W���A���[�U�[���w�肷�邱�ƈȊO�́A
E3DChkConfGround�ƑS���A�����ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@befposx
2. [IN] �ϐ��܂��́A���l�@�F�@befposy
3. [IN] �ϐ��܂��́A���l�@�F�@befposz
�@�@�����̎n�_���ibefposx, befposy, befposz�j��
�@�@�w�肵�܂��B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@newposx
5. [IN] �ϐ��܂��́A���l�@�F�@newposy
6. [IN] �ϐ��܂��́A���l�@�F�@newposz
�@�@�����̏I�_���inewposx, newposy, newposz�j��
�@�@�w�肵�܂��B
�@�@�����B

7. [IN] �ϐ��܂��́A���l�@�F�@groundhsid
�@�@E3DLoadGroundBMP�A
�@�@�܂��́AE3DLoadMQOFileAsGround��
�@�@�쐬�����`��f�[�^��
�@�@���ʂ���id

8. [IN] �ϐ��܂��́A���l�@�F�@mode
�@�@�O���w�肷��ƁA��ԃ��[�h
�@�@�P���w�肷��ƁA�n�ʂ𔇂����[�h

9. [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
�@�@��x�̈ړ��œo�邱�Ƃ��o���鍂���̍ő�l��
�@�@�w�肵�Ă��������B
�@�@�����B

10. [IN] �ϐ��܂��́A���l�@�F�@mapminy
�@�@groundhsid�Ŏ��ʂ����f�[�^�̈�ԒႢ�x���W�̒l
�@�@�ʏ�́A�O�D�O�ł��B
�@�@�����B

11. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@
�@�@mode == 0 �̂Ƃ�
�@�@�@�@�Ԃ���Ȃ������ꍇ�́Aresutl = 0
�@�@�@�@�Ԃ������ꍇ�́Aresult = 1
�@�@mode == 1�̂Ƃ�
�@�@�@�@�L�����N�^�[�̉��ɒn�ʂ����������ꍇ�A
�@�@�@�@�܂��́A�S���ړ����Ȃ������ꍇ�A
�@�@�@�@result = 0

�@�@�@�@diffmaxy��荂��������o�낤�Ƃ����Ƃ��A
�@�@�@�@result = 1

�@�@�@�@�n�ʂ����ɍ~�肽�Ƃ��A
�@�@�@�@�܂��́Adiffmaxy���Ⴂ������o�����Ƃ��A
�@�@�@�@result = 2

12. [OUT] �ϐ��@�F�@adjustx
13. [OUT] �ϐ��@�F�@adjusty
14. [OUT] �ϐ��@�F�@adjustz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ��������W
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̍��W��
�@�@�@�@(adjustx, adjusty, adjustz)�ɑ������܂��B
�@�@�����^�̕ϐ��B


15. [OUT] �ϐ��@�F�@nx
16. [OUT] �ϐ��@�F�@ny
17. [OUT] �ϐ��@�F�@nz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ������|���S��
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̃|���S����
�@�@�@�@�@���x�N�g�����A
�@�@�@�@(nx, ny, nz)�ɑ������܂��B
�@�@�@�@
�@�@�@�@���˕Ԃ���������߂�Ƃ��Ȃǂ�
�@�@�@�@�g�p�ł���̂ł͂Ȃ����Ǝv���A
�@�@�@�@�����Ă݂܂����B

�@�@�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetPartNoByName
���f�����̃p�[�c�̖��O����A�p�[�c�̔ԍ����擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@partname
p3 : [OUT] �ϐ��@�F�@partno

%inst
���f�����̃p�[�c�̖��O����A�p�[�c�̔ԍ����擾���܂��B

�p�[�c�̖��O�́ARokDeBone2�Ŋm�F���Ă��������B

ver1.0.6.1�ȑO��RokDeBone2�ł́A
���^�Z�R�C�A����ǂݍ��񂾃f�[�^�́A
�p�[�c�̖��O�ɂ́A�@&quot;�@���t���Ă���̂ŁA
���ӂ��Ă��������B

�̂̃t�@�C���̏ꍇ�A
�Ⴆ�΁A���O���A&quot;obj1&quot; �ł���ꍇ�A
����partname �ɂ́A
&quot;\&quot;obj1\&quot;&quot;
�Ƃ����悤�ɁA\&quot; ���g�p���Ȃ��ẮA�����܂���B
�i�@���݂�RokDeBone2�ŐV�K�쐬�����t�@�C���ł́A
�p�[�c���Ɂh�͕t���Ă��܂���B�@�j


�܂��A�������O�̃p�[�c���A��������ꍇ�A
��ɁA��ԍŏ��ɁA���������p�[�c�̔ԍ����A�擾����邱�ƂɁA���ӂ��Ă��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ������܂��́A������ϐ��@�F�@partname
�@�@RokDeBone2�ŕ\�������A�p�[�c�̖��O�B

3. [OUT] �ϐ��@�F�@partno
�@�@���O��partname�ł���A�p�[�c�̔ԍ��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetVertNumOfPart
partno�Ŏ��ʂ����p�[�c�ɁA�����̒��_���܂܂�邩���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [OUT] �ϐ��@�F�@vertnum

%inst
partno�Ŏ��ʂ����p�[�c�ɁA�����̒��_���܂܂�邩���擾���܂��B

E3DGetVertPos, E3DSetVertPos
�ɓn���Avertno �́A
0 �` (vertnum - 1) �̊ԂłȂ��ẮA�Ȃ�܂���B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ�

3. [OUT] �ϐ��@�F�@vertnum
�@�@�p�[�c�Ɋ܂܂�钸�_���B



�o�[�W���� : ver1.0.0.1

%index
E3DGetVertPos
partno�Ŏ��ʂ����p�[�c���́A���_�ԍ�vertno�́A���_�̍��W���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@vertno
p4 : [OUT] �ϐ��@�F�@vertx
p5 : [OUT] �ϐ��@�F�@verty
p6 : [OUT] �ϐ��@�F�@vertz
p7 : [IN] �ϐ��܂��́A���l�@�F�@kind

%inst
partno�Ŏ��ʂ����p�[�c���́A���_�ԍ�vertno�́A���_�̍��W���擾���܂��B



ver5.0.0.4���烍�[�J�����W�ƃO���[�o�����W�̂ǂ��炩��
�擾�ł���悤�ɂȂ�܂����B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@vertno
�@�@���_�̔ԍ�

4. [OUT] �ϐ��@�F�@vertx
5. [OUT] �ϐ��@�F�@verty
6. [OUT] �ϐ��@�F�@vertz
�@�@���_�̍��W���ivx, vy, vz�j�ɑ������܂��B
�@�@�����^�̕ϐ��B

7. [IN] �ϐ��܂��́A���l�@�F�@kind
�@�@�O���w�肷��ƃ��[�J�����W
�@�@�P���w�肷��ƃO���[�o�����W��
�@�@�擾�ł��܂��B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.0.4�Ŋg��

%index
E3DSetVertPos
 partno�Ŏ��ʂ����p�[�c���́A���_�ԍ�vertno�́A���_�̍��W�i���[�J�����W�j���Z�b�g���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@vertno
p4 : [IN] �ϐ��܂��́A���l�@�F�@vertx
p5 : [IN] �ϐ��܂��́A���l�@�F�@verty
p6 : [IN] �ϐ��܂��́A���l�@�F�@vertz

%inst
 partno�Ŏ��ʂ����p�[�c���́A���_�ԍ�vertno�́A���_�̍��W�i���[�J�����W�j���Z�b�g���܂��B


���[�U�[���A���W�A�p�����A
�S�āA�����ŊǗ����邱�Ƃ�z�肵���A
�㋉�Ҍ����̋@�\�ł��B


�Ⴆ�΁A�ڕW�n�_�ɒ��_���W���߂Â��Ă��������ꍇ�Ȃǂ́A
E3DSetPos hsid, 0.0, 0.0, 0.0
E3DSetDir hsid, 0.0, 0.0, 0.0
�Ń��[���h�ϊ����s���Ȃ��悤�ɂ�����ԂŁA
E3DSetVertPos���g���A��]�ʒu�ցA
���_���W���Z�b�g����B
�Ȃǂ́A�g�p���@���A�l�����܂��B


AddMotion���s�����A���f���f�[�^�ɂ��A
�g�p���Ȃ��ł��������B
�i�g�p���Ă��A�n���O������͂��܂��񂪁A
�����蔻�肪�A���m�ɍs���܂���B�j


��̓I�Ȏg�p��́A
zip���́Ahtml{
<strong>e3dhsp3_vertpos.hsp</strong>
}html ���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@vertno
�@�@���_�̔ԍ�

4. [IN] �ϐ��܂��́A���l�@�F�@vertx
5. [IN] �ϐ��܂��́A���l�@�F�@verty
6. [IN] �ϐ��܂��́A���l�@�F�@vertz
�@�@�ivertx, verty, vertz �j�̍��W���A
�@�@�w��̒��_�ɃZ�b�g���܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetPosOnGround
 E3DLoadGroundBMP�A�܂��́AE3DLoadMQOFileAsGround�ō쐬�����n�ʏ�́A�K�؂ȍ����ɁA���f���f�[�^��z�u���邽�߂́A�֐��ł��B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@groundid
p3 : [IN] �ϐ��܂��́A���l�@�F�@mapmaxy
p4 : [IN] �ϐ��܂��́A���l�@�F�@mapminy
p5 : [IN] �ϐ��܂��́A���l�@�F�@posx
p6 : [IN] �ϐ��܂��́A���l�@�F�@posz

%inst
 E3DLoadGroundBMP�A�܂��́AE3DLoadMQOFileAsGround�ō쐬�����n�ʏ�́A�K�؂ȍ����ɁA���f���f�[�^��z�u���邽�߂́A�֐��ł��B

(posx, mapmaxy, posz)�ƁA
(posx, mapminy, posz)�����Ԑ����ƁA
�n�ʃf�[�^�Ƃ̌�_�����߂āA
���̈ʒu�ɁAhsid�̃��f���f�[�^��z�u���܂��B

��_����������ꍇ�́A
(posx, mapmaxy, posz)����A��ԋ߂���_���A�I�΂�܂��B

���̖��߂��g���O�ɁA���Ȃ��Ƃ��A���́A
E3DChkInView groundid
���A�Ă΂�Ă��Ȃ��ƁA�����Ɠ��삵�܂���B
 �igroundid�����ɂ́A�z�u����n�ʂ�hsid�����Ă��������B�j

���o�[�W�����ł�groundid�́A
E3DLoadGroundBMP�A�܂��́AE3DLoadMQOFileAsGround
�Ŏ擾�������̂����A�g�p�ł��܂���B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�z�u�������`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@groundid
�@�@E3DLoadGroundBMP�A
�@�@�܂��́AE3DLoadMQOFileAsGround��
�@�@�쐬�����n�ʂ����ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@mapmaxy
�@�@�n�ʃf�[�^�̍����̍ő�l
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@mapminy
�@�@�n�ʃf�[�^�̍����̍ŏ��l
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@posx
6. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�n�ʂ̍������x�Ƃ���ƁA
�@�@�iposx, Y,. posz�j�ɁAhsid�̃��f���f�[�^��z�u���܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DSetPosOnGroundPart
�n�ʃp�[�c���w�肵�āA�n�ʂɃI�u�W�F�N�g��z�u���܂��B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@groundid
p3 : [IN] �ϐ��܂��́A���l�@�F�@groundpart
p4 : [IN] �ϐ��܂��́A���l�@�F�@mapmaxy
p5 : [IN] �ϐ��܂��́A���l�@�F�@mapminy
p6 : [IN] �ϐ��܂��́A���l�@�F�@posx
p7 : [IN] �ϐ��܂��́A���l�@�F�@posz

%inst
�n�ʃp�[�c���w�肵�āA�n�ʂɃI�u�W�F�N�g��z�u���܂��B

�p�[�c���w�肷�邱�ƈȊO�́A
E3DSetPosOnGround�Ɠ����ł��B

�ڂ����́AE3DSetPosOnGround�̐��������ǂ݂��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�z�u�������`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@groundid
�@�@E3DLoadGroundBMP�A
�@�@�܂��́AE3DLoadMQOFileAsGround��
�@�@�쐬�����n�ʂ����ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@groundpart
�@�@�n�ʂ̃p�[�c�ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@mapmaxy
�@�@�n�ʃf�[�^�̍����̍ő�l
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@mapminy
�@�@�n�ʃf�[�^�̍����̍ŏ��l
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@posx
7. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�n�ʂ̍������x�Ƃ���ƁA
�@�@�iposx, Y,. posz�j�ɁAhsid�̃��f���f�[�^��z�u���܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCreateBillboard
�r���{�[�h���쐬���܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@width
p3 : [IN] �ϐ��܂��́A���l�@�F�@height
p4 : [IN] �ϐ��܂��́A���l�@�F�@transparentflag
p5 : [OUT] �ϐ��@�F�@billboardid
p6 : [IN] �ϐ��܂��́A���l�@�F�@dirmode
p7 : [IN] �ϐ��܂��́A���l�@�F�@orgflag

%inst
�r���{�[�h���쐬���܂��B

1500�܂ŁA�r���{�[�h����邱�Ƃ��o���܂��B


billboardid�ɁA�쐬�����r���{�[�h�����ʂ���
�ԍ����A�������܂��B

billboardid�́A
E3DSetBillboardPos,
E3DSetBillboardOnGround,
E3DDestroyBillboard,
E3DChkConfBillboard
�̊֐��ŁA�g�p���܂��B

billboardid�́Ahsid�Ƃ́A�S���قȂ���̂Ȃ̂ŁAE3DSetPos�Ȃǂ́Ahsid���g�p����֐��ɂ́A�g���܂���B

E3DCreateBillboard�ł́A
transparentflag�ɁA�P���Z�b�g����΁A
���F�𓧉ߐF�Ƃ��āA�����܂��B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�r���{�[�h�ɓ\��t����e�N�X�`���[�̃t�@�C����

2. [IN] �ϐ��܂��́A���l�@�F�@width
�@�@�r���{�[�h�̕��B
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@height
�@�@�r���{�[�h�̍����B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@transparentflag
�@�@�P���w�肷��ƁA
�@�@�e�N�X�`���[�̍��F�ir = 0, g=0, b=0�j�𓧉ߐF�Ƃ��āA
�@�@�����܂��B
�@�@
�@�@�O���w�肷��ƁA
�@�@�e�N�X�`���[�t�@�C���́A
�@�@�A���t�@�l�����ɁA���߂��܂��B

5. [OUT] �ϐ��@�F�@billboardid
�@�@�쐬�����r���{�[�h�����ʂ���ԍ����A�������܂��B

6. [IN] �ϐ��܂��́A���l�@�F�@dirmode
�@�@dirmode�ɂO���w�肷��ƁA
�@�@�r���{�[�h�́A�x���Ɋւ��Ă̂݁A��]���܂��B
�@�@�n�ʂɗ����Ă���؂ȂǂɎg�p���Ă��������B

�@�@dirmode�̂P���w�肷��ƁA
�@�@�r���{�[�h�́A�S�����ɉ�]���܂��B
�@�@�J�����̍����ɂ�����炸�A�J�����̕�������������������
�@�@�Ⴆ�΁A�΂≌�ȂǂɁA�g�p���Ă��������B

7. [IN] �ϐ��܂��́A���l�@�F�@orgflag
�@�@�r���{�[�h�̌��_�̈ʒu���w�肵�܂��B

�@�@orgflag�ɂO���w�肷��ƁA
�@�@���_�́A�r���{�[�h�̎l�p�`�̉��̕ӂ̒��S�ɂȂ�܂��B
�@�@�n�ʂɐ��₷�؂Ȃǂ̏ꍇ�ɁA�֗��ł��B

�@�@orgflag�ɂP���w�肷��ƁA
�@�@���_�́A�r���{�[�h�̒��S�ɂȂ�܂��B
�@�@�����Ȃǂ́A������ʂɎg���ꍇ�ɁA�֗��ł��B



�o�[�W���� : ver1.0.0.1

%index
E3DRenderBillboard
E3DCreateBillboard
�ō쐬���ꂽ�r���{�[�h�S�Ă��A
�`�悵�܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@transskip

%inst
E3DCreateBillboard
�ō쐬���ꂽ�r���{�[�h�S�Ă��A
�`�悵�܂��B

�e�r���{�[�h�́A
�����̕����������悤�ɃZ�b�g����܂��B

�܂��A
���_����A���������珇�ԂɁA�`�悳��܂��B

transskip�����̈Ӗ��ɂ��Ă�
E3DTransformBillboard�̐��������ǂ݂��������B







������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@transskip
�@�@�`�揀���̌v�Z���X�L�b�v���܂��B
�@�@E3DTransformBillboard���g�����ꍇ�Ɏg�p���܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetBillboardPos
 billboardid�Ŏ��ʂ����r���{�[�h�́A�ʒu���w�肵�܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@billboardid
p2 : [IN] �ϐ��܂��́A���l�@�F�@posx
p3 : [IN] �ϐ��܂��́A���l�@�F�@posy
p4 : [IN] �ϐ��܂��́A���l�@�F�@posz

%inst
 billboardid�Ŏ��ʂ����r���{�[�h�́A�ʒu���w�肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@billboardid
�@�@�r���{�[�h�����ʂ���ԍ�

2. [IN] �ϐ��܂��́A���l�@�F�@posx
3. [IN] �ϐ��܂��́A���l�@�F�@posy
4. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�r���{�[�h�̈ʒu���A(posx, posy, posz)
�@�@�ɃZ�b�g���܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DSetBillboardOnGround
 billboardid�Ŏ��ʂ����r���{�[�h�́A�ʒu���A�w�肵���w�y���W�́A�n�ʂ̍����ɃZ�b�g���܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@billboardid
p2 : [IN] �ϐ��܂��́A���l�@�F�@groundid
p3 : [IN] �ϐ��܂��́A���l�@�F�@mapmaxy
p4 : [IN] �ϐ��܂��́A���l�@�F�@mapminy
p5 : [IN] �ϐ��܂��́A���l�@�F�@posx
p6 : [IN] �ϐ��܂��́A���l�@�F�@posz

%inst
 billboardid�Ŏ��ʂ����r���{�[�h�́A�ʒu���A�w�肵���w�y���W�́A�n�ʂ̍����ɃZ�b�g���܂��B

���̖��߂��g���O�ɁA���Ȃ��Ƃ��A���́A
E3DChkInView�@groundid
���Ă΂�Ă���K�v������܂��B
�igroundid�����ɂ́A�z�u����n�ʂ�hsid�����Ă��������B�j

���o�[�W�����ł�groundid�́A
E3DLoadGroundBMP�A�܂��́AE3DLoadMQOFileAsGround
�Ŏ擾�������̂����A�g�p�ł��܂���B




������
1. [IN] �ϐ��܂��́A���l�@�F�@billboardid
�@�@�r���{�[�h�����ʂ���ԍ�

2. [IN] �ϐ��܂��́A���l�@�F�@groundid
�@�@groundid�Ŏ��ʂ����n�ʂ̏�ɁA
�@�@�r���{�[�h���z�u����܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@mapmaxy
�@�@�n�ʃf�[�^�̈�ԑ傫�Ȃx���W
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@mapminy
�@�@�n�ʃf�[�^�̈�ԏ����Ȃx���W
�@�@�i�ʏ�O�D�O�j
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@posx
6. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@(posx, mapmaxy, posz)�ƁA(posx, mapminy, posz)
�@�@�ƒn�ʃf�[�^�Ƃ̌�_�����߂āA
�@�@�n�ʏ�̓K�؂ȍ����ɁA�r���{�[�h��z�u���܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyBillboard
billboardid�Ŏ��ʂ����r���{�[�h���A�폜���܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@billboardid

%inst
billboardid�Ŏ��ʂ����r���{�[�h���A�폜���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@billboardid
�@�@�r���{�[�h�����ʂ���ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DLoadMQOFileAsGround
mqo �t�@�C����n�ʃf�[�^�Ƃ��āA�ǂݍ��݂܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@mult
p3 : [OUT] �ϐ��@�F�@hsid
p4 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p5 : [IN] ������܂��́A������ϐ��@�F�@bonetype

%inst
mqo �t�@�C����n�ʃf�[�^�Ƃ��āA�ǂݍ��݂܂��B
�n�ʃf�[�^�����ʂ���id���A�߂�l�ƂȂ�܂��B
�擾����id �́AE3DChkConfGround�Ȃǂ̊֐��ŁA�g�p�ł��܂��B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ǂݍ��ށAmqo �t�@�C�����B

2. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|���鐔�l�B
�@�@���W�l�@���@mult �Ōv�Z����܂��B
�@�@���{�͂P�D�O
�@�@�����B

3. [OUT] �ϐ��@�F�@hsid
�@�@�쐬�����n�ʂ����ʂ���hsid���������܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV���W�𐳋K���������Ƃ��͂P���A
�@�@�����łȂ��Ƃ��́A�O���w�肵�Ă��������B
�@�@�����w�肵�Ȃ��Ƃ��́A�O�Ƃ��Ĉ����܂��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


5. [IN] ������܂��́A������ϐ��@�F�@bonetype
�@�@mqo�Ƀ{�[�����܂܂�Ă���ꍇ��
�@�@�{�[���̃^�C�v���w�肵�܂��B
�@�@BONETYPE_RDB2���w�肷���RokDeBone2�`����
�@�@�������{�[���ƔF������^�C�v�ɂȂ�܂��B
�@�@BONETYPE_MIKO���w�肷���
�@�@mikoto�`���̃^�C�v�ɂȂ�܂��B
�@�@�ȗ������BONETYPE_RDB2�ɂȂ�܂��B
�@�@�����̒萔��e3dhsp3.as�Œ�`����Ă��܂��B





�o�[�W���� : ver1.0.0.1<BR>
      ver4.0.1.8�ň����ǉ�<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>
      

%index
E3DSaveMQOFile
hsid�Ŏw�肵�����f���̃f�[�^���Amqo�̌`���ŏo�͂��܂��B
%group
Easy3D For HSP3 : ���f���f�[�^

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@filename

%inst
hsid�Ŏw�肵�����f���̃f�[�^���Amqo�̌`���ŏo�͂��܂��B

�n�ʃf�[�^�̏o�͂ȂǂɁA�g�p���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�o�͂��郂�f����hsid

2. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�o�͂���t�@�C����



�o�[�W���� : ver1.0.0.1

%index
E3DGetBillboardInfo
�w�肵���ԍ��́A�r���{�[�h�����A�擾���܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] �ϐ��܂��́A���l�@�F�@billboardid
p2 : [OUT] �ϐ��@�F�@posx
p3 : [OUT] �ϐ��@�F�@posy
p4 : [OUT] �ϐ��@�F�@posz
p5 : [OUT] �ϐ��@�F�@texname
p6 : [OUT] �ϐ��@�F�@transparent
p7 : [OUT] �ϐ��@�F�@width
p8 : [OUT] �ϐ��@�F�@height

%inst
�w�肵���ԍ��́A�r���{�[�h�����A�擾���܂��B

�r���{�[�h�̔ԍ��ɂ́A
E3DCreateBillboard�Ŏ擾�����ԍ����A
�w�肵�Ă��������B
�@
texname �ɂ́A256�ȏ�̑傫����
�o�b�t�@���w�肵�Ă��������B
�Ⴆ�΁A
�@�@sdim texname, 256, 1
�ȂǂŁA�m�ۂ����ϐ����A
�w�肵�Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@billboardid
�@�@�����擾�������r���{�[�h�̔ԍ��B
�@�@E3DCreateBillboard�Ŏ擾�����ԍ���
�@�@�w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@posx
3. [OUT] �ϐ��@�F�@posy
4. [OUT] �ϐ��@�F�@posz
�@�@�r���{�[�h�̍��W���A
�@�@(posx, posy, posz)�ɑ������܂��B
�@�@�����^�̕ϐ��B

5. [OUT] �ϐ��@�F�@texname
�@�@�r���{�[�h�́A�e�N�X�`���t�@�C�������A
�@�@�������܂��B
�@�@texname �ɂ́A256�ȏ�̑傫���̃o�b�t�@��
�@�@�w�肵�Ă��������B
�@�@�Ⴆ�΁Asdim texname, 256, 1
�@�@�ȂǂŁA�m�ۂ����ϐ����A�w�肵�Ă��������B

6. [OUT] �ϐ��@�F�@transparent
�@�@�r���{�[�h�́A���߃��[�h���A�������܂��B
�@�@transparent == 0 �̂Ƃ��́A
�@�@�r���{�[�h�́A
�@�@�e�N�X�`���t�@�C���̃A���t�@���ɂ���āA
�@�@���߂���܂��B
�@�@transparent == 1 �̂Ƃ��́A
�@�@�r���{�[�h�́A
�@�@�iR, G, B�j == (0, 0, 0)�𓧉ߐF�Ƃ��āA��������܂��B

7. [OUT] �ϐ��@�F�@width
�@�@�r���{�[�h�̕����A�������܂��B
�@�@�����^�̕ϐ��B

8. [OUT] �ϐ��@�F�@height
�@�@�r���{�[�h�̍������A�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetNearBillboard
�w�肵�����W�ɁA��ԋ߂��r���{�[�h��ID���擾���܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@posx
p2 : [IN] �ϐ��܂��́A���l�@�F�@posy
p3 : [IN] �ϐ��܂��́A���l�@�F�@posz
p4 : [IN] �ϐ��܂��́A���l�@�F�@maxdist
p5 : [OUT] �ϐ��@�F�@nearbbid

%inst
�w�肵�����W�ɁA��ԋ߂��r���{�[�h��ID���擾���܂��B

maxdist �Ŏw�肵���A�������A�����r���{�[�h�������݂��Ȃ��ꍇ�́A
ID�ɁA-1 ���������܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@posx
2. [IN] �ϐ��܂��́A���l�@�F�@posy
3. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�ʒu���W���A�iposx, posy, posz�j�Ŏw�肵�܂��B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@maxdist
�@�@maxdist�ŁA�w�肵���������A
�@�@�����r���{�[�h�����Ȃ��ꍇ�́A
�@�@nearbbid��-1���������܂��B
�@�@�����B

5. [OUT] �ϐ��@�F�@nearbbid
�@�@�iposx, posy, posz�j �Ɉ�ԋ߂��A
�@�@maxdist���߂��r���{�[�h�̂h�c�������܂��B
�@�@���݂��Ȃ��ꍇ�́A-1�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetInvisibleFlag
hsid�Ŏ��ʂ���郂�f���́Apartno�̃p�[�c��InvisibleFlag(�����Ȃ��t���O)���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [OUT] �ϐ��@�F�@flag

%inst
hsid�Ŏ��ʂ���郂�f���́Apartno�̃p�[�c��InvisibleFlag(�����Ȃ��t���O)���擾���܂��B

InvisibleFlag���A�P�ɂȂ��Ă���p�[�c�́A�����蔻��́A�s���܂����A
�\���͂���܂���B
�i���֎~���Ƃ́A���ڂɒu���A�����Ȃ��I�u�W�F�N�g�Ƃ��āA�g�p���邱�ƂȂǂ��A
�l�����܂��B

partno �ɂ́AE3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

�܂��Ahsid�ɕ��̒l��n���Apartno�ɁA�r���{�[�h��id ��n���ƁA
�r���{�[�h��InvisibleFlag ���擾���邱�Ƃ��o���܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID
�@�@�r���{�[�h��InvisibleFlag���擾����ꍇ�́A���̒l�@�@��n���Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�̔ԍ��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ��A
�@�@�܂��́A�r���{�[�h�̂h�c�B

3. [OUT] �ϐ��@�F�@flag
�@�@�w�肵���p�[�c��InvisibleFlag ���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetInvisibleFlag
hsid�Ŏ��ʂ���郂�f���́Apartno�̃p�[�c��InvisibleFlag(�����Ȃ��t���O)���Z�b�g���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@flag

%inst
hsid�Ŏ��ʂ���郂�f���́Apartno�̃p�[�c��InvisibleFlag(�����Ȃ��t���O)���Z�b�g���܂��B

partno �ɂ́AE3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

�܂��Ahsid�ɕ��̒l��n���Apartno�ɁA�r���{�[�h��id ��n���ƁA
�r���{�[�h��InvisibleFlag ���Z�b�g���邱�Ƃ��o���܂��B

InvisibleFlag == 0 �̂Ƃ�����ԁi�f�t�H���g�j�ŁA
InvisibleFlag == 1 �̂Ƃ��A�\�����ꂸ�A�����蔻�肾���ƂȂ�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID
�@�@�r���{�[�h��InvisibleFlag���擾����ꍇ�́A
�@�@���̒l��n���Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�̔ԍ��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ��A
�@�@�܂��́A�r���{�[�h�̂h�c�B

3. [IN] �ϐ��܂��́A���l�@�F�@flag
�@�@�w�肵���p�[�c��InvisibleFlag ���Z�b�g���܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetMovableArea
�ړ��\�̈���A�a�l�o�t�@�C������A�����������܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ������܂��́A������ϐ��@�F�@filename1
p2 : [IN] �ϐ��܂��́A���l�@�F�@maxx
p3 : [IN] �ϐ��܂��́A���l�@�F�@maxz
p4 : [IN] �ϐ��܂��́A���l�@�F�@divx
p5 : [IN] �ϐ��܂��́A���l�@�F�@divz
p6 : [IN] �ϐ��܂��́A���l�@�F�@wallheight
p7 : [OUT] �ϐ��@�F�@hsid

%inst
�ړ��\�̈���A�a�l�o�t�@�C������A�����������܂��B
�i�F�̕t���������ƁA�t���Ă��Ȃ�������
���E�����ɁA�n�ʂɐ����ȁA��\���̕ǃ|���S���𐶐����܂��B�j

E3DChkConfWall ���߂ƕ��p����΁A
�a�l�o�ŁA�Z���F��t���������̂݁A�ړ��ł���悤�ɂȂ�܂��B

��̓I�Ȏg�p��́Azip���́A
html{
<strong>e3dhsp3_wall.hsp</strong>
}html ���������������B


���^�Z�R�C�A�f�[�^�ŁA
�ǃf�[�^����肽���ꍇ�́A
���^�Z�R�C�A�̃v���O�C���AMakeWall�����g�p���������B
�i����������k�`�a�̃g�b�v�y�[�W�Ƀ����N������܂��B�j




������
1. [IN] ������܂��́A������ϐ��@�F�@filename1
�@�@�ǂ̍��W���̌��ƂȂ�A�a�l�o�t�@�C����

2. [IN] �ϐ��܂��́A���l�@�F�@maxx
�@�@�ǂ̂w���W�̍ő�l
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@maxz
�@�@�ǂ̂y���W�̍ő�l
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@divx
�@�@X�����̕�����

5. [IN] �ϐ��܂��́A���l�@�F�@divz
�@�@Z�����̕�����

6. [IN] �ϐ��܂��́A���l�@�F�@wallheight
�@�@�쐬����ǂ̍���
�@�@�����B

7. [OUT] �ϐ��@�F�@hsid
�@�@�쐬�����ǃf�[�^�����ʂ���A�h�c



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfWall
E3DSetMovableArea, �܂��́AE3DLoadMQOFileAsMovableArea�ō쐬�����ǃf�[�^�ƁA�L�����N�^�[�̂����蔻����s���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10
p1 : [IN] �ϐ��܂��́A���l�@�F�@charahsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@groundhsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@dist
p4 : [OUT] �ϐ��@�F�@result
p5 : [OUT] �ϐ��@�F�@adjustx
p6 : [OUT] �ϐ��@�F�@adjusty
p7 : [OUT] �ϐ��@�F�@adjustz
p8 : [OUT] �ϐ��@�F�@nx
p9 : [OUT] �ϐ��@�F�@ny
p10 : [OUT] �ϐ��@�F�@nz

%inst
E3DSetMovableArea, �܂��́AE3DLoadMQOFileAsMovableArea�ō쐬�����ǃf�[�^�ƁA�L�����N�^�[�̂����蔻����s���܂��B

�L�����N�^�[�̌��݂̍��W�ƁAhtml{
<strong>E3DSetBeforePos</strong>
}html�ŕۑ����ꂽ�Â����W�Ƃ����Ԑ����ƁA
�ǂ̊e�|���S���Ƃ̂����蔻������܂��B

�ǂɉ����Ĉʒu���ړ����邽�߂�
�g�p���܂��B

�ǂ̊O����������ւ͈ړ��ł��܂����A��������O���ւ͈ړ��ł��Ȃ��悤�ɂ��܂��B

��̓I�Ȏg�p��́Azip���́A
html{
<strong>e3dhsp3_wall.hsp</strong>
}html ���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@charahsid
�@�@�ړ�����`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@groundhsid
�@�@E3DSetMovableArea�A
�@�@�܂��́AE3DLoadMQOFileAsMovableArea��
�@�@�쐬�����`��f�[�^��
�@�@���ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@dist
�@�@���˕Ԃ鋗���B
�@�@dist�ɑ傫�Ȓl������ƁA
�@�@�Ԃ������ۂɑ傫���A���˕Ԃ�悤�ɂȂ�܂��B
�@�@�����B

4. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@�ǂƂԂ������ꍇ�́A�P���A
�@�@�Ԃ���Ȃ������ꍇ�́A�O���A�������܂��B

5. [OUT] �ϐ��@�F�@adjustx
6. [OUT] �ϐ��@�F�@adjusty
7. [OUT] �ϐ��@�F�@adjustz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�C����̍��W���A
�@�@(adjustx, adjusty, adjustz)�ɑ������܂��B
�@�@�����^�̕ϐ��B

8. [OUT] �ϐ��@�F�@nx
9. [OUT] �ϐ��@�F�@ny
10. [OUT] �ϐ��@�F�@nz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�Ԃ������ʂ̖@���x�N�g���̒l��
�@�@�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfWall2
E3DSetMovableArea, �܂��́AE3DLoadMQOFileAsMovableArea�ō쐬�����ǃf�[�^�ƁA�L�����N�^�[�̂����蔻����s���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15
p1 : [IN] �ϐ��܂��́A���l�@�F�@befposx
p2 : [IN] �ϐ��܂��́A���l�@�F�@befposy
p3 : [IN] �ϐ��܂��́A���l�@�F�@befposz
p4 : [IN] �ϐ��܂��́A���l�@�F�@newposx
p5 : [IN] �ϐ��܂��́A���l�@�F�@newposy
p6 : [IN] �ϐ��܂��́A���l�@�F�@newposz
p7 : [IN] �ϐ��܂��́A���l�@�F�@groundhsid
p8 : [IN] �ϐ��܂��́A���l�@�F�@dist
p9 : [OUT] �ϐ��@�F�@result
p10 : [OUT] �ϐ��@�F�@adjustx
p11 : [OUT] �ϐ��@�F�@adjusty
p12 : [OUT] �ϐ��@�F�@adjustz
p13 : [OUT] �ϐ��@�F�@nx
p14 : [OUT] �ϐ��@�F�@ny
p15 : [OUT] �ϐ��@�F�@nz

%inst
E3DSetMovableArea, �܂��́AE3DLoadMQOFileAsMovableArea�ō쐬�����ǃf�[�^�ƁA�L�����N�^�[�̂����蔻����s���܂��B

befpos�Ŏw�肵�����W�ƁA
newpos�Ŏw�肵�����W�����Ԑ����ƁA
�ǂ̊e�|���S���Ƃ̂����蔻������܂��B

�ǂɉ����Ĉʒu���ړ����邽�߂�
�g�p���܂��B

�ǂ̊O����������ւ͈ړ��ł��܂����A��������O���ւ͈ړ��ł��Ȃ��悤�ɂ��܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@befposx
2. [IN] �ϐ��܂��́A���l�@�F�@befposy
3. [IN] �ϐ��܂��́A���l�@�F�@befposz
�@�@�����̎n�_���ibefposx, befposy, befposz�j��
�@�@�w�肵�܂��B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@newposx
5. [IN] �ϐ��܂��́A���l�@�F�@newposy
6. [IN] �ϐ��܂��́A���l�@�F�@newposz
�@�@�����̏I�_���inewposx, newposy, newposz�j��
�@�@�w�肵�܂��B
�@�@�����B

7. [IN] �ϐ��܂��́A���l�@�F�@groundhsid
�@�@E3DSetMovableArea�A
�@�@�܂��́AE3DLoadMQOFileAsMovableArea��
�@�@�쐬�����`��f�[�^��
�@�@���ʂ���id

8. [IN] �ϐ��܂��́A���l�@�F�@dist
�@�@�ǂ���̋����̍ŏ��l�B
�@�@dist�ɑ傫�Ȓl������ƁA
�@�@�Ԃ������ۂɑ傫���A���˕Ԃ�悤�ɂȂ�܂��B
�@�@�����B

9. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@�ǂƂԂ������ꍇ�́A�P���A
�@�@�Ԃ���Ȃ������ꍇ�́A�O���A�������܂��B

10. [OUT] �ϐ��@�F�@adjustx
11. [OUT] �ϐ��@�F�@adjusty
12. [OUT] �ϐ��@�F�@adjustz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�C����̍��W���A
�@�@(adjustx, adjusty, adjustz)�ɑ������܂��B
�@�@�����^�̕ϐ��B


13. [OUT] �ϐ��@�F�@nx
14. [OUT] �ϐ��@�F�@ny
15. [OUT] �ϐ��@�F�@nz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�Ԃ������ʂ̖@���x�N�g���̒l���A
�@�@�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DVec3Normalize
�w�肵���x�N�g�����A���K�����l���擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@vecx
p2 : [IN] �ϐ��܂��́A���l�@�F�@vecy
p3 : [IN] �ϐ��܂��́A���l�@�F�@vecz
p4 : [OUT] �ϐ��@�F�@newvecx
p5 : [OUT] �ϐ��@�F�@newvecy 
p6 : [OUT] �ϐ��@�F�@newvecz

%inst
�w�肵���x�N�g�����A���K�����l���擾���܂��B

�܂�A�w�肵���x�N�g���̌��������A
�傫���P�̃x�N�g�����A�擾�ł��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@vecx
2. [IN] �ϐ��܂��́A���l�@�F�@vecy
3. [IN] �ϐ��܂��́A���l�@�F�@vecz
�@�@�x�N�g�����A(vecx, vecy, vecz)�Ŏw�肵�܂��B
�@�@�����B

4. [OUT] �ϐ��@�F�@newvecx
5. [OUT] �ϐ��@�F�@newvecy 
6. [OUT] �ϐ��@�F�@newvecz
�@�@������(vecx, vecy, vecz)�ŁA
�@�@�傫����1�ȁA�x�N�g�����A
�@�@(newvecx, newvecy, newvecz)�ɑ�����܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DVec2CCW
vec2 ��vec1 �ɑ΂��āA�����v���̎��A
result�ɁA�P�������A
���v���̎��A
result�ɁA-1��������B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@vecx1
p2 : [IN] �ϐ��܂��́A���l�@�F�@vecy1
p3 : [IN] �ϐ��܂��́A���l�@�F�@vecx2
p4 : [IN] �ϐ��܂��́A���l�@�F�@vecy2
p5 : [OUT] �ϐ��@�F�@result

%inst
vec2 ��vec1 �ɑ΂��āA�����v���̎��A
result�ɁA�P�������A
���v���̎��A
result�ɁA-1��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@vecx1
2. [IN] �ϐ��܂��́A���l�@�F�@vecy1
�@�@vec1( vecx1, vecy1 )���w�肷��B
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@vecx2
4. [IN] �ϐ��܂��́A���l�@�F�@vecy2
�@�@vec2( vecx2, vecy2 )���w�肷��B
�@�@�����B

5. [OUT] �ϐ��@�F�@result
�@�@vec2 ��vec1 �ɑ΂��āA�����v���̎��A
�@�@result�ɁA�P�������A
�@�@���v���̎��A
�@�@result�ɁA-1��������B



�o�[�W���� : ver1.0.0.1

%index
E3DVec3RotateY
�x�N�g��befvec���A�x���Ɋւ��āAdegy �x������]�����x�N�g��newvec ���擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@befvecx
p2 : [IN] �ϐ��܂��́A���l�@�F�@befvecy
p3 : [IN] �ϐ��܂��́A���l�@�F�@befvecz
p4 : [IN] �ϐ��܂��́A���l�@�F�@degy
p5 : [OUT] �ϐ��@�F�@newvecx
p6 : [OUT] �ϐ��@�F�@newvecy 
p7 : [OUT] �ϐ��@�F�@newvecz

%inst
�x�N�g��befvec���A�x���Ɋւ��āAdegy �x������]�����x�N�g��newvec ���擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@befvecx
2. [IN] �ϐ��܂��́A���l�@�F�@befvecy
3. [IN] �ϐ��܂��́A���l�@�F�@befvecz
�@�@��]�������x�N�g�����A
�@�@(befvecx, befvecy, befvecz)�Ŏw�肵�܂��B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@degy
�@�@��]�p�x���w�肵�܂��B
�@�@degy �̊p�x������]���܂��B
�@�@�����B�@�@

5. [OUT] �ϐ��@�F�@newvecx
6. [OUT] �ϐ��@�F�@newvecy 
7. [OUT] �ϐ��@�F�@newvecz
�@�@��]��̃x�N�g�����A
�@�@�inewvecx, newvecy, newvecz�j�ɑ������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DLoadMQOFileAsMovableArea
���^�Z�R�C�A�́A�l�p�n�t�@�C���ō쐬�����ǂ̃f�[�^���A�ړ��\�̈���Ƃ��āA�ǂݍ��݂܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@mult
p3 : [OUT] �ϐ��@�F�@hsid

%inst
���^�Z�R�C�A�́A�l�p�n�t�@�C���ō쐬�����ǂ̃f�[�^���A�ړ��\�̈���Ƃ��āA�ǂݍ��݂܂��B

���^�Z�R�C�A�ŁA�f�[�^�����ꍇ�ɂ́A���̂Q�_�ɋC��t���Ă��������B

�P�D�ǃf�[�^�́A��ɁA�ړ��\�̈�̓����������悤�ɁA�ʂ̌�����ݒ肵�Ă��������B���ʃ|���S���́A�s�ł��B

�Q�D�ǃf�[�^�́A�����̌��Ԃ��Ȃ��悤�ɁA
�쐬���Ă��������B


�����I�ɕǃf�[�^����肽���ꍇ�́A
���^�Z�R�C�A�̃v���O�C���AMakeWall�����g�p���������B
�i����������k�`�a�̃g�b�v�y�[�W�Ƀ����N������܂��B�j





������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ǂݍ��ށAmqo �t�@�C�����B

2. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|����W���̐��l�B
�@�@���W�l�@���@mult �Ōv�Z����܂��B
�@�@���{�͂P�D�O
�@�@�����B

3. [OUT] �ϐ��@�F�@hsid
�@�@�쐬�����ǃf�[�^�����ʂ���hsid���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DLoadSound
���̃f�[�^��ǂݍ��݁A�������ʂ���ԍ��Asoundid�A���擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2,p3,p4,p5
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [OUT] �ϐ��@�F�@soundid
p3 : [IN] �ϐ��܂��́A���l�@�F�@use3dflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@reverbflag
p5 : [IN] �ϐ��܂��́A���l�@�F�@bufnum

%inst
���̃f�[�^��ǂݍ��݁A�������ʂ���ԍ��Asoundid�A���擾���܂��B

ogg��wav��ǂݍ��߂܂��B
ogg�̓X�e���I�̂݁B

�RD�T�E���h�ɂ��Ή����Ă��܂��B
�RD�T�E���h�̓��m�����݂̂ł��B

MIDI�͓ǂݍ��߂܂���B

ver5.3.0.3��oggdatanum�����ǉ��B
ver5.3.1.6��oggdatanum�������폜�i�����ݒ�ɕύX�j




������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ǂݍ��ށA�T�E���h �t�@�C�����B

2. [OUT] �ϐ��@�F�@soundid
�@�@�쐬�������f�[�^�����ʂ���ԍ����������܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@use3dflag
�@�@�R�c�T�E���h�Ƃ��ēǂݍ��ޏꍇ�͂P���w�肵�Ă��������B
�@�@�f�t�H���g�l�͂O�ł��B

4. [IN] �ϐ��܂��́A���l�@�F�@reverbflag
�@�@���o�[�u��L���ɂ������Ƃ��͂P��
�@�@�������Ȃ��Ƃ��͂O���w�肵�܂��B

5. [IN] �ϐ��܂��́A���l�@�F�@bufnum
�@�@�����h�c�̃T�E���h�𓯎��ɂ����d�˂čĐ��ł��邩���w�肵�܂��B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      ver5.3.0.3�Ŋg��<BR>
      ver5.3.1.6�ŏC��<BR>
      <BR>
      

%index
E3DPlaySound
E3DLoadSound�œǂݍ��񂾉��f�[�^���Đ����܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [IN] �ϐ��܂��́A���l�@�F�@startsample
p3 : [IN] �ϐ��܂��́A���l�@�F�@openo
p4 : [IN] �ϐ��܂��́A���l�@�F�@numloops

%inst
E3DLoadSound�œǂݍ��񂾉��f�[�^���Đ����܂��B






������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�Đ��������������ʂ���ԍ����A�w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@startsample
�@�@�Đ��J�n�ʒu���T���v���i���g���j�P�ʂŎw�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@openo
�@�@�����̃o�b�`�����p�̈����ł��B
�@�@���݂͂O���w�肵�Ă����Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@numloops
�@�@�J��Ԃ��񐔂��w�肵�܂��B
�@�@�������[�v�͂Q�T�T���w�肵�܂��B
�@�@�Q�T�T�ȉ��ł����܂�傫���l���w�肷��ƃn���O���邱�Ƃ�����܂��i�Q�T�T�̓n���O���܂���j�B
�@

�@�@


�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      

%index
E3DStopSound
���̍Đ����~���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid

%inst
���̍Đ����~���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@��~�������������ʂ���ԍ����A�w�肵�܂��B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      

%index
E3DSetSoundVolume
���̉��ʂ�ݒ肵�܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@volume
p2 : [IN] �ϐ��܂��́A���l�@�F�@soundid

%inst
���̉��ʂ�ݒ肵�܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@volume
�@�@�����B
�@�@�\�[�X���ʂƂ̔䗦���w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�ݒ肵�����������ʂ���ԍ����w�肵�܂��B
�@�@-1���w�肷��ƁA�S�Ẳ��̉��ʂ�ݒ�ł��܂��B
�@�@�����ݒ肵�Ȃ������ꍇ�́A-1�ƌ��Ȃ���܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      

%index
E3DDestroySound
�ǂݍ��񂾉��f�[�^��j�����܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid

%inst
�ǂݍ��񂾉��f�[�^��j�����܂��B
�j���������́A���̌�A���삷�邱�Ƃ͏o���܂���B
�����A�Đ����I��������ꍇ�́AE3DStopSound�֐����g�p���Ă�����



������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�j���������������ʂ���ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DSetSoundFrequency
���̎��g����ݒ肵�܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [IN] �ϐ��܂��́A���l�@�F�@freq

%inst
���̎��g����ݒ肵�܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�ݒ肵�����������ʂ���ԍ�
�@�@-1���w�肷��Ɠǂݍ��ݍς݂̑S�ẴT�E���h�ɑ΂��ď������܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@freq
�@�@�����B
�@�@�\�[�X���g���Ƃ̔䗦���w�肵�܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      ver5.3.4.1�Ŋg��<BR>
      <BR>
      

%index
E3DGetSoundVolume
���݂̉��ʂ��擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@vol

%inst
���݂̉��ʂ��擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ԍ�

2. [OUT] �ϐ��@�F�@vol
�@�@�����^�̕ϐ��B
�@�@���ʁi�\�[�X���ʂƂ̔䗦�j���������܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      

%index
E3DGetSoundFrequency
���݂̎��g�����擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@freq

%inst
���݂̎��g�����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ԍ�

2. [OUT] �ϐ��@�F�@freq
�@�@�����^�̕ϐ��B
�@�@�\�[�X���g���Ƃ̔䗦���������܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      

%index
E3DSet3DSoundListenerMovement
���X�i�[�̈ʒu�ƌ�����ݒ肵�܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
���X�i�[�̈ʒu�ƌ�����ݒ肵�܂��B

hsid�Ƀ��f���f�[�^�̔ԍ���n�����ꍇ�ɂ́A
���̃��f���f�[�^�̈ʒu�ƌ������A
���X�i�[�̈ʒu�ƌ����Ƃ��Đݒ肳��܂��B

hsid��-1��n�����ꍇ�ɂ́A
���_�̈ʒu�ƌ������A
���X�i�[�̈ʒu�ƌ����Ƃ��Đݒ肳��܂��B

���Ăяo���΁A�����ƁAhsid�̍X�V����
���X�i�[�ɔ��f������킯�ł�html{
<strong>����܂���</strong>
}html�B

���̍X�V���K�v�ɂȂ邽�тɁA
�Ăяo���Ă��������B






������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ԍ�
�@�@-1�̂Ƃ��́A���_�����X�i�[�Ƃ��܂��B


�o�[�W���� : ver1.0.0.1

%index
E3DSet3DSoundMovement

�RD�T�E���h�̈ʒu�Ƒ��x��ݒ肵�܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [IN] �ϐ��܂��́A���l�@�F�@posx
p3 : [IN] �ϐ��܂��́A���l�@�F�@posy
p4 : [IN] �ϐ��܂��́A���l�@�F�@posz
p5 : [IN] �ϐ��܂��́A���l�@�F�@vx
p6 : [IN] �ϐ��܂��́A���l�@�F�@vy
p7 : [IN] �ϐ��܂��́A���l�@�F�@vz

%inst

�RD�T�E���h�̈ʒu�Ƒ��x��ݒ肵�܂��B

html{
<strong>E3DLoadSound��use3dflag�ɂP���w�肵��
�ǂݍ��񂾃T�E���h�݂̂ɑ΂��A�L���ł��B
</strong>
}html

�R�c�T�E���h�̎g�p��́A
html{
<strong>e3dhsp3_3Dsound.hsp</strong>
}html
���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�R�c�T�E���h�����ʂ���ԍ�

2. [IN] �ϐ��܂��́A���l�@�F�@posx
3. [IN] �ϐ��܂��́A���l�@�F�@posy
4. [IN] �ϐ��܂��́A���l�@�F�@posz
�@�@�R�c�T�E���h�̈ʒu���iposx, posy, posz�j�Ŏw�肵�܂��B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@vx
6. [IN] �ϐ��܂��́A���l�@�F�@vy
7. [IN] �ϐ��܂��́A���l�@�F�@vz
�@�@�R�c�T�E���h�̑��x��(vx, vy, vz)�Ŏw�肵�܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCreateNaviLine
�i�r���C�����쐬���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1
p1 : [OUT] �ϐ��@�F�@nlid

%inst
�i�r���C�����쐬���܂��B

�i�r���C���Ƃ́A�����̃i�r�|�C���g����Ȃ�A�o���������N���X�g�̂��Ƃł��B

�i�r�|�C���g�Ƃ́A�L�����N�^�[�̎������s���ɁA�ʒu�����߂��ƂȂ�|�C���g�̂��Ƃł��B

���̊֐�����������ƁA
�i�r���C�������ʂ��邽�߂̂h�c�Anlid�������܂��B

���s����ƁAnlid�ɕ��̒l���������܂��B




������
1. [OUT] �ϐ��@�F�@nlid
�@�@�쐬�����i�r���C�������ʂ��邽�߂̂h�c��
�@�@�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyNaviLine
�i�r���C�����폜���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid

%inst
�i�r���C�����폜���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@�폜���郉�C�������ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DAddNaviPoint
�i�r���C���ɁA�i�r�|�C���g��ǉ����܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@befnpid
p3 : [OUT] �ϐ��@�F�@npid

%inst
�i�r���C���ɁA�i�r�|�C���g��ǉ����܂��B

��������ƁA�V�����i�r�|�C���g�����ʂ��邽�߂̂h�c�Anpid �������܂��B

befnpid�Ŏw�肵���|�C���g�̎��̈ʒu��
�ǉ��ł��鑼�A
�擪�ʒu��A�Ō�̈ʒu�ɂ��ǉ����邱�Ƃ��ł��܂��B


�i�r�|�C���g�̕ҏW�ɂ́A
GViewer.exe���g���ƕ֗��ł��B
�i����������k�`�a�łc�k�\�ł��B�j




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@befnpid
�@�@befnpid�Ŏw�肵���|�C���g�̎��̈ʒu�ɁA
�@�@�V�����|�C���g��ǉ����܂��B

�@�@befnpid��-1���w�肷��ƁA
�@�@�i�r���C���̍Ō�ɒǉ�����A
�@�@befnpid��-2���w�肷��ƁA
�@�@�i�r���C���̐擪�ɒǉ�����܂��B

3. [OUT] �ϐ��@�F�@npid
�@�@�V�����ǉ������i�r�|�C���g�̂h�c���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DRemoveNaviPoint
�i�r���C������A�i�r�|�C���g���폜���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@npid

%inst
�i�r���C������A�i�r�|�C���g���폜���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@npid
�@�@�폜�������i�r�|�C���g��ID



�o�[�W���� : ver1.0.0.1

%index
E3DGetNaviPointPos
�i�r�|�C���g�̍��W���擾���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@npid
p3 : [OUT] �ϐ��@�F�@posx
p4 : [OUT] �ϐ��@�F�@posy
p5 : [OUT] �ϐ��@�F�@posz

%inst
�i�r�|�C���g�̍��W���擾���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@npid
�@�@�i�r�|�C���g�����ʂ���ID

3. [OUT] �ϐ��@�F�@posx
4. [OUT] �ϐ��@�F�@posy
5. [OUT] �ϐ��@�F�@posz
�@�@�i�r�|�C���g�̍��W���A
�@�@�iposx, posy, posz�j�ɁA�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetNaviPointPos
�i�r�|�C���g�̍��W���Z�b�g���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@npid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p4 : [IN] ���l�܂��́A�ϐ��@�F�@poxy
p5 : [IN] ���l�܂��́A�ϐ��@�F�@posz

%inst
�i�r�|�C���g�̍��W���Z�b�g���܂��B
���̍��W�����ƂɁA
�L�����N�^�[���ړ����邱�ƂɂȂ�܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@npid
�@�@�i�r�|�C���g�����ʂ���ID

3. [IN] ���l�܂��́A�ϐ��@�F�@posx
4. [IN] ���l�܂��́A�ϐ��@�F�@poxy
5. [IN] ���l�܂��́A�ϐ��@�F�@posz
�@�@�i�r�|�C���g�̍��W��
�@�@�iposx, posy, posz�j�ɐݒ肵�܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetNaviPointOwnerID
�i�r�|�C���g��OwnerID���擾���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@npid
p3 : [OUT] �ϐ��@�F�@OwnerID

%inst
�i�r�|�C���g��OwnerID���擾���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@npid
�@�@�i�r�|�C���g�����ʂ���ID

3. [OUT] �ϐ��@�F�@OwnerID
�@�@�i�r�|�C���g��OwnerID���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetNaviPointOwnerID
�i�r�|�C���g��OwnerID���Z�b�g���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@npid
p3 : [IN] �ϐ��@�F�@OwnerID

%inst
�i�r�|�C���g��OwnerID���Z�b�g���܂��B

�i�r�|�C���g�ɁA
�r���I�ȁA���L����ݒ肵�����Ƃ��ȂǂɁA
���R�ɁA�g�p���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@npid
�@�@�i�r�|�C���g�����ʂ���ID

3. [IN] �ϐ��@�F�@OwnerID
�@�@�i�r�|�C���g��OwnerID�ɐݒ肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetNextNaviPoint
npid�Ŏw�肵���i�r�|�C���g�́A���̃i�r�|�C���g�̂h�c���擾���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@npid
p3 : [OUT] �ϐ��@�F�@nextid

%inst
npid�Ŏw�肵���i�r�|�C���g�́A���̃i�r�|�C���g�̂h�c���擾���܂��B

�i�r���C���́A�i�r�|�C���g���A�o�������X�g�ŁA�i�[���Ă��܂��B


���̃i�r�|�C���g�����݂��Ȃ��ꍇ�́Anextid �ɂ́A���̒l���������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@npid
�@�@�i�r�|�C���g�����ʂ���ID

3. [OUT] �ϐ��@�F�@nextid
�@�@���̃i�r�|�C���g�̂h�c���������܂��B

�@�@npid ��-1���w�肳��Ă���ꍇ�́A
�@�@nextid�ɂ́A�擪�̃i�r�|�C���g��ID���������܂�
�@�@


�o�[�W���� : ver1.0.0.1

%index
E3DGetPrevNaviPoint
npid�Ŏw�肵���i�r�|�C���g�́A��O�̃i�r�|�C���g�̂h�c���擾���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@npid
p3 : [OUT] �ϐ��@�F�@previd

%inst
npid�Ŏw�肵���i�r�|�C���g�́A��O�̃i�r�|�C���g�̂h�c���擾���܂��B


�i�r���C���́A�i�r�|�C���g���A�o�������X�g�ŁA�i�[���Ă��܂��B


��O�̃i�r�|�C���g�����݂��Ȃ��ꍇ�́Aprevid �ɂ́A���̒l���������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@npid
�@�@�i�r�|�C���g�����ʂ���ID

3. [OUT] �ϐ��@�F�@previd
�@�@���̃i�r�|�C���g�̂h�c���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetNearestNaviPoint
�w�肵�����W�ɁA��ԋ߂��i�r�|�C���g�̂h�c���擾���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posy 
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posz
p5 : [OUT] �ϐ��@�F�@nearid
p6 : [OUT] �ϐ��@�F�@previd
p7 : [OUT] �ϐ��@�F�@nextid

%inst
�w�肵�����W�ɁA��ԋ߂��i�r�|�C���g�̂h�c���擾���܂��B

��ԋ߂��i�r�|�C���g�̑O��̃|�C���g��
�h�c���擾�ł��܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@posx
3. [IN] ���l�܂��́A�ϐ��@�F�@posy 
4. [IN] ���l�܂��́A�ϐ��@�F�@posz
�@�@�iposx, posy, posz�j�Ɉ�ԋ߂��i�r�|�C���g��
�@�@�T���܂��B
�@�@�����B

5. [OUT] �ϐ��@�F�@nearid
�@�@��ԋ߂��i�r�|�C���g�̂h�c���������܂��B

6. [OUT] �ϐ��@�F�@previd
�@�@��ԋ߂��i�r�|�C���g�̑O�̃|�C���g�̂h�c��
�@�@�������܂��B

7. [OUT] �ϐ��@�F�@nextid
�@�@��ԋ߂��i�r�|�C���g�̎��̃|�C���g�̂h�c��
�@�@�������܂��B


�o�[�W���� : ver1.0.0.1

%index
E3DFillUpNaviLine
�i�r�|�C���g�ƃi�r�|�C���g�̊Ԃ��A�w�肵���������ŁA��Ԃ��܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@div
p3 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�i�r�|�C���g�ƃi�r�|�C���g�̊Ԃ��A�w�肵���������ŁA��Ԃ��܂��B

Catmull-Rom�̌����ŁA��Ԃ��܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@div
�@�@���������ĕ�Ԃ��邩���w�肵�܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@flag�ɂP���w�肷��ƁA
�@�@�`�F�C���̏��ԂɃi�r�|�C���g�̂h�c���ӂ蒼���܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetNaviLineOnGround
�i�r���C�����̑S�Ẵi�r�|�C���g�̍��W���A�n�ʂ̍����ɐݒ肵�܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@grounhdis
p3 : [IN] ���l�܂��́A�ϐ��@�F�@mapmaxy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@mapminy

%inst
�i�r���C�����̑S�Ẵi�r�|�C���g�̍��W���A�n�ʂ̍����ɐݒ肵�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@grounhdis
�@�@�n�ʂ����ʂ���hsid

3. [IN] ���l�܂��́A�ϐ��@�F�@mapmaxy
�@�@�n�ʃf�[�^�̂x���W�̍ő�l���w�肵�܂��B
�@�@�����B

4. [IN] ���l�܂��́A�ϐ��@�F�@mapminy
�@�@�n�ʃf�[�^�̂x���W�̍ŏ��l���w�肵�܂��B
�@�@���ۂ̍ŏ��l���A���������Ȓl�����Ă��������B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DControlByNaviLine
�i�r���C���̃f�[�^�����ɁA�L�����N�^�[�̈ʒu�ƁA�������A�����I�ɐݒ肷�邽�߂̊֐��ł��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@ctrlmode
p4 : [IN] ���l�܂��́A�ϐ��@�F�@roundflag
p5 : [IN] ���l�܂��́A�ϐ��@�F�@reverseflag
p6 : [IN] ���l�܂��́A�ϐ��@�F�@maxdist
p7 : [IN] ���l�܂��́A�ϐ��@�F�@posstep
p8 : [IN] ���l�܂��́A�ϐ��@�F�@dirstep
p9 : [OUT] �ϐ��@�F�@newposx
p10 : [OUT] �ϐ��@�F�@newposy
p11 : [OUT] �ϐ��@�F�@newposz
p12 : [OUT] �ϐ��@�F�@newqx
p13 : [OUT] �ϐ��@�F�@newqy
p14 : [OUT] �ϐ��@�F�@newqz
p15 : [OUT] �ϐ��@�F�@newqw
p16 : [IN] [OUT] �ϐ��@�F�@targetpointid

%inst
�i�r���C���̃f�[�^�����ɁA�L�����N�^�[�̈ʒu�ƁA�������A�����I�ɐݒ肷�邽�߂̊֐��ł��B

�����́A���[�h�Ȃǂ̃p�����[�^���A
�F�X�ω������邱�ƂŁA
��̃i�r���C������A�����́i�����؂�Ȃ����炢�́j���s�p�^�[���𓾂邱�Ƃ��A
�\�ł��B



��̓I�Ȏg�p��́Azip���́A
html{
<strong>e3dhsp3_autorun.hsp</strong>
}html
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@���C�������ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@ctrlmode
�@�@�r�b�g�̘a�ŁA���[�h���w�肵�܂��B

�@�@�r�b�g�P�������Ă����ꍇ�ɂ́A
�@�@�@�ʒu��D�悵�����䂪�s���܂��B
�@�@�@����maxdist, dirstep �͖�������܂��B
�@�@�@�o���邾���A�i�r�|�C���g�̋߂���ʂ�悤��
�@�@�@�Ȃ�܂��B

�@�@�r�b�g�P�������Ă��Ȃ��ꍇ�ɂ́A
�@�@�@������D�悵�����䂪�s���܂��B
�@�@�@dirstep�Ŏw�肵���p�x���傫�Ȋp�x�ł́A
�@�@�@�ړ��ł��Ȃ��Ȃ�܂��B
�@�@�@�������A���̂܂܂��ƁA�L�����N�^�[���A
�@�@�@�i�r���C������A�����ɗ��ꂷ���Ă��܂��̂ŁA
�@�@�@����maxdist�ŁA�i�r���C������ǂ̂��炢����Ă�
�@�@�@�ǂ������w�肵�܂��B
�@�@�@maxdist�����A�����ɗ��ꂽ�ꍇ�ɂ́A
�@�@�@dirstep�Ŏw�肵�������A�傫�Ȋp�x�ŁA
�@�@�@�i�r���C���ɋ߂Â��悤�ɏC������܂��B
�@�@�@
�@�@�@�Ȃ̂ŁAdirstep�ɏ����Ȓl���w�肷��ƁA
�@�@�@�W�O�U�O�Ƀi�r���C�������ǂ�悤�ɂȂ�܂��B

�@�@�r�b�g�S�������Ă����ꍇ�ɂ́A
�@�@�@�����̐ݒ�́A�w�y���ʂ݂̂ōs���܂��B

�@�@�Ⴆ�΁Actrlmode �ɂT���w�肵���ꍇ�́A
�@�@�ʒu��D�悵������ŁA�w�y���ʂł̌����ݒ������
�@�@�Ƃ������ƂɂȂ�܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@roundflag
�@�@�i�r���C���̍Ō�̃i�r�|�C���g�Ɉړ�������A
�@�@�i�r���C���̍ŏ��̃i�r�|�C���g�̈ʒu��
�@�@�ڎw�����ǂ����������܂��B

�@�@�P���w�肷��ƁA�~�`�̃i�r���C���̏ꍇ�́A
�@�@�����ƁA���邮���邱�ƂɂȂ�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@reverseflag
�@�@�P���w�肷��ƁA
�@�@�i�r���C���̃|�C���g���t���ɂ��ǂ�悤�ɂȂ�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@maxdist
�@�@�i�r���C������A�ǂ̂��炢�܂ŗ���Ă��ǂ�����
�@�@�w�肵�܂��B
�@�@ctrlmode�̃r�b�g�P�������Ă��Ȃ��ꍇ�̂ݗL���ł��B
�@�@�����B

7. [IN] ���l�܂��́A�ϐ��@�F�@posstep
�@�@�L�����N�^�[����x�ɂǂꂭ�炢�̋������ړ������邩��
�@�@�w�肵�܂��B
�@�@�������A�i�r�|�C���g�t�߂ł́A
�@�@posstep��菬���ȋ��������ړ������Ȃ����Ƃ�����܂��B
�@�@�����B

8. [IN] ���l�܂��́A�ϐ��@�F�@dirstep
�@�@��x�̈ړ��ŁA�ő剽�x�܂ŉ�]�ł��邩��
�@�@�w�肵�܂��B
�@�@��]�p�x�̒l��n���Ă��������B
�@�@�����B

9. [OUT] �ϐ��@�F�@newposx
10. [OUT] �ϐ��@�F�@newposy
11. [OUT] �ϐ��@�F�@newposz
�@�@�ړ���̍��W���inewposx, newposy, newposz�j��
�@�@�������܂��B
�@�@�����B

12. [OUT] �ϐ��@�F�@newqx
13. [OUT] �ϐ��@�F�@newqy
14. [OUT] �ϐ��@�F�@newqz
15. [OUT] �ϐ��@�F�@newqw
�@�@�ړ���̎p����\���N�H�[�^�j�I���̒l���A
�inewqx, newqy, newqz, newqw �j
�@�@�ɑ������܂��B
�@�@�����B

16. [IN] [OUT] �ϐ��@�F�@targetpointid
�@�@���ݖڎw���Ă���i�r�|�C���g�̂h�c�����܂��B
�@�@�ړ���́A���ɖڎw���ׂ��i�r�|�C���g�̂h�c��
�@�@�������܂��B

�@�@�ł��̂ŁA��ԍŏ��̌Ăяo�����̂݁A
�@�@������targetpoinid���w�肷��΁A
�@�@���Ƃ́A�����ϐ���n�������ŁA
�@�@�����I�ɁA�ڎw���ׂ��|�C���g�̂h�c��
�@�@�������Ă������ƂɂȂ�܂��B

�@�@targetpointid�ɁA
�@�@���݂��Ȃ��i�r�|�C���g�̂h�c����ꂽ�ꍇ�́A
�@�@�i�Ⴆ��-1�Ȃǁj
�@�@�����I�ɁA�ڎw���ׂ��i�r�|�C���g�����肵�܂��B
�@�@�ł����A���̏ꍇ�A
�@�@�������d���������[�h�̂Ƃ��ɁA
�@�@�������������Ȃ��Ȃ邱�Ƃ�����̂ŁA
�@�@�Ȃ�ׂ��A-1�Ȃǂ́A�g��Ȃ������ǂ��ł��B
�@�@




�o�[�W���� : 

%index
E3DSetDirQ
�p�����N�H�[�^�j�I���Ŏw�肵�āA�ݒ肵�܂��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@qx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@qy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@qz
p5 : [IN] ���l�܂��́A�ϐ��@�F�@qw

%inst
�p�����N�H�[�^�j�I���Ŏw�肵�āA�ݒ肵�܂��B

E3DControlByNaviLine��AE3DGetDirQ
�œ����p���f�[�^��
�ݒ肷��Ƃ��ɁA�g�p���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@qx
3. [IN] ���l�܂��́A�ϐ��@�F�@qy
4. [IN] ���l�܂��́A�ϐ��@�F�@qz
5. [IN] ���l�܂��́A�ϐ��@�F�@qw
�@�@�p����\���N�H�[�^�j�I���̒l��
�@�@�w�肵�Ă��������B
�@�@�����B
�@�@


�o�[�W���� : ver1.0.0.1

%index
E3DGetDirQ
�p�����N�H�[�^�j�I���̌`���ŁA�擾���܂��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [OUT] �ϐ��@�F�@qx
p3 : [OUT] �ϐ��@�F�@qy
p4 : [OUT] �ϐ��@�F�@qz
p5 : [OUT] �ϐ��@�F�@qw

%inst
�p�����N�H�[�^�j�I���̌`���ŁA�擾���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [OUT] �ϐ��@�F�@qx
3. [OUT] �ϐ��@�F�@qy
4. [OUT] �ϐ��@�F�@qz
5. [OUT] �ϐ��@�F�@qw
�@�@�p����\���N�H�[�^�j�I���̒l��
�@�@�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetWallOnGround
�ǃf�[�^��n�ʂ̍����ɔz�u���܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@whsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@ghsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@mapmaxy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@mapminy
p5 : [IN] ���l�܂��́A�ϐ��@�F�@wheight

%inst
�ǃf�[�^��n�ʂ̍����ɔz�u���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@whsid
�@�@�ǂ̌`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@ghsid
�@�@�n�ʂ̌`��f�[�^�����ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@mapmaxy
�@ �n�ʃf�[�^�̍ő�̍���
�@�@�����B

4. [IN] ���l�܂��́A�ϐ��@�F�@mapminy
�@�@�n�ʃf�[�^�̍Œ�̍���
�@�@�����B

5. [IN] ���l�܂��́A�ϐ��@�F�@wheight
�@�@�ǂ̍����B
�@�@�����B





�o�[�W���� : ver1.0.0.1

%index
E3DCreateNaviPointClearFlag
�L�����N�^�[���Anlid�Ŏ��ʂ����i�r���C����̓_���A�ǂꂾ���i�񂾂��Ƃ������Ƃ��A�i�[���邽�߂̃f�[�^���쐬���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@roundnum

%inst
�L�����N�^�[���Anlid�Ŏ��ʂ����i�r���C����̓_���A�ǂꂾ���i�񂾂��Ƃ������Ƃ��A�i�[���邽�߂̃f�[�^���쐬���܂��B

hsid�Ŏ��ʂ���郂�f���̃f�[�^�Ƃ���
�쐬���܂��B


���̃f�[�^�́A���[�X�̏��ʂ����肷��Ƃ��ȂǂɁA���ɗ����܂��B


���̖��߂́A
E3DInitNaviPointClearFlag,
E3DSetNaviPointClearFlag
E3DGetOrder
�̖��߂��Ăяo���O�ɁA�Ăяo����Ă��Ȃ��Ƃ����܂���B

������A�����ČĂяo���Ă͂����܂���B
��蒼�������ꍇ�́A�K���A
E3DDestroyNaviPointClearFlag
���Ăяo���Ă���A
E3DCreateNaviPointClearFlag
���Ăяo���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@�i�r���C�������ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@roundnum
�@�@�i�r���C������ő�A��������̂����w�肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyNaviPointClearFlag
E3DCreateNaviPointClearFlag�ō쐬�����f�[�^��j�����܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid

%inst
E3DCreateNaviPointClearFlag�ō쐬�����f�[�^��j�����܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DInitNaviPointClearFlag
E3DCreateNaviPointClearFlag�ō쐬�����f�[�^�����������܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid

%inst
E3DCreateNaviPointClearFlag�ō쐬�����f�[�^�����������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DSetNaviPointClearFlag
E3DCreateNaviPointClearFlag�ō쐬�����f�[�^�ɁA���݂ǂꂾ���̃i�r�|�C���g��ʉ߂��������A�Z�b�g���܂��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posz
p5 : [IN] ���l�܂��́A�ϐ��@�F�@maxdist
p6 : [OUT] �ϐ��@�F�@npidptr
p7 : [OUT] �ϐ��@�F�@roundptr
p8 : [OUT] �ϐ��@�F�@distptr

%inst
E3DCreateNaviPointClearFlag�ō쐬�����f�[�^�ɁA���݂ǂꂾ���̃i�r�|�C���g��ʉ߂��������A�Z�b�g���܂��B

�L�����N�^�[�ƃi�r�|�C���g�Ƃ̋��������ɁA
�f�[�^���Z�b�g���܂��B

���̊֐����g���ꍇ�́A
���t���[���A���̊֐����Ăяo���K�v������܂��B

���̊֐��ŃZ�b�g�����f�[�^�����ɁA
E3DGetOrder�����ʂ����肵�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@posx
3. [IN] ���l�܂��́A�ϐ��@�F�@posy
4. [IN] ���l�܂��́A�ϐ��@�F�@posz
�@�@�L�����N�^�[�̈ʒu��(posx, posy, posz)�Ŏw�肵�܂��B
�@�@�����B

5. [IN] ���l�܂��́A�ϐ��@�F�@maxdist
�@�@�i�r�|�C���g�Ƃ̋�����maxdist���߂������ꍇ�A
�@�@���̃|�C���g���N���A�[�i�ʉ߁j�����ƌ��Ȃ��܂��B
�@�@�����B

6. [OUT] �ϐ��@�F�@npidptr
�@�@���݃N���A�[���Ă���|�C���g�̓��A
�@�@��ԑO���̃|�C���g�̂h�c���������܂��B

7. [OUT] �ϐ��@�F�@roundptr
�@�@�L�����N�^�[�����T�ڂ����A�������܂��B

8. [OUT] �ϐ��@�F�@distptr
�@�@npidptr�ɑ�����ꂽ�A�h�c�̃|�C���g����A
�@�@�ǂꂾ������������Ă��邩���A�������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DGetOrder
E3DSetNaviPointClearFlag�ŃZ�b�g���ꂽ�f�[�^�����ɁA���ʏ����擾���邽�߂̊֐��ł��B
%group
Easy3D For HSP3 : �i�r���C��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��@�F�@hsidptr
p2 : [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
p3 : [OUT] �ϐ��@�F�@orderptr
p4 : [OUT] �ϐ��@�F�@clearnoptr

%inst
E3DSetNaviPointClearFlag�ŃZ�b�g���ꂽ�f�[�^�����ɁA���ʏ����擾���邽�߂̊֐��ł��B




������
1. [IN] �ϐ��@�F�@hsidptr
�@�@���ʂ𒲂ׂ����`��f�[�^�����ʂ���h�c�̔z���
�@�@�w�肵�܂��B
�@�@arrayleng�̒����̔z��łȂ��Ă͂Ȃ�܂���B

�@�@�Ⴆ�΁A
�@�@dim hsidptr, arrayleng
�@�@�Ƃ������߂ŁA�쐬�����f�[�^��n���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
�@�@�z��̒������w�肵�܂��B
�@�@hsidptr, orderptr, clearnoptr�́A
�@�@�S�āAarrayleng�̒����̔z��łȂ��Ă͂Ȃ�܂���B

3. [OUT] �ϐ��@�F�@orderptr
�@�@���ʏ��ɁAhsid���������܂��B
�@�@orderptr(0) �ɂ́A1�ʂ�hsid�̔ԍ����A
�@�@orderptr(1) �ɂ́A2�ʂ�hsid�̔ԍ����������܂��B


4. [OUT] �ϐ��@�F�@clearnoptr
�@�@���ʏ��ɁA�N���A�[�����|�C���g�̐����������܂��B
�@�@clearnoptr(0) �ɂ́A
�@�@1�ʂ̃��f�����N���A�[�����|�C���g�����A
�@�@clearnoptr(1) �ɂ́A
�@�@�Q�ʂ̃��f�����N���A�[�����|�C���g����
�@�@�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyAllBillboard
�S�Ẵr���{�[�h��j�����܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
�Ȃ�

%inst
�S�Ẵr���{�[�h��j�����܂��B


������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DSetValidFlag
RokDeBone2�́@�h���̃I�u�W�F�N�g�𖳌��ɂ���h�@�\���A�v���O�����ōs����悤�ɂ��܂����B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
RokDeBone2�́@�h���̃I�u�W�F�N�g�𖳌��ɂ���h�@�\���A�v���O�����ōs����悤�ɂ��܂����B

�����ɂ����p�[�c�́A�`��₠���蔻��̍ۂɁA���������悤�ɂȂ�܂��B

�W���C���g�ɑ΂��āAE3DSetValidFlag�������ꍇ�́A
E3DJointRemake���Ăяo���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̃t���O��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�̗L���A�������Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@flag�ɂO���w�肷��ƁA�w��p�[�c�������ɂȂ�܂��B
�@�@flag�ɂP���w�肷��ƁA�L���ɂȂ�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetDiffuse
�p�[�c��diffuse�F���Z�b�g����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@R
p4 : [IN] ���l�܂��́A�ϐ��@�F�@G
p5 : [IN] ���l�܂��́A�ϐ��@�F�@B
p6 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p7 : [IN] ���l�܂��́A�ϐ��@�F�@vertno

%inst
�p�[�c��diffuse�F���Z�b�g����֐��ł��B

�w�肵���F���A
���̂܂ܐݒ�A��Z���Đݒ�A���Z���Đݒ�A
���Z���Đݒ�́A4��ޏo���܂��B

���̎��_�ŁA�\������Ă���F�ɑ΂��āA
��Z�A���Z�A���Z���܂��B

diffuse���������Ă��ASpecular, Ambient��ς��Ȃ��ƁA�Ӑ}�����F�ɂ͂Ȃ�Ȃ��Ǝv���܂��̂ŁA���ӂ��Ă��������B
�iE3DSetSpecular, E3DSetAmbient, E3DSetEmissive, E3DSetSpecularPower���������������B�j

���_�P�ʂŐF�̐ݒ肪�o���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɐF���Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@R
4. [IN] ���l�܂��́A�ϐ��@�F�@G
5. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�w�肵�����_�ԍ��̐F���Z�b�g���܂��B
�@�@���̈������ȗ��A�܂��́A-1���Z�b�g�����ꍇ�ɂ́A
�@�@partno�Ŏw�肵���p�[�c�S�̂̐F�̐ݒ�����܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DSetSpecular
�p�[�c��specular�F���Z�b�g����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@R
p4 : [IN] ���l�܂��́A�ϐ��@�F�@G
p5 : [IN] ���l�܂��́A�ϐ��@�F�@B
p6 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p7 : [IN] ���l�܂��́A�ϐ��@�F�@vertno

%inst
�p�[�c��specular�F���Z�b�g����֐��ł��B

�w�肵���F���A
���̂܂ܐݒ�A��Z���Đݒ�A���Z���Đݒ�A
���Z���Đݒ�́A4��ޏo���܂��B

���̎��_�ŁA�\������Ă���F�ɑ΂��āA
��Z�A���Z�A���Z���܂��B


���_�P�ʂŐF�̐ݒ肪�o���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɐF���Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@R
4. [IN] ���l�܂��́A�ϐ��@�F�@G
5. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B


7. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�w�肵�����_�ԍ��̐F���Z�b�g���܂��B
�@�@���̈������ȗ��A�܂��́A-1���Z�b�g�����ꍇ�ɂ́A
�@�@partno�Ŏw�肵���p�[�c�S�̂̐F�̐ݒ�����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetAmbient
�p�[�c��ambient�F���Z�b�g����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@R
p4 : [IN] ���l�܂��́A�ϐ��@�F�@G
p5 : [IN] ���l�܂��́A�ϐ��@�F�@B
p6 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p7 : [IN] ���l�܂��́A�ϐ��@�F�@vertno

%inst
�p�[�c��ambient�F���Z�b�g����֐��ł��B

�w�肵���F���A
���̂܂ܐݒ�A��Z���Đݒ�A���Z���Đݒ�A
���Z���Đݒ�́A4��ޏo���܂��B

���̎��_�ŁA�\������Ă���F�ɑ΂��āA
��Z�A���Z�A���Z���܂��B


���_�P�ʂŐF�̐ݒ肪�o���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɐF���Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@R
4. [IN] ���l�܂��́A�ϐ��@�F�@G
5. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�w�肵�����_�ԍ��̐F���Z�b�g���܂��B
�@�@���̈������ȗ��A�܂��́A-1���Z�b�g�����ꍇ�ɂ́A
�@�@partno�Ŏw�肵���p�[�c�S�̂̐F�̐ݒ�����܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DSetBlendingMode
�r���{�[�h�ƃX�v���C�g�̔��������[�h���w�肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@blendmode

%inst
�r���{�[�h�ƃX�v���C�g�̔��������[�h���w�肵�܂��B

���Z���[�h�ƁA���_�A���t�@�l�ɂ�锼�������[�h�̂Q����I�ׂ܂��B

html{
<strong>ver2.0.0.5�ŁA���Z���[�h���̂Q�������܂����B</strong>
}html

html{
<strong>ver5.0.5.0�ŏ�Z�A���Z�A�X�N���[���A�l�K���]���[�h�������܂����B</strong>
}html

html{
<strong>ver5.1.0.1�ŃI�[�o�[���C���A�����Ă������[�h�������܂����B</strong>
}html

sig���f���f�[�^�̔��������[�h�̐ݒ��
E3DSetMaterialBlendingMode�����g�����������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̃��[�h��ݒ�ł��܂��B

�@�@-2���w�肷��ƁA�X�v���C�g�̐ݒ肪�o���܂��B


2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@hsid��-2���w�肵���ꍇ�́A
�@�@E3DCreateSprite�Ŏ擾�����A
�@�@�X�v���C�g��id��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�Ƀ��[�h���Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@blendmode
�@�@�O���w�肷��ƁA
�@�@���_�A���t�@�l�ɂ�锼�������[�h�ɂȂ�܂��B

�@�@�P���w�肷��ƁA�@
�@�@�A�b�h���[�h�ɂȂ�܂��B

�@�@�Q���w�肷��ƁA
�@�@���_�A���t�@���l�������A�b�h���[�h�ɂȂ�܂��B

�@�@�P�O�R���w�肷��Ə�Z���[�h�B
�@�@�P�O�S���w�肷��ƌ��Z���[�h�B
�@�@�P�O�T���w�肷��ƃX�N���[�����[�h�B
�@�@�P�O�U���w�肷��ƃl�K���]���[�h�ɂȂ�܂��B

�@�@�P�O�V���w�肷��ƃI�[�o�[���C���������[�h�B
�@�@�P�O�W���w�肷��ƕ����Ă������[�h�ɂȂ�܂��B




�o�[�W���� : ver1.0.0.1<BR>
      ver2.0.0.5�Ŋg��<BR>
      ver5.0.5.0�Ŋg��<BR>
      ver5.1.0.1�Ŋg��<BR>
      

%index
E3DSetRenderState
�p�[�c���ƂɁARenderState��ݒ�ł��܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@statetype
p4 : [IN] ���l�܂��́A�ϐ��@�F�@value

%inst
�p�[�c���ƂɁARenderState��ݒ�ł��܂��B

�`��̓x�ɌĂԕK�v�͂���܂���B
��x�Ăׂ΁A�`�掞�ɁA�����I�ɁA�ݒ肳��܂��B


�㋉�Ҍ����̊֐��ł��B
�ڂ����́ADirectX�̃w���v��
SetRenderState���������������B

D3DRS_ALPHABLENDENABLE
�́AE3DRender��withalpha���������ɁA
�����I�ɌĂяo���悤�ɂ��Ă���̂ŁA
���̃^�C�v�͎w�肵�Ă��A���f����܂���B

�܂��A�I���W�i���̒��_�v�Z���s���Ă��邽�߁A�ݒ肵�Ă��A���ʂ̂Ȃ����̂��A��������܂��B

statetype�́Azip���́A
e3dhsp3.as
�ŁAD3DRS�Ŏn�܂�萔�Ƃ��Đ錾���Ă��܂��̂ŁA
���̃t�@�C���̒萔���g�p���Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̃X�e�[�g��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɃX�e�[�g���Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@statetype
�@�@�ݒ肷��^�C�v���w�肵�Ă��������B
�@�@e3dhsp3.as���̒萔���g�p���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@value
�@�@�ݒ肷��l���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DSetScale
�p�[�c�P�ʂŁA�`����g��A�k���ł��܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@scalex
p4 : [IN] ���l�܂��́A�ϐ��@�F�@scaley
p5 : [IN] ���l�܂��́A�ϐ��@�F�@scalez
p6 : [IN] ���l�܂��́A�ϐ��@�F�@centerflag

%inst
�p�[�c�P�ʂŁA�`����g��A�k���ł��܂��B

������ʗp��z�肵�Ă��܂��̂ŁA
�n�ʃf�[�^�ɂ͎g�p�ł��܂���B


�{���́A�`��f�[�^�ǂݍ��ݎ��̑傫���ɑ΂���䗦�ł��B

���̎��_�ŁA�\������Ă���傫���ɑ΂���䗦�ł͂Ȃ��̂ŁA���ӂ��Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̃X�P�[����ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɃX�P�[�����Z�b�g�ł��܂��B


3. [IN] ���l�܂��́A�ϐ��@�F�@scalex
4. [IN] ���l�܂��́A�ϐ��@�F�@scaley
5. [IN] ���l�܂��́A�ϐ��@�F�@scalez

�@�@�w�C�x�C�y�̂��ꂼ��̔{�����w�肵�܂��B
�@�@���ꂼ��A
�@�@scalex�A
�@�@scaleyt�A
�@�@scalez�@�{����܂��B
�@�@���{�͂P�D�O�B
�@�@�����B

6. [IN] ���l�܂��́A�ϐ��@�F�@centerflag
�@�@�g��k������ۂ̒��S���w�肵�܂��B

�@�@�O���w�肷��ƁA
�@�@hsid�Ŏw�肵�����f���S�̂̒��S���g��̒��S�Ƃ��܂��B

�@�@�P���w�肷��ƁA
�@�@���ꂼ��̃p�[�c�̒��S���g��̒��S�Ƃ��܂��B

�@�@2���w�肷��ƁA
�@�@���_���g��̒��S�Ƃ��܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DGetScreenPos
�`��f�[�^�̉�ʏ�ł�2D�̍��W���擾����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p4 : [OUT] �ϐ��@�F�@scx
p5 : [OUT] �ϐ��@�F�@scy
p6 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p7 : [IN] ���l�܂��́A�ϐ��@�F�@calcmode

%inst
�`��f�[�^�̉�ʏ�ł�2D�̍��W���擾����֐��ł��B

�p�[�c�P�ʁA���f���P�ʁA�r���{�[�h�P�ʂ�
�g�p�ł��܂��B

���_�P�ʂł̂Q�c���W���擾�ł��܂��B

�R�c�L�����N�^�[�̈ʒu�ɁA2D�̃X�v���C�g��\������A�Ȃǂ̗p�r�Ɏg���܂��B


html{
<strong>E3DChkInView����ŁA�Ăяo���Ă��������B</strong>
}html


��̓I�Ȏg�p��́Azip���́A
html{
<strong>e3dhsp3_screenpos.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̂Q�c�ʒu���擾�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@���f���S�̂̒��S���W�̂Q�c���W��
�@�@�擾�ł��܂��B

4. [OUT] �ϐ��@�F�@scx
5. [OUT] �ϐ��@�F�@scy
�@�@�w�肵���p�[�c��2D�X�N���[�����W���������܂��B
�@�@�����B�@

�@�@�������A�ȉ��̏ꍇ�ɂ́A
�@�@scx = -1, scy = -1���������܂��B
�@�@
�@�@�P�C�p�[�c���\���p�I�u�W�F�N�g�ł͂Ȃ��ꍇ
�@�@�Q�C�p�[�c�S�̂���ʊO�ɂ���ꍇ
�@�@�R�C�p�[�c�̃f�B�X�v���C�X�C�b�`���I�t�̏ꍇ
�@�@�S�C�p�[�c�������ɂȂ��Ă����ꍇ
�@�@�@�@�iE3DSetValidFlag�łO���w�肵���ꍇ�j

6. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�擾���������_�̔ԍ����w�肵�܂��B
�@�@���̈������ȗ������ꍇ��A-1���w�肵���ꍇ�́A
�@�@�p�[�c�̒��S�̂Q�c���W���擾���܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@calcmode
�@�@�v�Z���[�h���w�肵�܂��B
�@�@
�@�@�P���w�肷��ƁA
�@�@�V�����L�����N�^�[�̈ʒu��A�J�����̈ʒu�ŁA
�@�@�V���Ɍv�Z�������܂��B
�@�@�O���w�肷��ƁA
�@�@calcmode 1 �ŁA���łɌv�Z�������ʂ��擾���܂��B

�@�@�O���w�肵�������A�������y���A�����ł��B


�o�[�W���� : ver1.0.0.1

%index
E3DGetScreenPos2
�C�ӂ̂R�c���W����A�X�N���[���i�Q�c�j���W���擾����֐��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@x3d
p3 : [IN] �ϐ��܂��́A���l�@�F�@y3d
p4 : [IN] �ϐ��܂��́A���l�@�F�@z3d
p5 : [OUT] �ϐ��@�F�@x2d
p6 : [OUT] �ϐ��@�F�@y2d
p7 : [OUT] �ϐ��@�F�@validflag

%inst
�C�ӂ̂R�c���W����A�X�N���[���i�Q�c�j���W���擾����֐��B

���C���̓_�̈ʒu��A�{�[���̈ʒu��
�X�v���C�g��\��������ł��܂��B


���\���I�u�W�F�N�g�̒��_��A
�p�[�c�̒��S�̂Q�c���W���擾����ꍇ�́A
���ɂ���AE3DGetScreenPos�������p���������B






������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@x3d
3. [IN] �ϐ��܂��́A���l�@�F�@y3d
4. [IN] �ϐ��܂��́A���l�@�F�@z3d
�@�@3D���W���A�ix3d, y3d, z3d�j�Ɏw�肵�Ă��������B
�@�@�����B


5. [OUT] �ϐ��@�F�@x2d
6. [OUT] �ϐ��@�F�@y2d
7. [OUT] �ϐ��@�F�@validflag
�@�@�ϊ���̂Q�c���W���A�ix2d, y2d�j�ɑ������܂��B
�@�@�����^�̕ϐ��B

�@�@�Q�c���W���A�X�N���[���̑傫���̓����ɂ��邩�ǂ����́A
�@�@���[�U�[���񂪃`�F�b�N���Ă��������B

�@�@�w�肵���R�c���W���A�J���������ɂ���ꍇ��A
�@�@�����Ȃ����炢�����Ƃ���ɂ���ꍇ�ɂ́A
�@�@validflag �Ɂ@�O�@���������܂��B
�@�@validflag�ɂO���������Ă���Ƃ��́A(x2d, y2d)���W�́A
�@�@�Ӗ��̂Ȃ��l�������Ă��܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DCreateQ
�N�H�[�^�j�I�����쐬���A����p��id ���擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1
p1 : [OUT] �ϐ��@�F�@qid

%inst
�N�H�[�^�j�I�����쐬���A����p��id ���擾���܂��B

�N�H�[�^�j�I���̊e����ɂ́A
���̊֐��Ŏ擾���� qid���g�p���܂��B

�N�H�[�^�j�I����m��Ȃ����́A
�Ƃ肠�����A
�p�����@�i��]���j���i�[�ł���
�֗��Ȃ��́A
�Ƃ��炢�ɁA�l���Ă����Ă��������B


���[�V�����|�C���g��A���f���ȂǂɁA
�N�H�[�^�j�I�����Z�b�g���邱�Ƃɂ��A
�C�ӂ̎p�����������邱�Ƃ��o���܂��B

�쐬���@�́A�H�v���Ă݂܂������A
����قǁA�����ł͂���܂���B
���̊֐��́A���C�����[�v�̊O�ŁA
���炩���ߌĂ�ł������Ƃ��A
�]�܂����ł��B




������
1. [OUT] �ϐ��@�F�@qid
�@�@�V�����N�H�[�^�j�I�����쐬���A
�@�@���̃N�H�[�^�j�I�����A
�@�@��ӂɎ��ʂ���ԍ����@qid�@�ɑ�����܂��B
�@�@
�@�@�N�H�[�^�j�I������֐��ɁA
�@�@���̔ԍ���n���Ďg�p���Ă��������B
�@�@



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyQ
�N�H�[�^�j�I�����폜���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid

%inst
�N�H�[�^�j�I�����폜���܂��B

���̊֐��ɓn����qid�́A�g�p�ł��Ȃ��Ȃ�܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DInitQ
�N�H�[�^�j�I�������������܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid

%inst
�N�H�[�^�j�I�������������܂��B

�p����񂪁A����������܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DSetQAxisAndDeg
�N�H�[�^�j�I�����A�w�肵�����Ɋւ��āA�w�肵���p�x������]�����p�����Z�b�g���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@axisx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@axisy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@axisz
p5 : [IN] ���l�܂��́A�ϐ��@�F�@deg

%inst
�N�H�[�^�j�I�����A�w�肵�����Ɋւ��āA�w�肵���p�x������]�����p�����Z�b�g���܂��B

���ɁAqid�ɃZ�b�g���Ă���p�����́A
�㏑������܂��i��������܂��j�B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@axisx
3. [IN] ���l�܂��́A�ϐ��@�F�@axisy
4. [IN] ���l�܂��́A�ϐ��@�F�@axisz
�@�@��]�̎��̃x�N�g�����A
�@�@(axisx, axisy, axisz)�Ɏw�肵�܂��B�@
�@�@���̃x�N�g���́A�����Ő��K������܂��B
�@�@�����B

5. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@�w�肵�����Ɋւ��āA
�@�@deg�x������]�����p�����Z�b�g���܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetQAxisAndDeg
�N�H�[�^�j�I���ɃZ�b�g����Ă���p��������͂��܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [OUT] �ϐ��@�F�@axisxptr
p3 : [OUT] �ϐ��@�F�@axisyptr
p4 : [OUT] �ϐ��@�F�@axiszptr
p5 : [OUT] �ϐ��@�F�@degptr

%inst
�N�H�[�^�j�I���ɃZ�b�g����Ă���p��������͂��܂��B

��]���ƁA��]�p�x�������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B

2. [OUT] �ϐ��@�F�@axisxptr
3. [OUT] �ϐ��@�F�@axisyptr
4. [OUT] �ϐ��@�F�@axiszptr
�@�@��]�̎��̃x�N�g�����A
�@�@(axisxptr, axisyptr, axiszptr)�ɑ�����܂��B�@
�@�@�����^�̕ϐ��B

5. [OUT] �ϐ��@�F�@degptr
�@�@��]�p�x�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DRotateQX
�N�H�[�^�j�I���̎p�������A�w���Ɋւ��ĉ�]���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@deg

%inst
�N�H�[�^�j�I���̎p�������A�w���Ɋւ��ĉ�]���܂��B

���ɁAqid�ɃZ�b�g���Ă���p�����ɑ΂��āA
����ɁA�w����]���邱�ƂɂȂ�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@X���Ɋւ��āAdeg�x������]���܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DRotateQY
�N�H�[�^�j�I���̎p�������A�x���Ɋւ��ĉ�]���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@deg

%inst
�N�H�[�^�j�I���̎p�������A�x���Ɋւ��ĉ�]���܂��B

���ɁAqid�ɃZ�b�g���Ă���p�����ɑ΂��āA
����ɁA�x����]���邱�ƂɂȂ�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@�x���Ɋւ��āAdeg�x������]���܂��B
�@�@�����B


�o�[�W���� : ver1.0.0.1

%index
E3DRotateQZ
�N�H�[�^�j�I���̎p�������A�y���Ɋւ��ĉ�]���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@deg

%inst
�N�H�[�^�j�I���̎p�������A�y���Ɋւ��ĉ�]���܂��B

���ɁAqid�ɃZ�b�g���Ă���p�����ɑ΂��āA
����ɁA�y����]���邱�ƂɂȂ�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@�y���Ɋւ��āAdeg�x������]���܂��B
�@�@�����B


�o�[�W���� : ver1.0.0.1

%index
E3DMultQ
�N�H�[�^�j�I���̊|���Z�����܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@resqid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@befqid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@aftqid

%inst
�N�H�[�^�j�I���̊|���Z�����܂��B

�Ⴆ�΁A
qid1�ɂw���Ɋւ��ĂR�O�x��]����p�����i�[����Ă��āA
qid2�ɂ́A�x���Ɋւ��ĂQ�O�x��]����p�����i�[����Ă����Ƃ��܂��B

���̂Ƃ��A
E3DMultQ qid3, qid1, qid2
�Ƃ������߂��Ă񂾂Ƃ��܂��B

����ƁA
qid3�ɂ́A
�w���Ɋւ��ĂR�O�x��]������ɁA
����ɂx���Ɋւ��ĂQ�O�x��]�����p�����
�i�[����܂��B

�C��t���Ȃ���΂����Ȃ��̂́A
E3DMultQ qid3, qid1, qid2
��
E3DMultQ qid3, qid2, qid1
�ł́Aqid3�Ɋi�[�����p����񂪈قȂ�
�Ƃ������Ƃł��B

2�Ԗڂ̈����Ɏw�肵����]�̌�ɁA
3�Ԗڂ̈����Ɏw�肵����]��K�p���邩��ł��B

��]�̏��Ԃɂ���āA���ʂ��قȂ�̂́A
�o���Ă����Ă��������B

�ォ�珈�������������A3�Ԗڂ̈�����
�����΁A�n�j�ł��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@resqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�̃N�H�[�^�j�I���Ɍ��ʂ��������܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@befqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@aftqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B

�@�@befqid�̉�]�̌�ɁAaftqid�̉�]���������ʂ��A
�@�@resqid�Ŏ��ʂ����N�H�[�^�j�I���ɑ�����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DNormalizeQ
�N�H�[�^�j�I���𐳋K�����܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid

%inst
�N�H�[�^�j�I���𐳋K�����܂��B

�l�X�ȃN�H�[�^�j�I���̑�����A
�ƂĂ��Ȃ��񐔌J��Ԃ��Ă���ƁA
�v�Z�덷�ȂǂŁA
�N�H�[�^�j�I���̏�񂪂��������Ȃ邱�Ƃ�����܂��B

�Ⴆ�΁AE3DRotateQX�����C�����[�v�ŁA
���X�ƌJ��Ԃ��ꍇ�ȂǂɁA
�Ђ���Ƃ�����A�s����o�邩������܂���B

����ȂƂ��́A
������x�̉񐔂��ƂɁA
���̊֐����Ă�ł��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DCopyQ
srcqid�Ŏ��ʂ����N�H�[�^�j�I���̏����Adstqid�Ŏ��ʂ����N�H�[�^�j�I���ɃR�s�[���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@dstqid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@srcqid

%inst
srcqid�Ŏ��ʂ����N�H�[�^�j�I���̏����Adstqid�Ŏ��ʂ����N�H�[�^�j�I���ɃR�s�[���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@dstqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B&nbsp;

2. [IN] ���l�܂��́A�ϐ��@�F�@srcqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DGetBoneNoByName
�w�肵�����O�����{�[�������ʂ���id���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@bonename
p3 : [OUT] �ϐ��@�F�@boneno

%inst
�w�肵�����O�����{�[�������ʂ���id���擾���܂��B

�Y������{�[����������Ȃ������ꍇ�́A
boneno��-1���������܂��B

�{�[���ȊO�̖��O���w�肵���ꍇ���A
boneno��-1���������܂��B


�����̃p�[�c��{�[���ɁA
�������O���������ꍇ�A
��ԍŏ��Ɍ�����������id��������
�擾�ł��܂���B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ������܂��́A������̕ϐ��@�F�@bonename
�@�@�{�[���̖��O��n���Ă��������B

3. [OUT] �ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DGetNextMP
���[�V�����|�C���g�����ʂ���id���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@prevmpid
p5 : [OUT] �ϐ��@�F�@mpid

%inst
���[�V�����|�C���g�����ʂ���id���擾���܂��B

���[�V�����|�C���g�Ƃ́A
RokDeBone2�̃��[�V�����_�C�A���O���́A
���̕��ɔ��������E�C���h�E������܂����A
���̒��ɕ\������Ă���A
�_�̂��Ƃ��Ǝv���Ă��������B

���[�V�����|�C���g�́A
���[�U�[���񂪂h�j�Őݒ肵���p����
�ێ����Ă��܂��B

���[�V�����|�C���g�́A�{�[�����Ƃɍ���Ă��܂��B

�C��t���ė~�����̂́A
RokDeBone2�ŁA�����E�C���h�E����
�_���\������Ă��Ȃ��t���[���ԍ��ɂ́A
���[�V�����|�C���g�͑��݂��Ȃ��Ƃ������Ƃł��B

���[�V�����|�C���g�������t���[���ԍ��̎p����
�ǂ��Ȃ��Ă��邩�Ƃ����ƁA
�v�Z�ŁA���߂Ă��܂��B


���[�V�����|�C���g�́A�t���[���ԍ��̏��������ɁA�i�[����Ă��܂��B

E3DGetNextMP�́Aprevmpid�Ŏw�肵��
���[�V�����|�C���g�̃t���[���ԍ������āA
���̃t���[���ԍ��̎��ɑ傫���t���[���ԍ��������[�V�����|�C���g��id���擾���܂��B

prevmpid��-1���w�肷��ƁA
��ԏ������t���[���ԍ������A���[�V�����|�C���g��id���擾�ł��܂��B

prevmpid�̃��[�V�����|�C���g�����t���[���ԍ����A�傫���t���[���ԍ��������[�V�����|�C���g�����݂��Ȃ��ꍇ�́A
mpid��-1���������܂��B


�܂�A�擾����mpid��
prevmpid�Ɏw�肵�āA
�Ă�E3DGetNextMP���Ăяo���A
�Ƃ�����Ƃ��A
mpid��-1����������܂ŁA�J��Ԃ��΁A
�t���[���ԍ��̏��������ɁA
�S�Ẵ��[�V�����|�C���g��id���擾�o����
�Ƃ������ƂɂȂ�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@prevmpid
�@�@���[�V�����|�C���g�����ʂ���h�c
�@�@E3DGetNextMP�Ŏ擾����id��n���Ă��������B

�@�@-1���w�肷��ƁA��ԏ����ȃt���[���ԍ�������
�@�@���[�V�����|�C���g��id��mpid�ɑ������܂��B

5. [OUT] �ϐ��@�F�@mpid
�@�@mpid�ɁAprevmpid�̎��ɑ傫���t���[���ԍ�������
�@�@���[�V�����|�C���g��id���������܂��B







�o�[�W���� : ver1.0.0.1

%index
E3DGetMPInfo
mpinfo�Ŏw�肵���z��ɁA
��񂪑������܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@mpid
p5 : [IN][OUT]�@�����l�o�h�Q�l�`�w�̔z��@�F�@mpinfo

%inst
mpinfo�Ŏw�肵���z��ɁA
��񂪑������܂��B

���͂P2(MPI_MAX)��ނł�

mpinfo�ɂ́A
dim mpinfo, MPI_MAX
�ō쐬�����z����w�肵�Ă��������B

MPI_�Ŏn�܂�萔�́A
e3dhsp3.as�ŁA��`����Ă��܂��B


mpinfo(MPI_QUA)�́A�N�H�[�^�j�I�����
mpinfo(MPI_TRAX)�́A�w�����̈ړ��ʂ̏��
mpinfo(MPI_TRAY)�́AY�����̈ړ��ʂ̏��
mpinfo(MPI_TRAZ)�́AZ�����̈ړ��ʂ̏��
mpinfo(MPI_FRAMENO)�́A�t���[���ԍ��̏��
mpinfo(MPI_DISPSWITCH)�́A
�@�@�@�f�B�X�v���C�X�C�b�`�̏��
mpinfo(MPI_INTERP)�́A��Ԍv�Z���@�̏��
mpinfo(MPI_SCALEX)�́A�w�����̊g����
mpinfo(MPI_SCALEY)�́A�x�����̊g����
mpinfo(MPI_SCALEZ)�́A�y�����̊g����
mpinfo(MPI_USERINT1)�́A���[�U�[�f�[�^�̏��
mpinfo(MPI_SCALEDIV)�́A�g�嗦�̌W�����
�Ƃ��āA�g�p����܂��B

mpinfo(MPI_QUA)�ɂ́A
E3DCreateQ�Ŏ擾����qid���A
���̊֐��̌Ăяo���O�ɁA�Z�b�g���Ă����K�v������܂��B
mpinfo(MPI_QUA)�Ɋi�[����Ă���qid��
���ʂ����N�H�[�^�j�I���ɁA
���[�V�����|�C���g�̎p����񂪑������܂��B

mpinfo(MPI_DISPSWITCH)��
�f�B�X�v���C�X�C�b�`���́A�r�b�g���Ƃ̘a�ɂȂ��Ă��܂��B
�f�B�X�v���C�X�C�b�`�ԍ�ds ���I���̏ꍇ�́A
�Q��ds��̒l��������Ă��邱�ƂɂȂ�܂��B
�Ⴆ�΁A�f�B�X�v���C�X�C�b�`�R�������I���̏ꍇ�́A�Q��3��̂W�Ƃ����l���������Ă��܂��B

mpinfo(MPI_INTERP)��
��Ԍv�Z���@�̏��́A
mpid�Ŏ��ʂ���郂�[�V�����|�C���g�ƁA
���̎��ɑ傫���t���[���ԍ��������[�V�����|�C���g�̊Ԃ́A��Ԍv�Z���@�������Ă��܂��B
�O�̎��́A���ʐ��`���
�P�̎��́A�X�v���C�����
�ƂȂ�܂��B

���o�[�W�����ł́A
�X�v���C����Ԃ́A�傫�Ȋp�x�̕�Ԏ��ɂ�
�g�p�ł��܂���B
�i�]�܂������ʂ������܂���j
�ł��̂ŁA
�}���ɕω����邱�Ƃ����邩������Ȃ�
���[�V�����|�C���g�Ԃ̕�Ԍv�Z�ɂ́A
���ʐ��`��Ԃ��g�p���邱�Ƃ��A
�������߂��܂��B

�g�嗦�́AMPI_SCALEDIV�Ŋ������l��
�K�p����Ă��܂��B
�Ⴆ�΁A�w�������̊g�嗦�́A
mpinfo(MPI_SCALEX) / mpinfo(MPI_SCALEDIV)
�ł��B
�����_�ȉ����Z�b�g�ł���悤�ɁA
MPI_SCALEDIV���p�ӂ���Ă��܂��B


��̓I�Ȏg�p��́A
e3dhsp3_motionpoint.hsp
���������������B



������
�E����
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@mpid
�@�@���[�V�����|�C���g�����ʂ���h�c
�@�@E3DGetNextMP�Ŏ擾����id��n���Ă��������B

5. [IN][OUT]�@�����l�o�h�Q�l�`�w�̔z��@�F�@mpinfo
�@�@���[�V�����|�C���g�̏����i�[����z��B
�@�@mpinfo(MPI_QUA)�����́A�Ăяo���O�ɁA
�@�@���炩���ߐݒ肵�Ă����K�v������܂��B

�@�@mpinfo(MPI_QUA)�Ŏ��ʂ����N�H�[�^�j�I����
�@�@���[�V�����|�C���g�̎p�����
�@�@�������邱�ƂɂȂ�܂��B


�o�[�W���� : ver1.0.0.1

%index
E3DSetMPInfo
mpid�Ŏ��ʂ���郂�[�V�����|�C���g�ɏ����Z�b�g���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@mpid
p5 : [IN]�@����MPI_MAX�̔z��@�F�@mpinfo
p6 : [IN]�@����MPI_MAX�̔z��@�F�@mpinfoflag

%inst
mpid�Ŏ��ʂ���郂�[�V�����|�C���g�ɏ����Z�b�g���܂��B

mpinfo�Ampinfoflag�ɂ́A���ꂼ��
dim mpinfo, MPI_MAX
dim mpinfoflag, MPI_MAX
�ō쐬�����z����g�p���Ă��������B


mpinfo�ɂ��炩���߃Z�b�g����Ă�������A
mpid�Ŏ��ʂ���郂�[�V�����|�C���g�ɁA
�ݒ肵�܂��B

mpinfo�́A�ǂ̐����ɁA
���̏����Z�b�g����Ηǂ�����
E3DGetMPInfo���������������B

mpinfoflag�́A�����I�ɏ����Z�b�g�ł���悤�ɂ��邽�߂ɁA�g�p���܂��B

mpinfoflag(MPI_QUA)���P�̏ꍇ�́A
mpinfo(MPI_QUA)�̃N�H�[�^�j�I������
���[�V�����|�C���g�ɃZ�b�g���܂��B

mpinfoflag(MPI_TRAX)���P�̏ꍇ�́A
mpinfo(MPI_TRAX)��X�����̈ړ��ʏ���
���[�V�����|�C���g�ɃZ�b�g���܂��B

�ȉ����l�ɁA
mpinfoflag(MPI_QUA) �`mpinfoflag(MPI_SCALEDIV)
�܂łɁA�Z�b�g���������ڂɂP���A
�Z�b�g�������Ȃ����ڂɂO���w�肵�Ă��������B


��̓I�Ȏg�p��́Azip���́A
e3dhsp3_motionpoint.hsp
�ɏ����Ă���܂��̂ŁA
�������������B


���[�V�����|�C���g�ɏ����Z�b�g���������ł́A���f���̃|�[�Y�ɔ��f����܂���B
�|�[�Y�ɔ��f�����邽�߂ɂ́A
E3DFillUpMotion���Ă�ł��������B

�������AE3DFillUpMotion�́A
�ƂĂ��A�v�Z�ʂ������A���s���Ԃ������̂ŁA
�Ȃ�ׂ��Ăяo���񐔂͏��Ȃ����Ă��������B

�܂�A�K�v�ȃ��[�V�����|�C���g�̑��삪
�S�ďI����Ă���A
�܂Ƃ߂Ĉ�񂾂��AE3DFillUpMotion����悤��
���Ă��������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@mpid
�@�@���[�V�����|�C���g�����ʂ���h�c
�@�@E3DGetNextMP�Ŏ擾����id��n���Ă��������B

5. [IN]�@����MPI_MAX�̔z��@�F�@mpinfo
�@�@���[�V�����|�C���g�̏����i�[����z��B

6. [IN]�@����MPI_MAX�̔z��@�F�@mpinfoflag
�@�@mpinfo�̂ǂ̐�����L���ɂ���̂����A
�@�@mpinfoflag�̊e�����Ŏw�肵�܂��B





�o�[�W���� : ver1.0.0.1

%index
E3DIsExistMP
frameno�Ŏw�肵���t���[���ԍ��ɁA���[�V�����|�C���g�����邩�ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p5 : [OUT] �ϐ��@�F�@mpid

%inst
frameno�Ŏw�肵���t���[���ԍ��ɁA���[�V�����|�C���g�����邩�ǂ����𒲂ׂ܂��B

���������ꍇ�́A
mpid�ɁA���[�V�����|�C���g��id���������A
���������ꍇ�́A
-1���������܂��B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@���[�V�����|�C���g�����邩�ǂ����A
�@�@���ׂ����t���[���ԍ����w�肵�܂��B

5. [OUT] �ϐ��@�F�@mpid
�@�@���[�V�����|�C���g�����ʂ���h�c
�@�@frameno�������t���[���ԍ��ɁA
�@�@���[�V�����|�C���g���������ꍇ�́A
�@�@���̃��[�V�����|�C���g��id���������܂��B
�@�@���������ꍇ�́A-1���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetMotionFrameLength
motid�Ŏ��ʂ���郂�[�V�����̃t���[�������擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [OUT] �ϐ��@�F�@leng

%inst
motid�Ŏ��ʂ���郂�[�V�����̃t���[�������擾���܂��B

�C��t���ė~�����̂́A
�t���[���ԍ��́A�O����n�܂�̂ŁA
�ő�̃t���[���ԍ��́A
leng - 1
���Ƃ������Ƃł��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@leng
�@�@���[�V�����̃t���[�������������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetMotionFrameLength
���[�V�����̃t���[������frameleng�ɕύX���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@frameleng
p4 : [IN] ���l�܂��́A�ϐ��@�F�@initflag

%inst
���[�V�����̃t���[������frameleng�ɕύX���܂��B

frameleng���A�ύX�O�̃t���[������菬���������ꍇ�́A
frameleng - 1���傫�ȃt���[���ԍ�������
���[�V�����|�C���g�́A�폜����܂��B

�����蔻�����A�����������
�폜����܂��B
�č\�z�������ꍇ�́A
initflag�ɂP���w�肵�Ă��������B
���Ȃ��Ă������A�������́A��ł���ꍇ�́A
�O���w�肵�Ă��������B

�����蔻����ƁA�����������́A
E3DFillUpMotion�Ăяo������
initflag�ɂP���w�肷�邱�Ƃł��A
�č\�z�ł��܂��B

�č\�z�̌v�Z�́A���Ԃ�������܂��B


�|�[�Y�̏����A�폜����܂��B
�č\�z����ꍇ�ɂ́A
E3DFillUpMotion���Ă�ł��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@frameleng
�@�@���[�V�����̃t���[�������w�肵�܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@initflag
�@�@�����蔻����ƁA������������
�@�@�č\�z����ꍇ�͂P���A
�@�@���Ȃ��ꍇ�͂O���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DAddMP
mpinfo�Ŏw�肵�����������[�V�����|�C���g���A�V���ɍ쐬���A�쐬�������[�V�����|�C���g�����ʂ���id���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [IN]�@�v�f��MPI_MAX�̔z��@�F�@mpinfo
p5 : [OUT] �ϐ��@�F�@mpid

%inst
mpinfo�Ŏw�肵�����������[�V�����|�C���g���A�V���ɍ쐬���A�쐬�������[�V�����|�C���g�����ʂ���id���擾���܂��B


mpinfo�ɂ́A
html{
<strong>dim mpinfo, MPI_MAX</strong>
}html
�ō쐬�����z����g�p���Ă��������B


mpinfo�́A�ǂ̐����ɁA
���̏����Z�b�g����Ηǂ�����
E3DGetMPInfo���������������B

html{
<strong>mpinfo(MPI_FRAMENO)�Ŏw�肵���t���[���ԍ��ɁA
���ɁA���[�V�����|�C���g�����݂���ꍇ�́A�G���[�ɂȂ�܂��̂ŁA
���ӂ��Ă��������B</strong>
}html
�i�Ăяo���O��E3DIsExistMP�ŁA
�`�F�b�N����Ɗm���ł��B�j


���[�V�����|�C���g�ɏ����Z�b�g���������ł́A���f���̃|�[�Y�ɔ��f����܂���B
�|�[�Y�ɔ��f�����邽�߂ɂ́A
E3DFillUpMotion���Ă�ł��������B

�������AE3DFillUpMotion�́A
�ƂĂ��v�Z�ʂ������A���s���Ԃ������̂ŁA
�Ȃ�ׂ��Ăяo���񐔂͏��Ȃ����Ă��������B

�܂�A�K�v�ȃ��[�V�����|�C���g�̑��삪
�S�ďI����Ă���A
�܂Ƃ߂Ĉ�񂾂��AE3DFillUpMotion����悤��
���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B

4. [IN]�@�v�f��MPI_MAX�̔z��@�F�@mpinfo
�@�@���[�V�����|�C���g�̏����i�[����z��B

5. [OUT] �ϐ��@�F�@mpid
�@�@�V���ɍ쐬�������[�V�����|�C���g�����ʂ���id��
�@�@�������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DDeleteMP
mpid�Ŏ��ʂ���郂�[�V�����|�C���g���폜���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@mpid

%inst
mpid�Ŏ��ʂ���郂�[�V�����|�C���g���폜���܂��B

���̊֐��ɓn����mpid�́A
�Ȍ�A�g���Ȃ��Ȃ�܂��B


���[�V�����|�C���g�̏����X�V���������ł́A���f���̃|�[�Y�ɔ��f����܂���B
�|�[�Y�ɔ��f�����邽�߂ɂ́A
E3DFillUpMotion���Ă�ł��������B

�������AE3DFillUpMotion�́A
�ƂĂ��A�v�Z�ʂ������A���s���Ԃ������̂ŁA
�Ȃ�ׂ��Ăяo���񐔂͏��Ȃ����Ă��������B

�܂�A�K�v�ȃ��[�V�����|�C���g�̑��삪
�S�ďI����Ă���A
�܂Ƃ߂Ĉ�񂾂��AE3DFillUpMotion����悤��
���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@mpid
�@�@���[�V�����|�C���g�����ʂ���h�c
�@�@E3DGetNextMP�Ŏ擾����id��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DFillUpMotion
���[�V�������w�肵���t���[���ԍ��������A��Ԍv�Z���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@startframe
p5 : [IN] ���l�܂��́A�ϐ��@�F�@endframe
p6 : [IN] ���l�܂��́A�ϐ��@�F�@initflag

%inst
���[�V�������w�肵���t���[���ԍ��������A��Ԍv�Z���܂��B

���̌v�Z�̌��ʁA
���f���̃|�[�Y�ɁA���[�V�����|�C���g�̏�񂪁A���f�����悤�ɂȂ�܂��B

boneno�Ŏw�肵���{�[���ƁA
���̑S�Ă̎q���{�[���̌v�Z���s���܂��B

���̂��߁A
html{
<strong>�ύX�����{�[���̓��ŁA
��Ԑe�̃{�[���̔ԍ��ŁA
1�񂾂����̊֐����Ăяo���΁A
�ǂ����ƂɂȂ�܂��B

</strong>
}html
��̓I�Ȏg�p��́Azip���́A
html{
<strong>e3dhsp3_fillupmotion.hsp</strong>
}html
�ɏ����܂����̂ŁA
�������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B

�@�@boneno�Ŏw�肵���{�[����
�@�@���̎q���{�[���S�Ẵ|�[�Y���v�Z���܂��B

�@�@boneno �Ɂ@-1���w�肵���ꍇ�́A
�@�@�S�Ẵ{�[���̌v�Z���s���܂��B

�@�@�ł����A
�@�@boneno���w�肵�������A
�@�@�v�Z�ʂ����Ȃ��Ȃ�܂��B


4. [IN] ���l�܂��́A�ϐ��@�F�@startframe
5. [IN] ���l�܂��́A�ϐ��@�F�@endframe
�@�@�t���[���ԍ����A
�@�@startframe����Aendframe�܂ł̊Ԃ�
�@�@���f���̃|�[�Y���v�Z���܂��B
�@�@startframe��endframe�ɂ́A
�@�@���[�V�����|�C���g�����݂��Ȃ��Ă��A
�@�@�v�Z�\�ł��B

�@�@endframe��-1���w�肵���ꍇ�́A
�@�@startrframe����A�Ō�̃t���[���܂�
�@�@�v�Z����܂��B


6. [IN] ���l�܂��́A�ϐ��@�F�@initflag
�@�@�ߋ��̃o�[�W�����ƌ݊�������邽�߂̈����ł��B
�@�@�O���w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1

%index
E3DCopyMotionFrame
srcmotid�Ŏ��ʂ���郂�[�V�����́A�t���[���ԍ�srcframeno�́A�S�Ẵ��[�V�����|�C���g�̏����Adstmotid�Ŏ��ʂ���郂�[�V�����́A�t���[���ԍ�dstframeno�̃��[�V�����|�C���g�ցA�R�s�[���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@srcmotid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@srcframeno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@dstmotid
p5 : [IN] ���l�܂��́A�ϐ��@�F�@dstframeno

%inst
srcmotid�Ŏ��ʂ���郂�[�V�����́A�t���[���ԍ�srcframeno�́A�S�Ẵ��[�V�����|�C���g�̏����Adstmotid�Ŏ��ʂ���郂�[�V�����́A�t���[���ԍ�dstframeno�̃��[�V�����|�C���g�ցA�R�s�[���܂��B

dstframeno�ɁA���[�V�����|�C���g�������ꍇ�́A�쐬����܂��B

srcframeno�Ƀ��[�V�����|�C���g�������ꍇ�́A
�v�Z�ŋ��߂āAdstframeno�ɃR�s�[���܂��B
���̏ꍇ�A�v�Z���Ԃ��A�]���ɂ�����܂��B



���[�V�����|�C���g�ɏ����Z�b�g���������ł́A���f���̃|�[�Y�ɔ��f����܂���B
�|�[�Y�ɔ��f�����邽�߂ɂ́A
E3DFillUpMotion���Ă�ł��������B

�������AE3DFillUpMotion�́A
�ƂĂ��A�v�Z�ʂ������A���s���Ԃ������̂ŁA
�Ȃ�ׂ��Ăяo���񐔂͏��Ȃ����Ă��������B

�܂�A�K�v�ȃ��[�V�����|�C���g�̑��삪
�S�ďI����Ă���A
�܂Ƃ߂Ĉ�񂾂��AE3DFillUpMotion����悤��
���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@srcmotid
�@�@�R�s�[���̃��[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@srcframeno
�@�@�R�s�[���̃t���[���ԍ�

4. [IN] ���l�܂��́A�ϐ��@�F�@dstmotid
�@�@�R�s�[��̃��[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@dstframeno
�@�@�R�s�[��̃t���[���ԍ�




�o�[�W���� : ver1.0.0.1

%index
E3DGetDirQ2
E3DGetDirQ��qid�ő���ł���悤�ɂ������̂ł��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN][OUT] ���l�܂��́A�ϐ��@�F�@qid

%inst
E3DGetDirQ��qid�ő���ł���悤�ɂ������̂ł��B

qid�Ŏw�肵���N�H�[�^�j�I���ɁA
���f���f�[�^�̎p����񂪁A
�i�[����܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN][OUT] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DSetDirQ2
E3DSetDirQ��qid�ő���ł���悤�ɂ������̂ł��B
%group
Easy3D For HSP3 : ���f������

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@qid

%inst
E3DSetDirQ��qid�ő���ł���悤�ɂ������̂ł��B

qid�Ŏ��ʂ����N�H�[�^�j�I����
�p�������A
���f���f�[�^�ɃZ�b�g���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DLookAtQ
�w�肵���������A���X�Ɍ������߂̎p�������A�N�H�[�^�j�I���ɃZ�b�g���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@vecx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vecy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@vecz
p5 : [IN] ���l�܂��́A�ϐ��@�F�@basevecx
p6 : [IN] ���l�܂��́A�ϐ��@�F�@basevecy
p7 : [IN] ���l�܂��́A�ϐ��@�F�@basevecz
p8 : [IN] ���l�܂��́A�ϐ��@�F�@upflag
p9 : [IN] ���l�܂��́A�ϐ��@�F�@divnum

%inst
�w�肵���������A���X�Ɍ������߂̎p�������A�N�H�[�^�j�I���ɃZ�b�g���܂��B

���̊֐��́A���̊֐��̌Ăяo���O��
�N�H�[�^�j�I���̎p�������A�v�Z�Ɏg�p���܂��B
�ł��̂ŁA
qid�ɂ́A���O�ɂ��̊֐����Ăяo�����Ƃ��ƁA����qid���n�������̂Ɖ��肵�Ă��܂��B

qid�𑼂̃{�[���̎p�����Ȃǂ̌v�Z�̍ۂɁA�g���񂵂��Ă���ꍇ�́A
�v�Z�������{�[���̎p�������A
�Ăяo���O�ɁA
E3DCopyQ�ȂǂŁA�R�s�[���Ă����Ă��������B


�ibasevecx, basevecy, basevecz�j�̃x�N�g����
(vecx, vecy, vecz)�̕����Ɍ�����v�Z�����܂��B

�L�����N�^�[�S�̂̎p���̐��������ꍇ�́A
basevec�ɂ́A������Ԃ̌����A
�܂�A(0, 0, -1)��^����΁A�悢���ƂɂȂ�܂��B

�{�[���̎p���𐧌䂷��ꍇ�ɂ́A
������Ԃ̃{�[���̌���
�܂�A�{�[���̍��W����A�e�{�[���̍��W��
���������̂��Abasevec�ɗ^����΁A
�悢���ƂɂȂ�܂��B


(vecx, vecy, vecz)�ɂ́A
���������ʒu���W����A
�����̈ʒu���W�����������̂��A
�^���Ă��������B


upflag�̒l�ɂ���āA�S�̃��[�h������܂��B

upflag == 0 �̂Ƃ��́A
������������A��ɂx������������悤��
���䂳��܂��B

upflag == 1 �̂Ƃ��́A
������������A��ɂx�������������悤��
���䂳��܂��B

upflag == 2 �̂Ƃ��́A
������������A�A�������������Ƃ�悤�ɁA
���䂳��܂��B
���̌��ʁA���Ԃ肪�\�ƂȂ�܂��B

upflag == 3 �̂Ƃ��́A
������������A���ɐ��䂵�܂���B
����������́A�A�������������Ƃ�܂����A
���̕����́A�S������܂���B

��s�@�̐���ȂǂɁAupflag 2���g�p���A
�l�^�L�����Ȃǂ̐���ɁAupflag 0 ���g�p����
���Ƃ��A�������߂��܂��B

html{
<strong>upflag == 0��upflag== 1�̂Ƃ��ɂ́A
�^��Ɛ^���������Ȃ��悤�ɂ��Ă��������B
</strong>
}html
upflag == 2��upflag==3�̂Ƃ��́A
�^��Ɛ^���������Ă��A���v�ł��B


divnum�����ɁA���������w�肵�܂��B
���݂̈ʒu�ƁA�ڕW�n�_�Ƃ̊Ԃ̊Ԋu��
1 / divnum ���A�������āA�߂Â��܂��B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_lookatq.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I���ɁA
�@�@�w�肵���������������߂̏�񂪁A
�@�@�i�[����܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@vecx
3. [IN] ���l�܂��́A�ϐ��@�F�@vecy
4. [IN] ���l�܂��́A�ϐ��@�F�@vecz
�@�@(vecx, vecy, vecz)�ɁA
�@�@�������������̃x�N�g�����w�肵�Ă��������B
�@�@�ʒu�ł͂Ȃ��āA�������w�肵�Ă��������B
�@�@�����B

5. [IN] ���l�܂��́A�ϐ��@�F�@basevecx
6. [IN] ���l�܂��́A�ϐ��@�F�@basevecy
7. [IN] ���l�܂��́A�ϐ��@�F�@basevecz
�@�@(basevecx, basevecy, basevecz)�ɁA
�@�@������Ԃ̌������w�肵�Ă��������B
�@�@�����B

8. [IN] ���l�܂��́A�ϐ��@�F�@upflag
�@�@������̐��䃂�[�h���w�肵�Ă��������B
�@�@

9. [IN] ���l�܂��́A�ϐ��@�F�@divnum
�@�@�������銄�����w�肵�Ă��������B
�@�@�傫�Ȓl�������قǁA
�@�@�ׂ��������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DMultQVec
(befvecx, befvecy, befvecz)�Ƃ����x�N�g���ɑ΂��āAqid�Ŏ��ʂ����N�H�[�^�j�I���ɂ���]��������̃x�N�g�����A(aftvecx,
aftvecy, aftvecz)�ɑ�����܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@befvecx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@befvecy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@befvecz
p5 : [OUT] �ϐ��@�F�@aftvecx
p6 : [OUT] �ϐ��@�F�@aftvecy
p7 : [OUT] �ϐ��@�F�@aftvecz

%inst
(befvecx, befvecy, befvecz)�Ƃ����x�N�g���ɑ΂��āAqid�Ŏ��ʂ����N�H�[�^�j�I���ɂ���]��������̃x�N�g�����A(aftvecx,
aftvecy, aftvecz)�ɑ�����܂��B


�Ⴆ�΁A������ԂŁA-Z�����������Ă���
���f���̏ꍇ�A

qid�ɁAE3DGetDirQ2�Ăяo���Ɏg�p����
qid��n���A
basevec�ɁA�i0, 0, -1�j��n���΁A
aftvec�ɁA���݁A�L�����N�^�[�������Ă���������������܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I����
�@�@��]�ϊ������܂��B
�@�@
2. [IN] ���l�܂��́A�ϐ��@�F�@befvecx
3. [IN] ���l�܂��́A�ϐ��@�F�@befvecy
4. [IN] ���l�܂��́A�ϐ��@�F�@befvecz
�@�@(befvecx, befvecy, befvecz)�ɁA
�@�@��]�O�̃x�N�g�����w�肵�Ă��������B
�@�@�����B

5. [OUT] �ϐ��@�F�@aftvecx
6. [OUT] �ϐ��@�F�@aftvecy
7. [OUT] �ϐ��@�F�@aftvecz
�@�@(aftvecx, aftvecy, aftvecz)�ɁA
�@�@�N�H�[�^�j�I���ł̉�]��̃x�N�g����
�@�@�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DTwistQ
�N�H�[�^�j�I���ɁA�˂���������܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@twistdeg
p3 : [IN] ���l�܂��́A�ϐ��@�F�@basevecx
p4 : [IN] ���l�܂��́A�ϐ��@�F�@basevecy
p5 : [IN] ���l�܂��́A�ϐ��@�F�@basevecz

%inst
�N�H�[�^�j�I���ɁA�˂���������܂��B

basevec�ɂ́AE3DLookAtQ�Ő��������̂�
�����A������Ԃ̌������w�肵�Ă��������B


�˂���̊p�x�́A������Ԃ���̊p�x�ł͂Ȃ��A���݂̎p���ɁA�ǉ��������������́A
�˂���̊p�x���A�w�肵�Ă��������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I���ɁA
�@�@�w�肵���������������߂̏�񂪁A
�@�@�i�[����܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@twistdeg
�@�@twistdeg  �x�����A�˂���������܂��B
�@�@�����B

3. [IN] ���l�܂��́A�ϐ��@�F�@basevecx
4. [IN] ���l�܂��́A�ϐ��@�F�@basevecy
5. [IN] ���l�܂��́A�ϐ��@�F�@basevecz
�@�@(basevecx, basevecy, basevecz)�ɁA
�@�@������Ԃ̌������w�肵�Ă��������B
�@�@E3DLookAtQ�Ŏw�肵���̂Ɠ���basevec���w�肵�Ă��������B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DInitTwistQ
E3DTwistQ�ŗ^�����A�˂�����A���������܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@basevecx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@basevecy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@basevecz

%inst
E3DTwistQ�ŗ^�����A�˂�����A���������܂��B

basevec�ɂ́AE3DLookAtQ�Ő��������̂�
�����A������Ԃ̌������w�肵�Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I����
�@�@�˂�������������܂��B
�@�@
2. [IN] ���l�܂��́A�ϐ��@�F�@basevecx
3. [IN] ���l�܂��́A�ϐ��@�F�@basevecy
4. [IN] ���l�܂��́A�ϐ��@�F�@basevecz
�@�@(basevecx, basevecy, basevecz)�ɁA
�@�@������Ԃ̌������w�肵�Ă��������B
�@�@E3DLookAtQ�Ŏw�肵���̂Ɠ���basevec���w�肵�Ă��������B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetTwistQ
E3DTwistQ�ŗ^�����A�˂���̊p�x�̍��v���擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [OUT] �ϐ��@�F�@twist

%inst
E3DTwistQ�ŗ^�����A�˂���̊p�x�̍��v���擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I����
�@�@�˂�����擾���܂��B

2. [OUT] �ϐ��@�F�@twist
�@�@�˂���p�x�̍��v�̒l���A
�@�@������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DRotateQLocalX
�N�H�[�^�j�I�����A���[�J���Ȃw���Ɋւ��āA��]���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@deg

%inst
�N�H�[�^�j�I�����A���[�J���Ȃw���Ɋւ��āA��]���܂��B

���݂̎p���ɑ΂��āA�X�ɁA��]���܂��B

E3DRotateQX�ƈႤ�̂́A
�p���ϊ����s���O�̂w���Ɋւ��āA
��]�ł���_�ł��B

�g�p��́Ahtml{
<strong>e3dhsp3_motionpoint.hsp</strong>
}html�ɏ����܂����̂ŁA�������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I���ɁA
�@�@��]�������܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@deg �x�����A��]�������܂��B
�@�@�����B


�o�[�W���� : ver1.0.0.1

%index
E3DRotateQLocalY
�N�H�[�^�j�I�����A���[�J���Ȃx���Ɋւ��āA��]���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@deg

%inst
�N�H�[�^�j�I�����A���[�J���Ȃx���Ɋւ��āA��]���܂��B

���݂̎p���ɑ΂��āA�X�ɁA��]���܂��B

E3DRotateQY�ƈႤ�̂́A
�p���ϊ����s���O�̂x���Ɋւ��āA
��]�ł���_�ł��B

�g�p��́Ahtml{
<strong>e3dhsp3_motionpoint.hsp</strong>
}html�ɏ����܂����̂ŁA�������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I���ɁA
�@�@��]�������܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@deg �x�����A��]�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DRotateQLocalZ
�N�H�[�^�j�I�����A���[�J���Ȃy���Ɋւ��āA��]���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@deg

%inst
�N�H�[�^�j�I�����A���[�J���Ȃy���Ɋւ��āA��]���܂��B

���݂̎p���ɑ΂��āA�X�ɁA��]���܂��B

E3DRotateQZ�ƈႤ�̂́A
�p���ϊ����s���O�̂y���Ɋւ��āA
��]�ł���_�ł��B

�g�p��́Ahtml{
<strong>e3dhsp3_motionpoint.hsp</strong>
}html�ɏ����܂����̂ŁA�������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@����id�Ŏ��ʂ����N�H�[�^�j�I���ɁA
�@�@��]�������܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@deg �x�����A��]�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetBonePos
�{�[���̈ʒu�����擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@poskind
p4 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p5 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p6 : [OUT] �ϐ��@�F�@posx
p7 : [OUT] �ϐ��@�F�@posy
p8 : [OUT] �ϐ��@�F�@posz
p9 : [IN] ���l�܂��́A�ϐ��@�F�@scaleflag

%inst
�{�[���̈ʒu�����擾���܂��B

poskind == 0�̂Ƃ��́A���[�J�����W(�{�[���ό`�Ȃ�)
poskind == 1�̂Ƃ��́A�O���[�o�����W
poskind == 2�̂Ƃ��́A���[�J�����W�i�{�[���ό`����j
���擾�ł��܂��B

boneno�ɂ́AE3DGetBoneNoByName
�Ŏ擾�����ԍ����w�肵�Ă��������B


�}���`���C���[���[�V�������g�p����ꍇ�́A
���̖��߂͎g���܂���B
E3DGetCurrentBonePos�����g�����������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c
�@�@E3DGetBoneNoByName�Ŏ擾����
�@�@�{�[���̔ԍ���n���Ă��������B
�@�@
3. [IN] ���l�܂��́A�ϐ��@�F�@poskind
�@�@���[�J�����W�ƁA�O���[�o�����W��
�@�@�ǂ�����擾���邩���w�肵�܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����mk���w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@���[�V�����̃t���[���ԍ����w�肵�Ă��������B
�@�@E3DSetNewPose�Ăяo�����ɁA���݂̃t���[���ԍ����擾�ł���̂ŁA
�@�@�Q�l�ɂ��Ă��������B


6. [OUT] �ϐ��@�F�@posx
7. [OUT] �ϐ��@�F�@posy
8. [OUT] �ϐ��@�F�@posz
�@�@(posx, posy, posz)�ɁA
�@�@�{�[���̍��W���������܂��B
�@�@�����^�̕ϐ��B


9. [IN] ���l�܂��́A�ϐ��@�F�@scaleflag
�@�@scaleflag�ɂP���Z�b�g����ƁA
�@�@E3DSetScale�̌��ʂ𔽉f����pos���v�Z���܂��B
�@�@�O���Z�b�g���ꂽ�ꍇ�ɂ́A
�@�@E3DSetScale�̌��ʂ����f����܂���B



�o�[�W���� : ver3.0.3.4�Ŋg��

%index
E3DCreateLine
�����쐬���āAlineid���擾���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��@�F�@pointpos
p2 : [IN] ���l�܂��́A�ϐ��@�F�@pointnum
p3 : [IN] ���l�܂��́A�ϐ��@�F�@maxpointnum
p4 : [IN] ���l�܂��́A�ϐ��@�F�@linekind
p5 : [OUT] �ϐ��@�F�@lineid

%inst
�����쐬���āAlineid���擾���܂��B
lineid�́A���I�u�W�F�N�g����ӂɎ��ʂ��邽�߂̔ԍ��ł��B

E3DCreateLine�AE3DDestroyLine
E3DSetLineColor�AE3DAddPoint2Line
E3DDeletePointOfLine�AE3DSetPointPosOfLine
E3DGetPointPosOfLine
E3DGetNextPointOfLine
E3DGetPrevPointOfLine
�ɓn��lineid�́A���̊֐��Ŏ擾����lineid��
�g�p���Ă��������B

pointpos�ɂ́A
html{
<strong>ddim pointpos, pointnum, 3</strong>
}html
�Ŋm�ۂ����f�[�^��n���Ă��������B

dim�ł͂Ȃ��āAddim�Ŋm�ۂ��Ă��������B

pointnum�ɂ́A�_�̐������Ă��������B
html{
<strong>�_�̐��̍ő�l�͂U�T�T�R�T�ł��B</strong>
}html
html{
<strong>pointnum���Q��菬�����ꍇ�́A�G���[�ɂȂ�܂��B</strong>
}html
pointpos(�_�̔ԍ�,0) �ɂw���W�A
pointpos(�_�̔ԍ�,�P) �ɂx���W�A 
pointpos(�_�̔ԍ�,�Q) �ɂy���W
�����āA���������Ă����Ă��������B


�쐬�������́A
E3DRender�ŁA�`��ł��܂��B
hsid�̑���ɁAlineid���w�肵�Ă��������B


LINE�֌W�̊֐��̎g�p��́A
html{
<strong>e3dhsp3_autorun.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��@�F�@pointpos
�@�@�����\������_�̍��W���w�肵�Ă��������B
�@�@�������̊m�ۂ̎d���A�l�̃Z�b�g�̎d���́A
�@�@���̋L�q���������������B
�@�@�K���Addim�Ń��������쐬���Ă��������B
�@�@�����^�̕ϐ��B


2. [IN] ���l�܂��́A�ϐ��@�F�@pointnum
�@�@����������_�̐����w�肵�Ă��������B
�@�@pointpos�̃f�[�^���m�ۂ���ۂɎg����
�@�@�_�̐���n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@maxpointnum
�@�@Line�́AE3DAddPoint2Line���߂ŁA
�@�@�_�̐��𑝂₷���Ƃ��\�ł��B
�@�@�ő剽�܂ŁA�_�̐��𑝂₹�邩��
�@�@�w�肵�Ă��������B
�@�@�i�_�̐��̍��v�ł��B�j
�@�@
�@�@�r�f�I�������́Apointnum�ł͂Ȃ��āA
�@�@maxpointnum�ŃA���P�[�g����܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@linekind
�@�@���̎�ނ��w�肵�܂��B
�@�@LINELIST�̏ꍇ�͂Q���A
�@�@LINESTRIP�̏ꍇ�͂R���w�肵�Ă��������B
�@�@LINELIST, LISTSTRIP�ɂ��Ă̐����́A
�@�@<A href="linekind.htm">���̎�ނ̐���</A>���������������B

5. [OUT] �ϐ��@�F�@lineid
�@�@�쐬�����������ʂ���ԍ����A�������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DDestroyLine
E3DCreateLine �ō쐬���������폜���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid

%inst
E3DCreateLine �ō쐬���������폜���܂��B
�폜����lineid�́A
�ȍ~�A�ǂ̖��߂ɂ��g��Ȃ��ł��������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�폜����������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B


�o�[�W���� : ver1.0.0.1

%index
E3DSetLineColor
���̐F��ݒ肵�܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@A
p3 : [IN] ���l�܂��́A�ϐ��@�F�@R�@�@
p4 : [IN] ���l�܂��́A�ϐ��@�F�@G
p5 : [IN] ���l�܂��́A�ϐ��@�F�@B

%inst
���̐F��ݒ肵�܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@A
�@�@�����x���w�肵�܂��B
�@�@�O����Q�T�T�̒l��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@R�@�@
4. [IN] ���l�܂��́A�ϐ��@�F�@G
5. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�F�̐���(�q�C�f�C�a)���w�肵�Ă��������B
�@�@���ꂼ��A�O����Q�T�T�̒l��n���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DAddPoint2Line
���ɓ_��ǉ����A�ǉ������_�����ʂ���pid���擾���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@prevpid
p3 : [OUT] �ϐ��@�F�@pid

%inst
���ɓ_��ǉ����A�ǉ������_�����ʂ���pid���擾���܂��B

�_�̐��̍��v���A
E3DCreateLine�ɓn����maxpointnum
���傫���Ȃ�ƁA�G���[�ɂȂ�܂��B

�擾����pid��E3DSetPointPosOfLine�֐���
�n���āA
�t���������_�̍��W���Z�b�g���Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@prevpid
�@�@���̒��̂ǂ��ɁA�V�����_��ǉ����邩���w�肵�܂��B
�@�@prevpid�Ŏw�肵���_�̎��̓_�Ƃ��āA
�@�@�V�����_��ǉ����܂��B
�@�@prevpid��-2���w�肵���ꍇ�ɂ́A���̐擪�ɁA
�@�@prevpid��-1���w�肵���ꍇ�ɂ́A���̍Ō��
�@�@�V�����_��ǉ����܂��B

3. [OUT] �ϐ��@�F�@pid
�@�@�V�����ǉ������_�����ʂ���ԍ����A�������܂��B
�@�@pid�́A�����ƂɌŗL�Ȓl�ł��B



�o�[�W���� : ver1.0.0.1

%index
E3DDeletePointOfLine
���̒��̓_���폜���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@pid

%inst
���̒��̓_���폜���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@pid
�@�@�폜����_�����ʂ���ԍ����w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DSetPointPosOfLine
���̒��̓_�̍��W���Z�b�g���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@pid
p3 : [IN] �ϐ��@�F�@pos

%inst
���̒��̓_�̍��W���Z�b�g���܂��B

���Wpos�́A
html{
<strong>ddim pos, 3</strong>
}html
�Ŋm�ۂ�����������n���Ă��������B

�K���Adim�ł͂Ȃ��āAddim�Ń��������쐬���Ă��������B


pos(0)�ɂ́A�w���W���A
pos(1)�ɂ́A�x���W���A 
pos(2)�ɂ́A�y���W���w�肵�Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@pid
�@�@�_�����ʂ���ԍ���n���܂��B

3. [IN] �ϐ��@�F�@pos
�@�@�_�̍��W��n���Ă��������B
�@�@pos�̊m�ۂ̎d���A�l�̃Z�b�g�̎d���́A
�@�@���̋L�q���������������B
�@�@ddim�ō쐬���������^�z��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetPointPosOfLine
���̒��̓_�̍��W���擾���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@pid
p3 : [OUT] �ϐ��@�F�@pos

%inst
���̒��̓_�̍��W���擾���܂��B

���W����������pos�́A
html{
<strong>ddim pos, 3</strong>
}html
�Ŋm�ۂ�����������n���Ă��������B

�K���Adim�ł͂Ȃ��āAddim�Ń��������쐬���Ă��������B


pos(0)�ɂ́A�w���W���A
pos(1)�ɂ́A�x���W���A 
pos(2)�ɂ́A�y���W���������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@pid
�@�@�_�����ʂ���ԍ���n���܂��B

3. [OUT] �ϐ��@�F�@pos
�@�@�_�̍��W����������z���n���Ă��������B
�@�@pos�̊m�ۂ̎d���A�l�̃Z�b�g�̂�����́A
�@�@���̋L�q���������������B
�@�@ddim�ō쐬���������^�z��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetNextPointOfLine
previd�Ŏw�肵���_�́A���̓_�̂h�c���擾���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@previd
p3 : [OUT] �ϐ��@�F�@nextid

%inst
previd�Ŏw�肵���_�́A���̓_�̂h�c���擾���܂��B
���́A�_���A�o�������X�g�ŁA�i�[���Ă��܂��B


���̓_�����݂��Ȃ��ꍇ�́A
nextid �ɂ́A���̒l���������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@previd
�@�@�_�����ʂ���ԍ�

3. [OUT] �ϐ��@�F�@nextid
�@�@previd�̓_�́A���̓_�̂h�c���������܂��B

�@�@previd ��-1���w�肳��Ă���ꍇ�́A
�@�@nextid�ɂ́A�擪�̓_��ID���������܂�



�o�[�W���� : ver1.0.0.1

%index
E3DGetPrevPointOfLine
pid�Ŏw�肵���_�́A��O�̓_�̂h�c���擾���܂��B
%group
Easy3D For HSP3 : ���C��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lineid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@pid
p3 : [OUT] �ϐ��@�F�@previd

%inst
pid�Ŏw�肵���_�́A��O�̓_�̂h�c���擾���܂��B


���́A�_���A�o�������X�g�ŁA�i�[���Ă��܂��B

��O�̓_�����݂��Ȃ��ꍇ�́A
previd �ɂ́A���̒l���������܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@lineid
�@�@�������ʂ���ԍ���n���܂��B
�@�@E3DCreateLine�Ŏ擾�����ԍ����g���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@pid
�@�@�_�����ʂ���ID

3. [OUT] �ϐ��@�F�@previd
�@�@pid�̓_�́A���̓_�̂h�c���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DWriteDisplay2BMP
�o�b�N�o�b�t�@�̓��e���A�a�l�o�t�@�C���ɕۑ����܂��B
%group
Easy3D For HSP3 : �o��

%prm
p1,p2
p1 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�o�b�N�o�b�t�@�̓��e���A�a�l�o�t�@�C���ɕۑ����܂��B

filename�ɂ́A�g���q�����������O��
�w�肵�Ă��������B


html{
<strong>E3DInit��multisamplenum�ɂO�ȊO���w�肵���ꍇ�́A���̖��߂͎g���܂���B
�i�G���[�ɂȂ�܂��B�j
</strong>
}html



������
1. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@�o�͂���a�l�o �̃p�X������B

�@�@�g���q���������p�X���w�肵�Ă��������B
�@�@���̊֐��ŁA�����I�ɁA�h.bmp�h���t������܂��B

�@�@���ɓ����t�@�C���������݂��Ă���ꍇ�́A
�@�@���̃t�@�C���́A�㏑�������̂Œ��ӂ��Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1<BR>
      ver3.0.2.4�ň����ǉ�

%index
E3DCreateAVIFile
�`�u�h�t�@�C�������������āAaviid���擾���܂��B
%group
Easy3D For HSP3 : �o��

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p2 : [IN] ���l�܂��́A�ϐ��@�F�@datatype
p3 : [IN] ���l�܂��́A�ϐ��@�F�@compkind
p4 : [IN] ���l�܂��́A�ϐ��@�F�@framerate
p5 : [IN] ���l�܂��́A�ϐ��@�F�@frameleng
p6 : [OUT] �ϐ��@�F�@aviid
p7 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�`�u�h�t�@�C�������������āAaviid���擾���܂��B

aviid�́A�`�u�h�t�@�C�������ʂ��邽�߂̔ԍ��ł��B

���̖��߂ō쐬�����`�u�h�t�@�C���ɑ΂��āA
E3DWriteData2AVIFile���߂ŁA
�o�b�N�o�b�t�@�̓��e���������݁A
E3DCompleteAVIFile���߂ŁA
�I�����������܂��B

E3DWriteData2AVIFile���߁A
E3DCompleteAVIFile���߂ɂ́A
E3DCreateAVIFile���߂Ŏ擾����aviid��
�n���Ă��������B


html{
<strong>E3DInit��multisamplenum�ɂO�ȊO���w�肵���ꍇ�́A���̖��߂͎g���܂���B
�i�G���[�ɂȂ�܂��B�j
</strong>
}html


�`�u�h�֌W�̖��߂̋�̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_savedisplay.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B



������
1. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@�o�͂���a�l�o �̃p�X������B

�@�@�g���q���������p�X���w�肵�Ă��������B
�@�@���̊֐��ŁA�����I�ɁA�h.avi�h���t������܂��B

�@�@���ɓ����t�@�C���������݂��Ă���ꍇ�́A
�@�@���̃t�@�C���́A�㏑�������̂Œ��ӂ��Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@datatype
�@�@�쐬����f�[�^�̎�ނ��w�肵�܂��B
�@�@���o�[�W�����ł́A�f���݂̂�������Ȃ����߁A
�@�@��ɂP���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@compkind
�@�@���k�̎�ނ��w�肵�܂��B
�@�@�O���w�肵���ꍇ�́A
�@�@�@�@���k�Ȃ�
�@�@�P���w�肵���ꍇ�́A
�@�@�@�@cinepak Codec by Radius�ɂ�鈳�k
�@�@�Q���w�肵���ꍇ�ɂ́A
�@�@�@�@Microsoft Video 1�ɂ�鈳�k
�@�@�����܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@framerate
�@�@�`�u�h�t�@�C���̃t���[�����[�g���w�肵�Ă��������B
�@�@�ʏ�́A�X�N���v�g�v���O�����̂e�o�r���w�肵�܂��B
�@�@�U�O�e�o�r�ŕ\�����Ă���ꍇ�́A�U�O�Ǝw�肵�܂��B


5. [IN] ���l�܂��́A�ϐ��@�F�@frameleng
�@�@�`�u�h�t�@�C���̃t���[�����̍��v���B
�@�@frameleng�񂾂��AE3DWriteData2AVIFile�ŁA
�@�@�f�[�^���t�@�C���ɏ������ނ��Ƃ��o���܂��B

6. [OUT] �ϐ��@�F�@aviid
�@�@�쐬�����`�u�h�t�@�C�������ʂ��邽�߂�
�@�@�ԍ����������܂��B

7. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1<BR>
      ver3.0.2.4�ň����ǉ�<BR>
      

%index
E3DWriteData2AVIFile
�o�b�N�o�b�t�@�̓��e���A�`�u�h�t�@�C���ɏ������݂܂��B
%group
Easy3D For HSP3 : �o��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@aviid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@datatype
p3 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�o�b�N�o�b�t�@�̓��e���A�`�u�h�t�@�C���ɏ������݂܂��B

E3DCreateAVIFile�Ŏw�肵��frameleng�񂾂�
���̖��߂��ĂԂ��Ƃ��o���܂��B

frameleng��𒴂����Ăяo���́A
�G���[�ƂȂ�A��������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@aviid
�@�@AVI�t�@�C�������ʂ��邽�߂̔ԍ����w�肵�Ă��������B
�@�@E3DCreateAVIFile�Ŏ擾�����ԍ����g�p���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@datatype
�@�@�쐬����f�[�^�̎�ނ��w�肵�܂��B
�@�@���o�[�W�����ł́A�f���݂̂�������Ȃ����߁A
�@�@��ɂP���w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1<BR>
      ver3.0.2.4�ň����ǉ�<BR>
      

%index
E3DCompleteAVIFile
�`�u�h�t�@�C���̏I�����������܂��B
%group
Easy3D For HSP3 : �o��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@aviid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@datatype
p3 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�`�u�h�t�@�C���̏I�����������܂��B

�K�v�ȉ񐔁AE3DWriteData2AVIFile���߂�
�Ăяo������ɁA���̖��߂��Ăяo���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@aviid
�@�@AVI�t�@�C�������ʂ��邽�߂̔ԍ����w�肵�Ă��������B
�@�@E3DCreateAVIFile�Ŏ擾�����ԍ����g�p���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@datatype
�@�@�쐬����f�[�^�̎�ނ��w�肵�܂��B
�@�@���o�[�W�����ł́A�f���݂̂�������Ȃ����߁A
�@�@��ɂP���w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1<BR>
      ver3.0.2.4�ň����ǉ�<BR>
      

%index
E3DCameraLookAt
�J�������������������ɁA���X�Ɍ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@vecx
p2 : [IN] ���l�܂��́A�ϐ��@�F�@vecy
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vecz
p4 : [IN] ���l�܂��́A�ϐ��@�F�@upflag
p5 : [IN] ���l�܂��́A�ϐ��@�F�@divnum

%inst
�J�������������������ɁA���X�Ɍ����܂��B

�ivecx, vecy, vecz�j�ɂ́A�����_�ł͂Ȃ��āA
�������������̃x�N�g�����w�肵�Ă��������B

�Ⴆ�΁A�����_(tx, ty, tz)�����������ꍇ�́A
E3DGetCameraPos camx, camy, camz
�Ƃ��āA�J�����̈ʒu�����߁A
�����Z���邾���łn�j�ł��B
vecx = tx - camx
vecy = ty - camy
vecz = tz - camz
�̂悤�ɂ��āA�v�Z���A�w�肵�Ă��������B


upflag�́AE3DLookAtQ�ł̗p�@�Ɠ����ł��B
upflag == 0 �̂Ƃ��́A
������������A��ɂx������������悤��
���䂳��܂��B

upflag == 1 �̂Ƃ��́A
������������A��ɂx�������������悤��
���䂳��܂��B

upflag == 2 �̂Ƃ��́A
������������A�A�������������Ƃ�悤��
���䂳��܂��B
���̌��ʁA���Ԃ肪�\�ƂȂ�܂��B

upflag == 3 �̂Ƃ��́A
�������������ɐ��䂵�܂���B
����������́A�A�������������Ƃ�܂����A
���̕����͍S������܂���B


divnum�����ɁA���������w�肵�܂��B
���݂̈ʒu�ƁA�ڕW�n�_�Ƃ̊Ԃ̊Ԋu��
1 / divnum ���A�������āA�߂Â��܂��B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_CameraOnNaviline.hsp</strong>
}html
�ɏ����܂����̂ŁA
�������������B

�܂��A���̃y�[�W�̍ŏ��ɏ����Ă���A
�J�����̎g�����̏����A���ǂ݂��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@vecx
2. [IN] ���l�܂��́A�ϐ��@�F�@vecy
3. [IN] ���l�܂��́A�ϐ��@�F�@vecz
�@�@���������x�N�g�����A�w�肵�Ă��������B
�@�@�x�N�g���̌v�Z���@�́A���L���������������B
�@�@�����B

4. [IN] ���l�܂��́A�ϐ��@�F�@upflag
�@�@�����������@�̃��[�h���w�肵�Ă��������B
�@�@�ڂ����́A���L���������������B

5. [IN] ���l�܂��́A�ϐ��@�F�@divnum
�@�@���������w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DCameraOnNaviLine
�J�������i�r���C���ɉ����ē������܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11
p1 : [IN] ���l�܂��́A�ϐ��@�F�@nlid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mode
p3 : [IN] ���l�܂��́A�ϐ��@�F�@roundflag
p4 : [IN] ���l�܂��́A�ϐ��@�F�@reverseflag
p5 : [IN] ���l�܂��́A�ϐ��@�F�@offsetx
p6 : [IN] ���l�܂��́A�ϐ��@�F�@offsety
p7 : [IN] ���l�܂��́A�ϐ��@�F�@offsetz
p8 : [IN] ���l�܂��́A�ϐ��@�F�@posstep
p9 : [IN] ���l�܂��́A�ϐ��@�F�@dirdivnum
p10 : [IN] ���l�܂��́A�ϐ��@�F�@upflag
p11 : [IN] [OUT] �ϐ��@�F�@targetpointid

%inst
�J�������i�r���C���ɉ����ē������܂��B

mode�����ɂO���w�肷��ƁA
�J�����̈ʒu�����𐧌䂵�܂��B

mode�����ɂP���w�肷��ƁA
�ʒu�ɉ����A���������䂵�܂��B

���[�v�ړ���A���Ε����ւ̈ړ���
�T�|�[�g���Ă��܂��B


�i�r���C���̍쐬�ɂ́A
GViewer.exe���g���ƕ֗��ł��B
�i����������k�`�a�Ń_�E�����[�h�\�ł��B�j

�i�r���C���́A�n�ʂ̍����ɍ쐬���邱�Ƃ�
���ʂȂ̂ŁA�i�r���C������J�����܂ł�
�I�t�Z�b�g�l���w��ł���悤�ɂ��܂����B

�Ⴆ�΁A�n�ʂ���P�O�O�O����������A
�J�����𓮂��������Ƃ��́A
�n�ʂ̍����Ƀi�r���C�����쐬���A
���̊֐��̃I�t�Z�b�g������
offsetx = 0 : offsety = 1000 : offsetz = 0
�̒l���w�肷��΂n�j�ł��B



��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_CameraOnNaviline.hsp</strong>
}html
�ɏ����܂����̂ŁA
�������������B

�܂��A���̃y�[�W�̍ŏ��ɏ����Ă���A
�J�����̎g�����̏����A���ǂ݂��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@nlid
�@�@�i�r���C�������ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@mode
�@�@�ʒu�����𐧌䂷��ꍇ�͂O���A
�@�@�ʒu�ƌ����𐧌䂷��ꍇ�͂P���w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@roundflag
�@�@�i�r���C���̍Ō�̃i�r�|�C���g�Ɉړ�������A
�@�@�i�r���C���̍ŏ��̃i�r�|�C���g�̈ʒu��
�@�@�ڎw�����ǂ����������܂��B

�@�@�P���w�肷��ƁA�~�`�̃i�r���C���̏ꍇ�́A
�@�@�����ƁA���邮���邱�ƂɂȂ�܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@reverseflag
�@�@�P���w�肷��ƁA
�@�@�i�r���C���̃|�C���g���t���ɂ��ǂ�悤�ɂȂ�܂��B


5. [IN] ���l�܂��́A�ϐ��@�F�@offsetx
6. [IN] ���l�܂��́A�ϐ��@�F�@offsety
7. [IN] ���l�܂��́A�ϐ��@�F�@offsetz
�@�@�i�r���C������A�J�����ʒu�܂ł̃I�t�Z�b�g�l��
�@�@�w�肵�܂��B
�@�@�ڂ����́A���L���������������B
�@�@�����B

8. [IN] ���l�܂��́A�ϐ��@�F�@posstep
�@�@�J��������x�ɂǂꂭ�炢�̋������ړ������邩��
�@�@�w�肵�܂��B
�@�@�������A�i�r�|�C���g�t�߂ł́A
�@�@posstep��菬���ȋ��������ړ������Ȃ����Ƃ�����܂��B
�@�@�����B

9. [IN] ���l�܂��́A�ϐ��@�F�@dirdivnum
�@�@�������������܂ŁA���X�ɃJ�����������邽�߂�
�@�@�����ł��B
�@�@�ڕW�܂ł̊p�x��1/dirdivnum���������āA
�@�@���X�Ɍ����𐧌䂵�܂��B

10. [IN] ���l�܂��́A�ϐ��@�F�@upflag
�@�@E3DCameraLookAt�֐���upflag�����Ɠ����Ӗ��ł��B
�@�@�ڂ����́AE3DCameraLookAt�̐���������
�@�@���ǂ݂��������B


11. [IN] [OUT] �ϐ��@�F�@targetpointid
�@�@���ݖڎw���Ă���i�r�|�C���g�̂h�c�����܂��B
�@�@�ړ���́A���ɖڎw���ׂ��i�r�|�C���g�̂h�c��
�@�@�������܂��B

�@�@�ł��̂ŁA��ԍŏ��̌Ăяo�����̂݁A
�@�@������targetpoinid���w�肷��΁A
�@�@���Ƃ́A�����ϐ���n�������ŁA
�@�@�����I�ɁA�ڎw���ׂ��|�C���g�̂h�c��
�@�@�������Ă������ƂɂȂ�܂��B

�@�@targetpointid�ɁA
�@�@���݂��Ȃ��i�r�|�C���g�̂h�c����ꂽ�ꍇ�́A
�@�@�i�Ⴆ��-1�Ȃǁj
�@�@�����I�ɁA�ڎw���ׂ��i�r�|�C���g�����肵�܂��B
�@�@


�o�[�W���� : ver1.0.0.1

%index
E3DCameraDirUp
�J�����̌��݌����Ă���������A���X�ɏ�̕����Ɍ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@deg
p2 : [IN] ���l�܂��́A�ϐ��@�F�@divnum

%inst
�J�����̌��݌����Ă���������A���X�ɏ�̕����Ɍ����܂��B

���o�[�W�����ł́A
���Ԃ�̓T�|�[�g���Ă��܂���B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_CameraOnNaviline.hsp</strong>
}html
�ɏ����܂����̂ŁA
�������������B

�܂��A���̃y�[�W�̍ŏ��ɏ����Ă���A
�J�����̎g�����̏����A���ǂ݂��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@�p�x�B
�@�@�����B

2. [IN] ���l�܂��́A�ϐ��@�F�@divnum
�@�@deg�x�̊p�x���A1/divnum���������āA
�@�@�J�������A������Ɍ����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DCameraDirDown
�J�����̌��݌����Ă���������A���X�ɉ��̕����Ɍ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@deg
p2 : [IN] ���l�܂��́A�ϐ��@�F�@divnum

%inst
�J�����̌��݌����Ă���������A���X�ɉ��̕����Ɍ����܂��B

���o�[�W�����ł́A
���Ԃ�̓T�|�[�g���Ă��܂���B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_CameraOnNaviline.hsp</strong>
}html
�ɏ����܂����̂ŁA
�������������B

�܂��A���̃y�[�W�̍ŏ��ɏ����Ă���A
�J�����̎g�����̏����A���ǂ݂��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@�p�x�B
�@�@�����B

2. [IN] ���l�܂��́A�ϐ��@�F�@divnum
�@�@deg�x�̊p�x���A1/divnum���������āA
�@�@�J�������A�������Ɍ����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DCameraDirRight
�J�����̌��݌����Ă���������A���X�ɉE�̕����Ɍ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@deg
p2 : [IN] ���l�܂��́A�ϐ��@�F�@divnum

%inst
�J�����̌��݌����Ă���������A���X�ɉE�̕����Ɍ����܂��B

��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_CameraOnNaviline.hsp</strong>
}html
�ɏ����܂����̂ŁA
�������������B

�܂��A���̃y�[�W�̍ŏ��ɏ����Ă���A
�J�����̎g�����̏����A���ǂ݂��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@�p�x�B
�@�@�����B

2. [IN] ���l�܂��́A�ϐ��@�F�@divnum
�@�@deg�x�̊p�x���A1/divnum���������āA
�@�@�J�������A�E�����Ɍ����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DCameraDirLeft
�J�����̌��݌����Ă���������A���X�ɍ��̕����Ɍ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@deg
p2 : [IN] ���l�܂��́A�ϐ��@�F�@divnum

%inst
�J�����̌��݌����Ă���������A���X�ɍ��̕����Ɍ����܂��B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_CameraOnNaviline.hsp</strong>
}html
�ɏ����܂����̂ŁA
�������������B

�܂��A���̃y�[�W�̍ŏ��ɏ����Ă���A
�J�����̎g�����̏����A���ǂ݂��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@deg
�@�@�p�x�B
�@�@�����B

2. [IN] ���l�܂��́A�ϐ��@�F�@divnum
�@�@deg�x�̊p�x���A1/divnum���������āA
�@�@�J�������A�������Ɍ����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DCreateFont
�t�H���g���쐬���A�t�H���g�����ʂ���h�c���擾���܂��B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] ���l�܂��́A�ϐ��@�F�@height
p2 : [IN] ���l�܂��́A�ϐ��@�F�@width
p3 : [IN] ���l�܂��́A�ϐ��@�F�@weight
p4 : [IN] ���l�܂��́A�ϐ��@�F�@bItalic
p5 : [IN] ���l�܂��́A�ϐ��@�F�@bUnderline
p6 : [IN] ���l�܂��́A�ϐ��@�F�@bStrikeout
p7 : [IN] ������܂��́A������̕ϐ��@�F�@fontname
p8 : [OUT] �ϐ��@�F�@fontid

%inst
�t�H���g���쐬���A�t�H���g�����ʂ���h�c���擾���܂��B

��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_font.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@height
�@�@�t�H���g�̕����Z���܂��͕����̍�����_���P�ʂŎw�肵�܂��B
�@�@�����̍����Ƃ́A
�@�@�����Z���̍�������������f�B���O�i�A�N�Z���g�L���Ȃǂ̂��߂̃X�y�[�X�j��
�@�@���������������̂ł��B
�@�@�v�����ꂽ�T�C�Y�𒴂��Ȃ��ő�̃t�H���g��T���ď�������܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@width
�@�@�t�H���g�̕��ϕ�������_���P�ʂŎw�肵�܂��B
�@�@0 ���w�肷��ƁA�����ɍł��߂��l���I������܂��B
�@�@�����ɍł��߂��l�́A���p�\�Ȋe�t�H���g�̌��݂̃f�o�C�X�ł�
�@�@�c����ƃf�W�^�������ꂽ�c����̍��̐�Βl���r���邱�Ƃɂ��
�@�@���肳��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@weight
�@�@�t�H���g�̑�����\�� 0 ���� 1000 �܂ł͈͓̔��̒l���w�肵�܂��B
�@�@���Ƃ��΁A400 ���w�肷��ƕW���̑����ɂȂ�A
�@�@700 ���w�肷��Ƒ����ɂȂ�܂��B
�@�@0 ���w�肷��ƁA����̑������I������܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@bItalic
�@�@�Α̂ɂ��邩�ǂ������w�肵�܂��B
�@�@�P ���w�肷��ƁA�Α̂ɂȂ�܂��B 

5. [IN] ���l�܂��́A�ϐ��@�F�@bUnderline
�@�@������t���邩�ǂ������w�肵�܂��B
�@�@�P ���w�肷��ƁA�����t���ɂȂ�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@bStrikeout
�@�@����������t���邩�ǂ������w�肵�܂��B
�@�@�P ���w�肷��ƁA�����������t���܂��B

7. [IN] ������܂��́A������̕ϐ��@�F�@fontname
�@�@�t�H���g�̖��O�������� ��������w�肵�܂��B
�@�@������̒����́A 31 �����ȉ��ɂ��Ȃ���΂Ȃ�܂���B

8. [OUT] �ϐ��@�F�@fontid
�@�@�쐬�����t�H���g�����ʂ��邽�߂�
�@�@�ԍ����������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDrawTextByFontID
E3DCreateFont�ō쐬�����t�H���g�ɂ��A�w�肵���ʒu�A�F�ŁA�e�L�X�g��\�����܂��B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@fontid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p5 : [IN] ������܂��́A������̕ϐ��@�F�@textstr
p6 : [IN] ���l�܂��́A�ϐ��@�F�@a
p7 : [IN] ���l�܂��́A�ϐ��@�F�@r
p8 : [IN] ���l�܂��́A�ϐ��@�F�@g
p9 : [IN] ���l�܂��́A�ϐ��@�F�@b

%inst
E3DCreateFont�ō쐬�����t�H���g�ɂ��A�w�肵���ʒu�A�F�ŁA�e�L�X�g��\�����܂��B
\n�ŉ��s�ł��܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@fontid
�@�@E3DCreateFont�ō쐬�����A�t�H���g�̔ԍ����w�肵�܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@posx
4. [IN] ���l�܂��́A�ϐ��@�F�@posy
�@�@�e�L�X�g������ʒu���@�ix, y�j���iposx, posy�j�Ŏw�肵�܂��B

5. [IN] ������܂��́A������̕ϐ��@�F�@textstr
�@�@�\����������������w�肵�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@a
7. [IN] ���l�܂��́A�ϐ��@�F�@r
8. [IN] ���l�܂��́A�ϐ��@�F�@g
9. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�����̓����x�ƐF���i�����x, ��, ��, �j���ia, r, g, b�j��
�@�@�w�肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDrawTextByFontIDWithCnt
�J�E���^�[����ŁA���Ԋu�ŁA���X�ɕ������\�����܂��B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@fontid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p5 : [IN] ������܂��́A������̕ϐ��@�F�@textstr
p6 : [IN] ���l�܂��́A�ϐ��@�F�@a
p7 : [IN] ���l�܂��́A�ϐ��@�F�@r
p8 : [IN] ���l�܂��́A�ϐ��@�F�@g
p9 : [IN] ���l�܂��́A�ϐ��@�F�@b
p10 : [IN] ���l�܂��́A�ϐ��@�F�@eachcnt
p11 : [IN] ���l�܂��́A�ϐ��@�F�@curcnt

%inst
�J�E���^�[����ŁA���Ԋu�ŁA���X�ɕ������\�����܂��B

eachcnt�����ɁA�ꕶ��������̑ҋ@���Ԃ�
�w�肵�܂��B
���̒l�ƁAcurcnt�Ɏw�肵���J�E���^�[�̒l��
��r���āA������\�����܂��B

curcnt�ɂ́A�ʏ�A���̖��߂��Ăяo�����тɁA
�P��������J�E���^�[�̒l���w�肵�܂��B


�Ⴆ�΁Aeachcnt�ɂP�O���w�肵���ꍇ�ɂ́A
�ꕶ��������P�O�J�E���g�����ҋ@����̂ŁA
�P�����ڂ́Acurcnt���P�O�ɂȂ�܂ŕ\������܂���B
�Q�����ڂ́Acurcnt���Q�O�ɂȂ�܂ŕ\������܂���B

�ƁA���̂悤�ɁAcurcnt�̒l���A������ɏ]���āA
���X�ɁA�\���������������Ă����܂��B


���o�[�W�����ł́A���p�J�^�J�i�ɂ́A
�Ή����Ă��܂���B


��̓I�Ȏg�p��́A
e3dhsp3_fontWithCnt.hsp
�ɏ����܂����̂ŁA�������������B
\n�ŉ��s�ł��܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@fontid
�@�@E3DCreateFont�ō쐬�����A�t�H���g�̔ԍ����w�肵�܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@posx
4. [IN] ���l�܂��́A�ϐ��@�F�@posy
�@�@�e�L�X�g������ʒu���@�ix, y�j���iposx, posy�j�Ŏw�肵�܂��B

5. [IN] ������܂��́A������̕ϐ��@�F�@textstr
�@�@�\����������������w�肵�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@a
7. [IN] ���l�܂��́A�ϐ��@�F�@r
8. [IN] ���l�܂��́A�ϐ��@�F�@g
9. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�����̓����x�ƐF���i�����x, ��, ��, �j���ia, r, g, b�j��
�@�@�w�肵�܂��B

10. [IN] ���l�܂��́A�ϐ��@�F�@eachcnt
�@�@�ꕶ��������A�ǂꂭ�炢�҂��Ă���\�����邩���w�肵�܂��B

11. [IN] ���l�܂��́A�ϐ��@�F�@curcnt
�@�@���݂̃J�E���^�[���w�肵�܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DDrawTextByFontIDWithCnt2
�J�E���^�[����ŁA�������Ƃɕ\���^�C�~���O���w�肵�āA�������\�����܂��B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@fontid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p5 : [IN] ������܂��́A������̕ϐ��@�F�@textstr
p6 : [IN] ���l�܂��́A�ϐ��@�F�@a
p7 : [IN] ���l�܂��́A�ϐ��@�F�@r
p8 : [IN] ���l�܂��́A�ϐ��@�F�@g
p9 : [IN] ���l�܂��́A�ϐ��@�F�@b
p10 : [IN] �z��̕ϐ��@�F�@cntarray
p11 : [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
p12 : [IN] ���l�܂��́A�ϐ��@�F�@curcnt

%inst
�J�E���^�[����ŁA�������Ƃɕ\���^�C�~���O���w�肵�āA�������\�����܂��B


cntarray�����ɁA
�������Ƃ̕\���^�C�~���O���w�肵���z���
�w�肵�Ă��������B

cntarray�̒����́A
E3DGetCharacterNum�֐��ŁA
textstr�̕��������擾���āA���肵�Ă��������B


�g�r�o�ł́A�����񒆂ɁA'\n'�����������ꍇ�ɂ́A�����I�ɁA&quot;\r\n&quot;�ɕϊ������悤�ł��B
�܂�A���s�}�[�N�P�ɕt���A�P���������邱�ƂɂȂ�܂��̂ŁA�����ӂ��������B


cntarray���̕\���^�C�~���O�ƁA
curcnt�Ɏw�肵���J�E���^�[�̒l���ׂāA
������\�����邩�ǂ��������肵�܂��B


cntarray(0)�ɂP�O���A
cntarray(1)�ɂQ�O���w�肵���ꍇ�ɂ́A
curcnt���P�O�ɂȂ����Ƃ��ɂP�����ڂ��\������A
curcnt���Q�O�ɂȂ����Ƃ��ɂQ�����ڂ��\������܂��B

cntarray(1)��cntarray(0)��菬���Ȓl�����邱�Ƃ��\�ł��B
���̏ꍇ�́A�Q�����ڂ͂P�����ڂ�����ŁA
�\������邱�ƂɂȂ�܂��B

\n�𕶎��񒆂Ɋ܂ޏꍇ�́A
�����I�ɑ}�������\r�̕��̕\���^�C�~���O��
�w�肵�Ȃ��Ƃ����܂���̂ŁA�����ӂ��������B


���o�[�W�����ł́A���p�J�^�J�i�ɂ́A
�Ή����Ă��܂���B


��̓I�Ȏg�p��́A
e3dhsp3_fontWithCnt.hsp
�ɏ����܂����̂ŁA�������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@fontid
�@�@E3DCreateFont�ō쐬�����A�t�H���g�̔ԍ����w�肵�܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@posx
4. [IN] ���l�܂��́A�ϐ��@�F�@posy
�@�@�e�L�X�g������ʒu���@�ix, y�j���iposx, posy�j�Ŏw�肵�܂��B

5. [IN] ������܂��́A������̕ϐ��@�F�@textstr
�@�@�\����������������w�肵�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@a
7. [IN] ���l�܂��́A�ϐ��@�F�@r
8. [IN] ���l�܂��́A�ϐ��@�F�@g
9. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�����̓����x�ƐF���i�����x, ��, ��, �j���ia, r, g, b�j��
�@�@�w�肵�܂��B

10. [IN] �z��̕ϐ��@�F�@cntarray
�@�@���������̗v�f�������z��ϐ����w�肵�܂��B
�@�@���ꂼ��̗v�f�ɂ́A�����̕\���^�C�~���O���w�肵�܂��B

11. [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
�@�@cntarray���̗v�f�����w�肵�܂��B

12. [IN] ���l�܂��́A�ϐ��@�F�@curcnt
�@�@���݂̃J�E���^�[���w�肵�܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DGetCharacterNum
 �P�o�C�g�����A�Q�o�C�g�����𔻕ʂ��āAtextstr���̕��������擾���܂��B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2
p1 : [IN] ������܂��́A������̕ϐ��@�F�@textstr
p2 : [OUT] �ϐ��@�F�@charanum

%inst
 �P�o�C�g�����A�Q�o�C�g�����𔻕ʂ��āAtextstr���̕��������擾���܂��B


�g�r�o�ł́A�����񒆂ɁA'\n'�����������ꍇ�ɂ́A�����I�ɁA&quot;\r\n&quot;�ɕϊ������悤�ł��B
�܂�A���s�}�[�N�P�ɕt���A�P���������邱�ƂɂȂ�܂��̂ŁA�����ӂ��������B


���o�[�W�����ł́A���p�J�^�J�i�ɂ́A
�Ή����Ă��܂���B



������
1. [IN] ������܂��́A������̕ϐ��@�F�@textstr
�@�@���ׂ�����������w�肵�܂��B

2. [OUT] �ϐ��@�F�@charanum
�@�@�����̐����������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyFont
E3DCreateFont�ō쐬�����t�H���g���A
�폜���܂��B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@fontid

%inst
E3DCreateFont�ō쐬�����t�H���g���A
�폜���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@fontid
�@�@E3DCreateFont�ō쐬�����A�t�H���g�̔ԍ����w�肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSlerpQ
�N�H�[�^�j�I�����A���ʐ��`��Ԃ��܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@startqid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@endqid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@t
p4 : [IN] ���l�܂��́A�ϐ��@�F�@resqid

%inst
�N�H�[�^�j�I�����A���ʐ��`��Ԃ��܂��B

startqid, endqid, resqid �ɂ́A
E3DCreateQ �Ŏ擾�����A�h�c��n���Ă��������B

resqid�Ŏ��ʂ����N�H�[�^�j�I���ɁA
startqid, endqid�̊Ԃ̎p�����A
t �̔䗦�Ɋ�Â��ĕ�Ԍv�Z���A
�Z�b�g���܂��B

t �̒l���A0.0 ����1.0�̊ԂɂȂ�悤�ɁA�w�肵�Ă��������B

t ��0.0�̂Ƃ��́A
startqid�Ɠ����p�����Z�b�g����܂��B

t ��1.0�̂Ƃ��́A
endqid�Ɠ����p�����Z�b�g����܂��B

��̓I�Ȏg�����́A
html{
<strong>e3dhsp3_Spline.hsp</strong>
}html
���������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@startqid
2. [IN] ���l�܂��́A�ϐ��@�F�@endqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@startqid��endqid�̃N�H�[�^�j�I���̊Ԃ̎p�����A
�@�@��Ԍv�Z���āAresqid�̃N�H�[�^�j�I���ɃZ�b�g���܂��B


3. [IN] ���l�܂��́A�ϐ��@�F�@t
�@�@��Ԍv�Z����N�H�[�^�j�I����startqid����̔䗦���w�肵�Ă��������B
�@�@t �̒l�́A0.0����1.0�̊Ԃ̒l���w�肵�Ă��������B
�@�@�����B

4. [IN] ���l�܂��́A�ϐ��@�F�@resqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@�v�Z���ʂ��Aresqid�̃N�H�[�^�j�I���ɑ������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSquadQ
�N�H�[�^�j�I�����A�X�v���C����Ԃ��܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@befqid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@startqid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@endqid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@aftqid
p5 : [IN] ���l�܂��́A�ϐ��@�F�@t
p6 : [IN] ���l�܂��́A�ϐ��@�F�@resqid

%inst
�N�H�[�^�j�I�����A�X�v���C����Ԃ��܂��B

befqid, startqid, endqid, aftqid, resqid�ɂ́A
E3DCreateQ �Ŏ擾�����A�h�c��n���Ă��������B

resqid�Ŏ��ʂ����N�H�[�^�j�I���ɁA
startqid, endqid�̊Ԃ̎p�����A
t �̔䗦�Ɋ�Â��ĕ�Ԍv�Z���A
�Z�b�g���܂��B

befqid�ɂ́Astartqid�̈�O�̎p�����A
aftqid�ɂ́Aendqid�̈��̎p�����A
�Z�b�g���Ă����Ă��������B

���̊֐��́A�傫���p�����ω�����ꍇ�ɂ́A
�����Ă��܂���B
�傫���ω�����p����⊮����ꍇ�ɂ́A
E3DSlerpQ���g�p���Ă��������B
�܂��́A�Q��g�ݍ��킹�āA�g�p���Ă��������B


t �̒l���A0.0 ����1.0�̊ԂɂȂ�悤�ɁA�w�肵�Ă��������B

t ��0.0�̂Ƃ��́A
startqid�Ɠ����p�����Z�b�g����܂��B

t ��1.0�̂Ƃ��́A
endqid�Ɠ����p�����Z�b�g����܂��B


��̓I�Ȏg�����́A
html{
<strong>e3dhsp3_Spline.hsp</strong>
}html
���������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@befqid
2. [IN] ���l�܂��́A�ϐ��@�F�@startqid
3. [IN] ���l�܂��́A�ϐ��@�F�@endqid
4. [IN] ���l�܂��́A�ϐ��@�F�@aftqid

�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@startqid��endqid�̃N�H�[�^�j�I���̊Ԃ̎p�����A
�@�@��Ԍv�Z���āAresqid�̃N�H�[�^�j�I���ɃZ�b�g���܂��B

�@�@befqid�ɂ́Astartqid�̈�O�̎p�����A
�@�@aftqid�ɂ́Aendqid�̈��̎p�����A
�@�@�Z�b�g���Ă����Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@t
�@�@��Ԍv�Z����N�H�[�^�j�I����startqid����̔䗦���w�肵�Ă��������B
�@�@t �̒l�́A0.0����1.0�̊Ԃ̒l���w�肵�Ă��������B


6. [IN] ���l�܂��́A�ϐ��@�F�@resqid
�@�@�N�H�[�^�j�I�������ʂ���h�c
�@�@E3DCreateQ�Ŏ擾����id��n���Ă��������B
�@�@�v�Z���ʂ��Aresqid�̃N�H�[�^�j�I���ɑ������܂��B





�o�[�W���� : ver1.0.0.1

%index
E3DSplineVec

�ʒu���W���A�X�v���C����Ԍv�Z���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��@�F�@befpos
p2 : [IN] �ϐ��@�F�@startpos
p3 : [IN] �ϐ��@�F�@endpos
p4 : [IN] �ϐ��@�F�@aftpos
p5 : [IN] ���l�܂��́A�ϐ��@�F�@t
p6 : [OUT] �ϐ��@�F�@respos

%inst

�ʒu���W���A�X�v���C����Ԍv�Z���܂��B

befpos, startpos, endpos, aftpos, respos�ɂ́A
���ꂼ��A
ddim befpos, 3
ddim startpos, 3
ddim endpos, 3
ddim aftpos, 3
ddim respos, 3
�ŁA�m�ۂ����z���n���Ă��������B

�K���Adim�ł͂Ȃ��āAddim�Ń��������m�ۂ��Ă��������B


�z��̑�P�v�f�i�Ⴆ��befpos(0)�j�ɂ́A
�w���W�A
�z��̑�Q�v�f�i�Ⴆ��befpos(1)�j�ɂ́A
�x���W�A
�z��̑�R�v�f�i�Ⴆ��befpos(2)�j�ɂ́A
�y���W�A
���Z�b�g���Ă����Ă��������B


startpos��endpos�̊Ԃ̍��W���A
tv�̔䗦�Ɋ�Â��āA
�X�v���C����Ԍv�Z���āA
respos�ɑ�����܂��B

befpos�ɂ́Astartpos�̈�O�̍��W���A
aftpos�ɂ́Aendpos�̈��̍��W��
�Z�b�g���Ă����Ă��������B


t �̒l���A0.0 ����1.0�̊ԂɂȂ�悤�ɁA�w�肵�Ă��������B

t ��0.0�̂Ƃ��́A
startpos�Ɠ����ʒu���Z�b�g����܂��B

t ��1.0�̂Ƃ��́A
endpos�Ɠ����ʒu���Z�b�g����܂��B


��̓I�Ȏg�����́A
html{
<strong>e3dhsp3_Spline.hsp</strong>
}html
���������������B




������
1. [IN] �ϐ��@�F�@befpos
2. [IN] �ϐ��@�F�@startpos
3. [IN] �ϐ��@�F�@endpos
4. [IN] �ϐ��@�F�@aftpos
�@�@�v�Z�̌��ƂȂ�A�ʒu���W�̔z����w�肵�Ă��������B
�@�@�ڂ����́A���L���������������B
�@�@ddim�ō쐬���������^�z��B

5. [IN] ���l�܂��́A�ϐ��@�F�@t
�@�@��Ԍv�Z����ʒu���W��startpos����̔䗦���w�肵�Ă��������B
�@�@t �̒l�́A0.0����1.0�̊Ԃ̒l���w�肵�Ă��������B

6. [OUT] �ϐ��@�F�@respos
�@�@�v�Z���ʂ��A��������z����w�肵�Ă��������B
�@�@ddim�ō쐬���������^�z��B


�o�[�W���� : ver1.0.0.1

%index
E3DDbgOut
dbg.txt�ɁA�w�肵����������o�͂��܂��B
%group
Easy3D For HSP3 : �f�o�b�O

%prm
p1
p1 : [IN] ������܂��́A������ϐ��@�F�@dbgstr

%inst
dbg.txt�ɁA�w�肵����������o�͂��܂��B

���̖��߂��ĂԑO�ɁA
��񂾂�E3DEnableDbgFile��
�ĂԕK�v������܂��B




������
1. [IN] ������܂��́A������ϐ��@�F�@dbgstr
�@�@�o�͕�������w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DGetDiffuse
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Adiffuse�F���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@r
p5 : [OUT] �ϐ��@�F�@g
p6 : [OUT] �ϐ��@�F�@b

%inst
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Adiffuse�F���擾���܂��B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F���擾�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�F���擾���������_�̔ԍ����w�肵�܂��B

4. [OUT] �ϐ��@�F�@r
5. [OUT] �ϐ��@�F�@g
6. [OUT] �ϐ��@�F�@b
�@�@�@�w�肵�����_��diffuse�F���A
�@�@�@RGB = ( r, g, b )�ɑ������܂��B
�@�@�@r, g, b���ꂼ��A�O����Q�T�T�̒l���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetAmbient
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aambient�F���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@r
p5 : [OUT] �ϐ��@�F�@g
p6 : [OUT] �ϐ��@�F�@b

%inst
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aambient�F���擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F���擾�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�F���擾���������_�̔ԍ����w�肵�܂��B

4. [OUT] �ϐ��@�F�@r
5. [OUT] �ϐ��@�F�@g
6. [OUT] �ϐ��@�F�@b
�@�@�@�w�肵�����_��ambient�F���A
�@�@�@RGB = ( r, g, b )�ɑ������܂��B
�@�@�@r, g, b���ꂼ��A�O����Q�T�T�̒l���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetSpecular
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aspecular�F���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@r
p5 : [OUT] �ϐ��@�F�@g
p6 : [OUT] �ϐ��@�F�@b

%inst
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aspecular�F���擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F���擾�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�F���擾���������_�̔ԍ����w�肵�܂��B

4. [OUT] �ϐ��@�F�@r
5. [OUT] �ϐ��@�F�@g
6. [OUT] �ϐ��@�F�@b
�@�@�@�w�肵�����_��specular�F���A
�@�@�@RGB = ( r, g, b )�ɑ������܂��B
�@�@�@r, g, b���ꂼ��A�O����Q�T�T�̒l���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetAlpha
�C�ӂ̃p�[�c�̓����x���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@alpha

%inst
�C�ӂ̃p�[�c�̓����x���擾���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F���擾�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���̈����́A���ݎg�p����Ă��܂���B
�@�@�K���Ȑ��������Ă��������B

4. [OUT] �ϐ��@�F�@alpha
�@�@�w�肵���p�[�c�̓����x���A�O�`�Q�T�T�̒l�ő������܂��B


�o�[�W���� : ver1.0.0.1

%index
E3DSaveQuaFile
�ǂݍ��ݍς݂̃��[�V�������A�t�@�C���ɕۑ����܂��B
%group
Easy3D For HSP3 : �o��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mkid
p3 : [IN] ������܂��́A������ϐ��@�F�@filename
p4 : [IN] ���l�܂��́A�ϐ��@�F�@quatype

%inst
�ǂݍ��ݍς݂̃��[�V�������A�t�@�C���ɕۑ����܂��B

quatype�����Ńt�@�C���̃^�C�v���w�肵�܂��B
e3dhsp3.as�Œ�`����Ă���QUATYPE_ �Ŏn�܂�萔���g���܂��B
QUATYPE_NUM�̓{�[���̊K�w�\������v�Z�����ԍ�����Ƀt�@�C�������܂��B
QUATYPE_NAME�̓{�[���̖��O����Ƀt�@�C�������܂��B

ver5.0.3.8���O�̃o�[�W������qua�t�@�C����QUATYPE_NUM�ł��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@mkid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ۑ��t�@�C�����i�p�X�j���w�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@quatype
�@�@QUATYPE_ �Ŏn�܂�萔���w��B
�@�@�f�t�H���g�l��QUATYPE_NAME�B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.3.8�ň����ǉ�<BR>
      

%index
E3DSaveSigFile
�`��f�[�^��sig�t�@�C���ɕۑ����܂��B
%group
Easy3D For HSP3 : �o��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@filename

%inst
�`��f�[�^��sig�t�@�C���ɕۑ����܂��B
html{
<strong></strong>
}html



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ۑ��t�@�C�����i�p�X�j���w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1

%index
E3DSetMipMapParams
�~�b�v�}�b�v�̃p�����[�^��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@miplevels
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mipfilter

%inst
�~�b�v�}�b�v�̃p�����[�^��ݒ肵�܂��B

���̊֐����Ă񂾌�Ɏ��s�����
�S�Ă�E3DSigLoad�ɉe�����܂��B


���̖��߂���x���Ă΂Ȃ������ꍇ�́A
miplevel�ɂO�A
mipfilter��
D3DX_FILTER_TRIANGL|D3DX_FILTER_MIRROR
���w�肵���̂Ɠ����ɂȂ�܂��B





������

1. [IN] ���l�܂��́A�ϐ��@�F�@miplevels
�@�@�v�������~�b�v ���x���̐��B
�@�@���̒l�� 0 �܂��� D3DX_DEFAULT �̏ꍇ�́A
�@�@���S�ȃ~�b�v�}�b�v �`�F�[�����쐬����܂��B 

2. [IN] ���l�܂��́A�ϐ��@�F�@mipfilter
�@�@�C���[�W���t�B���^�����O������@�𐧌䂷�� 1 �ȏ�̃t���O�̑g�ݍ��킹�B
�@�@���̃p�����[�^�� D3DX_DEFAULT ���w�肷�邱�Ƃ́A
�@�@D3DX_FILTER_BOX ���w�肷�邱�ƂƓ������B 
�@�@�L���Ȃ��ꂼ��̃t�B���^�ɁA���̃t���O�� 1 ���܂܂�Ă��Ȃ���΂Ȃ�Ȃ��B

�@�@D3DX_FILTER_BOX 
�@�@�e�s�N�Z���́A�\�[�X �C���[�W���� 2 �~ 2 (�~ 2) �̃T�C�Y�̃{�b�N�X�Ɋ܂܂�
�@�@�s�N�Z���̕��ς��Z�o���邱�Ƃɂ��v�Z�����B
�@�@���̃t�B���^�́A�~�b�v�}�b�v���g�p����ꍇ�̂悤�ɁA
�@�@�]����̃f�B�����W�������\�[�X�̔����̏ꍇ�̂݋@�\����B 

�@�@D3DX_FILTER_LINEAR 
�@�@�e�]����s�N�Z���́A�ł��߂� 4 �̃s�N�Z�����\�[�X �C���[�W����T���v�����O
�@�@���邱�Ƃɂ��v�Z�����B
�@�@���̃t�B���^�́A�����̃X�P�[���� 2 �����̏ꍇ�ɍł������悭�@�\����B


�@�@D3DX_FILTER_NONE 
�@�@�X�P�[�����O�܂��̓t�B���^�����O���s��Ȃ��B
�@�@�\�[�X �C���[�W�̋��E�̊O���ɂ���s�N�Z���͓����ȍ��ł���ƌ��Ȃ����B


�@�@D3DX_FILTER_POINT 
�@�@�e�]����s�N�Z���́A�ł��߂��s�N�Z�����\�[�X �C���[�W����T���v�����O
�@�@���邱�Ƃɂ��v�Z�����B 

�@�@D3DX_FILTER_TRIANGLE 
�@�@�\�[�X �C���[�W���̊e�s�N�Z�����A�]����C���[�W�ɓ��������f�����B
�@�@����́A�ł������Ɏ��Ԃ̂�����t�B���^�ł���B 
�@�@����ɁAOR ���Z�q���g�p���āA�L���ȃt�B���^�Ƌ��Ɏ��Ɏ����I�v�V������
�@�@�t���O�� 0 �ȏ�w��ł���B 

�@�@D3DX_FILTER_MIRROR 
�@�@���̃t���O���w�肷��ƁAD3DX_FILTER_MIRROR_U�AD3DX_FILTER_MIRROR_V�A
�@�@����� D3DX_FILTER_MIRROR_W �t���O���w�肵�����ƂɂȂ�B 

�@�@D3DX_FILTER_MIRROR_U 
�@�@u ���̃e�N�X�`���̃G�b�W���痣�ꂽ�s�N�Z�����A���b�s���O�����Ƀ~���[�����O
�@�@����悤�w�肷��B 

�@�@D3DX_FILTER_MIRROR_V 
�@�@v ���̃e�N�X�`���̃G�b�W���痣�ꂽ�s�N�Z�����A
�@�@���b�s���O�����Ƀ~���[�����O����悤�w�肷��B 

�@�@D3DX_FILTER_MIRROR_W 
�@�@w ���̃e�N�X�`���̃G�b�W���痣��Ă���s�N�Z�����A
�@�@���b�s���O�����Ƀ~���[�����O����悤�w�肷��B 

�@�@D3DX_FILTER_DITHER 
�@�@���ʂƂ��č쐬���ꂽ�C���[�W���A4x4 �̏����t���f�B�U �A���S���Y��
�@�@���g���ăf�B�U�����O����K�v������B 


�o�[�W���� : ver1.0.0.1

%index
E3DPickVert
��ʏ�̂Q�c���W���w�肵�āA���̍��W�ɁA��ԋ߂����_�����o����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p5 : [IN] ���l�܂��́A�ϐ��@�F�@rangex
p6 : [IN] ���l�܂��́A�ϐ��@�F�@rangey
p7 : [OUT] �ϐ��@�F�@pickpartarray
p8 : [OUT] �ϐ��@�F�@pickvertarray
p9 : [IN] ���l�܂��́A�ϐ��@�F�@pickarrayleng
p10 : [OUT] �ϐ��@�F�@getnum

%inst
��ʏ�̂Q�c���W���w�肵�āA���̍��W�ɁA��ԋ߂����_�����o����֐��ł��B

�S���������W�̒��_�����������ꍇ�ɂ́A
�����̃p�[�c�A�����̒��_�̔ԍ���
�擾���邷��悤�ɂȂ��Ă��܂��B
�������W�ł��A�t�u�������Ⴄ���_�Ȃǂ�
���݂���̂ŁA�����擾�ł���悤�ɂȂ��Ă��܂��B

�擾�������̐����Agetnum�ɑ������܂��B
�Y������f�[�^�������ꍇ�́Agetnum�ɂO��
�������܂��B

getnum���O�o�Ȃ��ꍇ�ɂ́A
maxindex = getnum - 1�Ƃ����
pickpartarray(0) ����Apickpartarray(maxindex)
�܂łɁA�p�[�c�̔ԍ����������܂��B
pickvertarray(0)����Apickvertarray(maxindex)
�܂łɁA���_�̔ԍ����������܂��B


pickarrayleng�ϐ��ɁA
��x�Ɏ擾�ł�����̐����Z�b�g������A
html{
<strong>dim pickpartarray, pickarrayleng</strong>
}html
html{
<strong>dim pickvertarray, pickarrayleng</strong>
}html
�ŁA���������m�ۂ��Ă��������B

rangex, rangey�����𒲐����邱�ƂŁA
���o�̊��x�𒲐��ł��܂��B



���̊֐��̎g�p��́A
html{
<strong>e3dhsp3_pickvert.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@posx
4. [IN] ���l�܂��́A�ϐ��@�F�@posy
�@�@��ʏ�̂Q�c���W���iposx, posy�j�Ŏw�肵�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@rangex
6. [IN] ���l�܂��́A�ϐ��@�F�@rangey
�@�@���o�������w�肵�܂��B
�@�@rangex�ɂ́A�w���W���ǂꂾ�����ꂽ�_�܂Ō������邩���w�肵�܂��B
�@�@rangey�ɂ́A�x���W���ǂꂾ�����ꂽ�_�܂Ō������邩���w�肵�܂��B
�@�@�傫���l���w�肷��ƁA
�@�@�w�肵�����W��艓�����_�܂Ō������܂��B

�@�@���x�̒����Ɏg�p���Ă��������B

7. [OUT] �ϐ��@�F�@pickpartarray
8. [OUT] �ϐ��@�F�@pickvertarray
�@�@�w�肵�����W�Ɉ�ԋ߂��p�[�c�ԍ��ƁA
�@�@���_�̔ԍ���getnum�����A�������܂��B

9. [IN] ���l�܂��́A�ϐ��@�F�@pickarrayleng
�@�@pickpartarray, pickvertarray�̔z��̑傫�����w�肵�Ă��������B
�@�@dim ���߂Ŏg�p�����l��n���Ă��������B
�@�@�ڂ����́A���L���������������B

10. [OUT] �ϐ��@�F�@getnum
�@�@pickpartarray, pickvertarray�ɁA���̒l������������
�@�@�擾�ł��܂��B

�@�@�Ⴆ�΁Agetnum ���R�������ꍇ�ɂ́A
�@�@pickpartarray(0), pickpartarray(1), pickpartarray(2)�ɒl���������Ă��܂��B
�@�@


�o�[�W���� : ver1.0.0.1

%index
E3DGetCullingFlag
���̊֐��́A���݁A�@�\���Ă��܂���B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@viewcullflag
p5 : [OUT] �ϐ��@�F�@revcullflag

%inst
���̊֐��́A���݁A�@�\���Ă��܂���B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B


3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���ׂ������_�̔ԍ����w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@viewcullflag
�@�@����O�J�����O����Ă���Ƃ��P���A
�@�@����Ă��Ȃ��Ƃ��O���������܂��B

5. [OUT] �ϐ��@�F�@revcullflag
�@�@�w�ʃJ�����O����Ă���Ƃ��P���A
�@�@����Ă��Ȃ��Ƃ��O���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetOrgVertNo
mqo�t�@�C�����ł̒��_�ԍ����擾����B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@orgnoarray
p5 : [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
p6 : [OUT] �ϐ��@�F�@getnum

%inst
mqo�t�@�C�����ł̒��_�ԍ����擾����B

�p�[�c���̒��_�̐��́AE3DGetVertNumOfPart��vertnum�Ŏ擾����܂��B

E3D�̃v���O�����ł́A���_�̔ԍ��ɁA�O����(vertnum - 1)�̒��_�̔ԍ����g�p�ł��܂��B

���̒��_�̔ԍ��́A�\���p�̍œK����������́A���_�̔ԍ��ŁA
rok, mqo�t�@�C�����ł̒��_�̔ԍ��ƈقȂ�ꍇ������܂��B

���̊֐��́A�œK����̒��_�ԍ��ɑΉ�����Arok,mqo�t�@�C�����ł̒��_�̔ԍ����擾���܂��B

mqo�̏ꍇ�́A
mqo�t�@�C�����́A�p�[�c���Ƃ̒��_�̏o�����Ԃ�Ԃ��܂��B�i�O����n�܂鐔���j

rok�̏ꍇ�́A
rok�t�@�C�����́A�P����n�܂钸�_�̃C���f�b�N�X��Ԃ��܂��B
rok�̏ꍇ�́A�p�[�c���Ƃ̔ԍ��ł͂Ȃ��āA
���_�S�̂�ʂ��Ă̔ԍ��ł��̂�
���ӂ��Ă��������B


�w�肵�����_�Ɠ������W�������_�̔ԍ�����������̂ŁA�ꍇ�ɂ���ẮA�����擾����܂��B

���̊֐��́AE3D�̃v���O��������Aim2�t�@�C�������ۂȂǂɎg�p���邱�Ƃ�z�肵�āA���܂����B

�n�ʃf�[�^�ɂ͎g��Ȃ��ł��������B


���̊֐����g���O�ɁA
html{
<strong>E3DChkIM2Status�֐��ŁA������
�P���Ԃ���邱�Ƃ��m�F���Ă��������B</strong>
}html
�O���Ԃ��ꂽ�ꍇ�́Asig�t�@�C����V�����`���ɃR���o�[�g����K�v������܂��B
�R���o�[�^�[�ɂ��ẮA
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_im2file.htm )SigConvForIM2�̃y�[�W���������������B


orgarrayleng�ɁA�擾�ł�����̐����Z�b�g���āA
html{
<strong>dim orgnoarray, orgarrayleng</strong>
}html
�ŁA���������m�ۂ��Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B


3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���ׂ������_�̔ԍ����w�肵�Ă��������B


4. [OUT] �ϐ��@�F�@orgnoarray
�@�@���̔z��ɁA���f�[�^�̒��_�̔ԍ����������܂��B
�@�@maxindex = getnum - 1�Ƃ����
�@�@orgnoarray(0) ����Aorgnoarray(maxindex)�܂ł�
�@�@���_�̔ԍ����������܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
�@�@orgnoarray��dim�����Ƃ��́A�z��̑傫�����w�肵�Ă��������B


6. [OUT] �ϐ��@�F�@getnum
�@�@orgnoarray�ɑ���������̐����擾�ł��܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkIM2Status
�e���}�b�v���iim2�j���A���p�\���ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [OUT] �ϐ��@�F�@status

%inst
�e���}�b�v���iim2�j���A���p�\���ǂ����𒲂ׂ܂��B

status�����ɂP���Ԃ��ꂽ�ꍇ�́A
���p�\�B
�O���Ԃ��ꂽ�ꍇ�́A
���p�s�\�ł��B

�O���Ԃ��ꂽ�ꍇ�́Asig�t�@�C����V�����`���ɃR���o�[�g����K�v������܂��B
�R���o�[�^�[�ɂ��ẮA
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_im2file.htm )SigConvForIM2�̃y�[�W���������������B


E3DGetOrgVertNo, E3DLoadIM2File,
E3DSaveIM2File�֐��Ȃǂ��g�p����O�ɁA
����E3DChkIM2Status�֐��ŁA
�e���}�b�v�t�@�C���̋@�\���g���邩�ǂ�����
���ׂĂ��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c


2. [OUT] �ϐ��@�F�@status
�@�@�e���}�b�v��񂪁A���p�\���ǂ������������܂��B


�o�[�W���� : ver1.0.0.1

%index
E3DLoadIM2File
hsid�Ŏ��ʂ���郂�f���f�[�^�ɁAim2�t�@�C���̃{�[���e�������Z�b�g���܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@fname

%inst
hsid�Ŏ��ʂ���郂�f���f�[�^�ɁAim2�t�@�C���̃{�[���e�������Z�b�g���܂��B

���̊֐����g���O�ɁA
html{
<strong>E3DChkIM2Status�֐��ŁA������
�P���Ԃ���邱�Ƃ��m�F���Ă��������B</strong>
}html
�O���Ԃ��ꂽ�ꍇ�́Asig�t�@�C����V�����`���ɃR���o�[�g����K�v������܂��B
�R���o�[�^�[�ɂ��ẮA
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_im2file.htm )SigConvForIM2�̃y�[�W���������������B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@hsid�Ŏ��ʂ���郂�f���f�[�^�ɁA
�@�@im2�t�@�C���̃{�[���e�������Z�b�g���܂��B

2. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.im2 �̃p�X������B



�o�[�W���� : ver1.0.0.1

%index
E3DSaveIM2File
hsid�Ŏ��ʂ���郂�f���f�[�^�̉e���}�b�v�����Aim2�t�@�C���ɏ����o���܂��B
%group
Easy3D For HSP3 : �{�[���e���o��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@fname

%inst
hsid�Ŏ��ʂ���郂�f���f�[�^�̉e���}�b�v�����Aim2�t�@�C���ɏ����o���܂��B


���̊֐����g���O�ɁA
html{
<strong>E3DChkIM2Status�֐��ŁA������
�P���Ԃ���邱�Ƃ��m�F���Ă��������B</strong>
}html
�O���Ԃ��ꂽ�ꍇ�́Asig�t�@�C����V�����`���ɃR���o�[�g����K�v������܂��B
�R���o�[�^�[�ɂ��ẮA
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_im2file.htm )SigConvForIM2�̃y�[�W���������������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@hsid�Ŏ��ʂ���郂�f���f�[�^�̉e���}�b�v�����A
�@�@im2�t�@�C���ɏ����o���܂��B

2. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.im2 �̃p�X������B



�o�[�W���� : ver1.0.0.1

%index
E3DGetJointNum
�W���C���g�̑������擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [OUT] �ϐ��@�F�@jointnum

%inst
�W���C���g�̑������擾���܂��B

E3DGetJointInfo�ŏڍ׏����擾����ۂ́A
�z��f�[�^�̑傫���̌���ȂǂɁA
�g�p���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [OUT] �ϐ��@�F�@jointnum
�@�@�W���C���g�̑������A�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetJointInfo
�W���C���g�̏ڍ׏����A�ꊇ�擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@jointmaxnum
p3 : [OUT] ������̔z��ϐ��@�F�@jointname
p4 : [OUT] �z��ϐ��@�F�@jointinfo
p5 : [OUT] �ϐ��@�F�@jointgetnum

%inst
�W���C���g�̏ڍ׏����A�ꊇ�擾���܂��B

���̊֐����g�p����ɂ́A
�f�[�^�擾�p�̔z����Asdim, dim���߂��g���āA
�쐬����K�v������܂��B
�i�f�[�^�ɂ���āA�W���C���g�̑������ω�����̂ŁA���[�U�[���񑤂ŁA�f�[�^���𒲐�����K�v������܂��B�j


�܂��Ajointmaxnum�ϐ��ɁA
E3DGetJointNum�֐��ŁA
�W���C���g�̑������擾���Ă��������B

jointname�����́A
html{
<strong>sdim jointname, 256, jointmaxnum</strong>
}html
�ō쐬���Ă��������B

maxnameno = jointmaxnum - 1
�Ƃ���ƁA
jointname(0) ����Ajointname(maxnameno)
�ŁAjointmaxnum�̖��O�ɃA�N�Z�X�ł��܂��B


jointinfo�����́A
html{
<strong>dim jointinfo, JI_MAX, jointmaxnum</strong>
}html
�ō쐬���Ă��������B

html{
<strong>JI_* ��</strong>
}html�Ae3dhsp3.as��
�ŏ��̕��Œ�`����Ă���萔�ł��B
#define global JI_SERIAL 	0 
define global JI_NOTUSE	1
define global JI_PARENT	2
define global JI_CHILD		3
define global JI_BROTHER	4
define global JI_SISTER	5
define global JI_MAX		6

�̂悤�ɁA��`����Ă��܂��B
html{
<strong>�z��̃C���f�b�N�X�Ƃ��āA�g�p���Ă��������B</strong>
}html

html{
<strong>JI_SERIAL</strong>
}html�C���f�b�N�X�́A
�W���C���g�̃V���A���ԍ��ɃA�N�Z�X����Ƃ��ɁA
�g�p���܂��B
�W���C���g�̃V���A���ԍ��Ƃ́A
E3DGetPartNoByName ���邢�́A
E3DGetBoneNoByName�@
�Ŏ擾�ł���ԍ��Ɠ������̂ł��B

html{
<strong>JI_NOTUSE</strong>
}html�C���f�b�N�X�́A
�W���C���g�������ɂȂ��Ă��邩�ǂ�����
�t���O�ɃA�N�Z�X����Ƃ��ɁA�g�p���܂��B
�����ȂƂ��ɂP���A�L���ȂƂ��ɂO���������Ă��܂��B

html{
<strong>JI_PARENT, JI_CHILD,
JI_BROTHER, JI_SISTER</strong>
}html�C���f�b�N�X�́A
�W���C���g�̊K�w�\���ɃA�N�Z�X����Ƃ���
�g�p���܂��B
�ڂ����́A
(Link http://www5d.biglobe.ne.jp/~ochikko/e3dhsp_jointtree.htm )�W���C���g�̊K�w�\���̃y�[�W
���������������B

html{
<strong>JI_MAX</strong>
}html�́A
JI_�@�Ŏn�܂�萔�̌����`���Ă��܂��B
jointinfo��dim����Ƃ��Ɏg�p���܂��B



jointinfo�̓��e���Q�Ƃ���ꍇ�ɂ́A
�P�ڂ̃C���f�b�N�X�ɁA
JI_�Ŏn�܂�萔���w�肵�A
2�ڂ̃C���f�b�N�X�ɁA
���Ԗڂ̃W���C���g����\���ԍ�
�i�V���A���ԍ��ł͂���܂���j
���w�肵�܂��B
�Ⴆ�΁A3�Ԗڂ̃W���C���g�̃V���A���ԍ���
�A�N�Z�X�������Ƃ��ɂ́A
jointinfo(JI_SERIAL,2)
�Ə����܂��B

���l�ɁA�P�Ԗڂ̃W���C���g�̐e�̔ԍ���
�A�N�Z�X�������ꍇ�ɂ́A
jointinfo(JI_PARENT,0)
�Ə����܂��B


��̓I�Ȏg�p��́A�T���v����
html{
<strong>e3dhsp3_getjointinfo.hsp</strong>
}html���������������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@jointmaxnum
�@�@�f�[�^�擾�p�z��̑傫���i�W���C���g�̐��j���w�肵�܂��B

3. [OUT] ������̔z��ϐ��@�F�@jointname
�@�@���O�����擾���邽�߂̔z���n���Ă��������B
�@�@�E�ɏ��������@�ŁAsdim�����z���n���Ă��������B

4. [OUT] �z��ϐ��@�F�@jointinfo
�@�@�V���A���ԍ���A�K�w�\���Ȃǂ��擾���邽�߂̔z��ϐ���n���Ă��������B
�@�@�E�ɏ��������@�ŁAdim�����z���n���Ă��������B

5. [OUT] �ϐ��@�F�@jointgetnum
�@�@���̃W���C���g�̏����o�͂��������A�������܂��B
�@�@�ʏ�́Ajointmaxnum�Ɠ����l���擾����܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DGetFirstJointNo
���Βl�O�̃W���C���g�́A�V���A���ԍ����擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [OUT] �ϐ��@�F�@firstno

%inst
���Βl�O�̃W���C���g�́A�V���A���ԍ����擾���܂��B

�W���C���g�ԍ��̑��Βl�Ƃ́A
�{�[���t�@�C����Aim2�t�@�C���ȂǂŁA
�g�p���܂��B
�e�t�@�C���̐������������������B
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_bonefile.htm )�{�[���t�@�C���̃y�[�W
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_im2file.htm )im2�t�@�C���̃y�[�W





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [OUT] �ϐ��@�F�@firstno
�@�@���Βl�O�̃V���A���ԍ����A�������܂��B
�@�@


�o�[�W���� : ver1.0.0.1

%index
E3DGetDispObjNum
�\���p�I�u�W�F�N�g�̑������擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [OUT] �ϐ��@�F�@dispobjnum

%inst
�\���p�I�u�W�F�N�g�̑������擾���܂��B
E3DGetDispObjInfo�ŏڍ׏����擾����ۂ́A
�z��f�[�^�̑傫���̌���ȂǂɁA
�g�p���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [OUT] �ϐ��@�F�@dispobjnum
�@�@�\���I�u�W�F�N�g�̑������A�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetDispObjInfo

�\���I�u�W�F�N�g�̏ڍ׏����A�ꊇ�擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@dispobjmaxnum
p3 : [OUT] ������̔z��ϐ��@�F�@dispobjname
p4 : [OUT] �z��ϐ��@�F�@dispobjinfo
p5 : [OUT] �ϐ��@�F�@dispobjgetnum

%inst

�\���I�u�W�F�N�g�̏ڍ׏����A�ꊇ�擾���܂��B

���̊֐����g�p����ɂ́A
�f�[�^�擾�p�̔z����Asdim, dim���߂��g���āA
�쐬����K�v������܂��B
�i�f�[�^�ɂ���āA�\���I�u�W�F�N�g�̑������ω�����̂ŁA���[�U�[���񑤂ŁA�f�[�^���𒲐�����K�v������܂��B�j


�܂��Adispobjmaxnum�ϐ��ɁA
E3DGetDispObjInfo�֐��ŁA
�\���I�u�W�F�N�g�̑������擾���Ă��������B


dispobjname�����́A
html{
<strong>sdim dispobjname, 256, dispobjmaxnum</strong>
}html
�ō쐬���Ă��������B

maxnameno = dispobjmaxnum - 1
�Ƃ���ƁA
dispobjname(0) ����Adispobjname(maxnameno)
�ŁAdispobjmaxnum�̖��O�ɃA�N�Z�X�ł��܂��B


dispobjinfo�����́A
html{
<strong>dim dispobjinfo, DOI_MAX, dispobjmaxnum</strong>
}html
�ō쐬���Ă��������B

html{
<strong>DOI_* ��</strong>
}html�Ae3dhsp3.as�Œ�`����Ă���萔�ł��B
#define global DOI_SERIAL	0
define global DOI_NOTUSE	1
define global DOI_DISPSWITCH	2
#define global DOI_INVISIBLE 3
define global DOI_MAX		4

�̂悤�ɁA��`����Ă��܂��B
html{
<strong>�z��̃C���f�b�N�X�Ƃ��āA�g�p���Ă��������B</strong>
}html

html{
<strong>DOI_SERIAL</strong>
}html�C���f�b�N�X�́A
�\���I�u�W�F�N�g�̃V���A���ԍ��ɃA�N�Z�X����Ƃ��ɁA
�g�p���܂��B
�\���I�u�W�F�N�g�̃V���A���ԍ��Ƃ́A
E3DGetPartNoByName�@
�Ŏ擾�ł���ԍ��Ɠ������̂ł��B

html{
<strong>DOI_NOTUSE</strong>
}html�C���f�b�N�X�́A
�\���I�u�W�F�N�g�������ɂȂ��Ă��邩�ǂ�����
�t���O�ɃA�N�Z�X����Ƃ��ɁA�g�p���܂��B
�����ȂƂ��ɂP���A�L���ȂƂ��ɂO���������Ă��܂��B

html{
<strong>DOI_DISPSWITCH</strong>
}html�C���f�b�N�X�́A
�\���I�u�W�F�N�g�̃f�B�X�v���C�X�C�b�`�̔ԍ�
�ɃA�N�Z�X����Ƃ��Ɏg�p���܂��B
�f�B�X�v���C�X�C�b�`�́A
RokDeBone2�ŁA�p�[�c���Ƃɐݒ�\�ł��B
(Link http://www5d.biglobe.ne.jp/~ochikko/rdb2_dispswitch.htm )�f�B�X�v���C�X�C�b�`�̃y�[�W


html{
<strong>DOI_INVISIBLE</strong>
}html�C���f�b�N�X�́A
�\���I�u�W�F�N�g���\������Ă��邩�ǂ����̃t���O�ɃA�N�Z�X����Ƃ��Ɏg�p���܂��B
�ڂ����́A
E3DSetInvisibleFlag
�̐��������ǂ݂��������B


html{
<strong>DOI_MAX</strong>
}html�́A
DOI_�@�Ŏn�܂�萔�̌����`���Ă��܂��B
dispobjinfo��dim����Ƃ��Ɏg�p���܂��B


dispobjinfo�̓��e���Q�Ƃ���ꍇ�ɂ́A
�P�ڂ̃C���f�b�N�X�ɁA
DOI_�Ŏn�܂�萔���w�肵�A
2�ڂ̃C���f�b�N�X�ɁA
���Ԗڂ̕\���I�u�W�F�N�g����\���ԍ�
�i�V���A���ԍ��ł͂���܂���j
���w�肵�܂��B

�Ⴆ�΁A3�Ԗڂ̕\���I�u�W�F�N�g�̃V���A���ԍ���
�A�N�Z�X�������Ƃ��ɂ́A
dispobjinfo(DOI_SERIAL, 2)
�Ə����܂��B

���l�ɁA�P�Ԗڂ̕\���I�u�W�F�N�g��
�f�B�X�v���C�X�C�b�`�ԍ��ɁA
�A�N�Z�X�������ꍇ�ɂ́A
jointinfo(DOI_DISPSWITCH, 0)
�Ə����܂��B



��̓I�Ȏg�p��́A�T���v����
html{
<strong>e3dhsp3_getjointinfo.hsp</strong>
}html���������������B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@dispobjmaxnum
�@�@�f�[�^�擾�p�z��̑傫���i�\���I�u�W�F�N�g�̐��j���w�肵�܂��B

3. [OUT] ������̔z��ϐ��@�F�@dispobjname
�@�@���O�����擾���邽�߂̔z���n���Ă��������B
�@�@�E�ɏ��������@�ŁAsdim�����z���n���Ă��������B

4. [OUT] �z��ϐ��@�F�@dispobjinfo
�@�@�V���A���ԍ��Ȃǂ��擾���邽�߂̔z��ϐ���n���Ă��������B
�@�@�E�ɏ��������@�ŁAdim�����z���n���Ă��������B

5. [OUT] �ϐ��@�F�@dispobjgetnum
�@�@���̕\���I�u�W�F�N�g�̏����o�͂��������A�������܂��B
�@�@�ʏ�́Adispobjmaxnum�Ɠ����l���擾����܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DEnableTexture
�ꎞ�I�ɁA�e�N�X�`���[�\�����I���I�t����֐��ł��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@enableflag

%inst
�ꎞ�I�ɁA�e�N�X�`���[�\�����I���I�t����֐��ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ��i�V���A���ԍ��j

3. [IN] �ϐ��܂��́A���l�@�F�@enableflag
�@�@�e�N�X�`���[���I�t�ɂ���Ƃ��ɂ͂O���A
�@�@�I���ɂ���Ƃ��ɂ͂P���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DJointAddToTree
�p�[�c�ɐe�q�֌W��ݒ肵�܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@parentjoint
p3 : [IN] �ϐ��܂��́A���l�@�F�@childjoint
p4 : [IN] �ϐ��܂��́A���l�@�F�@lastflag

%inst
�p�[�c�ɐe�q�֌W��ݒ肵�܂��B
childjoint��parentjoint�̎q���Ƃ��āA
�ݒ肵�܂��B

lastflag���O�̂Ƃ��́A���j�Ƃ��Ēǉ�����A
�P�̂Ƃ��́A�����q�Ƃ��Ēǉ�����܂��B

�W���C���g�ȊO�ɁA�e�q�֌W��ݒ肵�Ă��A
���o�[�W�����ł́A�Ӗ�������܂���B

childjoint, parentjoint�́A
E3DGetPratNoByName�܂��́A
E3DGetJointInfo�Ŏ擾�����ԍ���
�g�p���Ă��������B

E3DJointRemake���߂����ǂ݂��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ԍ�

2. [IN] �ϐ��܂��́A���l�@�F�@parentjoint
3. [IN] �ϐ��܂��́A���l�@�F�@childjoint
�@�@parentjoint�̎q���Ƃ��āAchildjoint��ݒ肵�܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@lastflag
�@�@�O���w�肷���parentjoint�̒��j�Ƃ��āA
�@�@�P���w�肷���parentjoint�̖����q�Ƃ��Đݒ肳��܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DJointRemoveFromParent
�p�[�c�̐e�q�֌W����菜���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@rmjoint

%inst
�p�[�c�̐e�q�֌W����菜���܂��B

rmjoint�Ŏw�肵���p�[�c�ƁA
���̐e�̃p�[�c�Ƃ̊֌W��؂藣���܂��B

rmjoint�̎q���̏��́A���̂܂܎c��܂��B

�W���C���g�ȊO�ɁA�e�q�֌W��ݒ肵�Ă��A
���o�[�W�����ł́A�Ӗ�������܂���B


���̖��߂ŁA�e�����݂��Ȃ��܂܁A
E3DSaveSigFile�Ńt�@�C���ɕۑ�����ƁA
���̃t�@�C���́A�ǂݍ��݂ł��Ȃ��Ȃ�܂��B

�ŏI�I�ɂ́AE3DJointAddToTree�ŁA
�K���A�e��ݒ肷��悤�ɂ��Ă��������B

��Ԑe�̃W���C���g�ɂ������ꍇ�ɂ́A
�W���C���g�ł͂Ȃ��t�H���_�I�Ȗ��������Ă���p�[�c�̔ԍ����擾���āA
�����e�ɐݒ肵�Ă��������B


rmjoint�́A
E3DGetPratNoByName�܂��́A
E3DGetJointInfo�Ŏ擾�����ԍ���
�g�p���Ă��������B

E3DJointRemake���߂����ǂ݂��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ԍ�

2. [IN] �ϐ��܂��́A���l�@�F�@rmjoint
�@�@rmjoint�ƁA���̐e�̊֌W��؂藣���܂��B


�o�[�W���� : ver1.0.0.1

%index
E3DJointRemake
�e�q�֌W��A�L�������̕ύX���AEasy3D�����̊֘A�f�[�^�ɔ��f�����܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
�e�q�֌W��A�L�������̕ύX���AEasy3D�����̊֘A�f�[�^�ɔ��f�����܂��B

��A�́AE3DJointAddToTree��
E3DJointRemoveFromParent���߂�
E3DSetValidFlag��
�Ăяo������ɁA���A�Ăяo���Ă��������B






������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DSigImport
hsid�ɓǂݍ��ݍς̌`��f�[�^�ɁA
filename�Ŏw�肵���`��f�[�^��
�C���|�[�g���܂��B
%group
Easy3D For HSP3 : �`��f�[�^

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@mult
p5 : [IN] �ϐ��܂��́A���l�@�F�@offsetx
p6 : [IN] �ϐ��܂��́A���l�@�F�@offsety
p7 : [IN] �ϐ��܂��́A���l�@�F�@offsetz
p8 : [IN] �ϐ��܂��́A���l�@�F�@rotx
p9 : [IN] �ϐ��܂��́A���l�@�F�@roty
p10 : [IN] �ϐ��܂��́A���l�@�F�@rotz

%inst
hsid�ɓǂݍ��ݍς̌`��f�[�^�ɁA
filename�Ŏw�肵���`��f�[�^��
�C���|�[�g���܂��B

html{
<strong>���̖��߂��ĂԂƁA
�ǂݍ��ݍς̃��[�V�����f�[�^���j������܂��B

</strong>
}html



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ԍ�

2. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@�C���|�[�g����*.sig �̃p�X������B

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


4. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�{���̒l���w�肵�Ă��������B
�@�@�f�t�H���g��1.0�ł��B
�@�@���{�́A�P�D�O�B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@offsetx
6. [IN] �ϐ��܂��́A���l�@�F�@offsety
7. [IN] �ϐ��܂��́A���l�@�F�@offsetz
�@�@�ǂݍ��݈ʒu�̃I�t�Z�b�g���W���A
�@�@�ioffsetx, offsety, offsetz�j�Ŏw�肵�܂��B
�@�@���[�J�����W�Ŏw�肵�܂��B
�@�@�����B

8. [IN] �ϐ��܂��́A���l�@�F�@rotx
9. [IN] �ϐ��܂��́A���l�@�F�@roty
10. [IN] �ϐ��܂��́A���l�@�F�@rotz
�@�@�ǉ��`����A�w�C�x�C�y���ꂼ��̎��ɑ΂��āA
�@�@rotx, roty, rotz�x�����A��]���Ă���A
�@�@�C���|�[�g���s���܂��B
�@�@��]�����́A�y�C�x�C�w�̏��Ԃł��B
�@�@�����B

�p�����[�^�̓K�p�����́A
�܂��A�{�����|���āA
���ɁA��]�����āA
�Ō�ɁA�ړ����܂��B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DSigLoadFromBuf
����������`��f�[�^�̃��[�h���s���܂��B
%group
Easy3D For HSP3 : �`��f�[�^

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ������܂��́A������̕ϐ��@�F�@resdir
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p4 : [OUT] �ϐ��@�F�@hsid
p5 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p6 : [IN] �ϐ��܂��́A���l�@�F�@mult

%inst
����������`��f�[�^�̃��[�h���s���܂��B
���������ɂ́Asig�t�@�C���Ɠ����t�H�[�}�b�g��
�����Ă���Ƃ݂Ȃ��āA�������܂��B

�e�N�X�`���t�@�C���́A�ʏ�Ǎ��Ɠ��l�ɁA
�t�@�C������s���܂��B

resdir�ɂ́A�e�N�X�`���̑��݂���t�H���_�̃p�X���w�肵�Ă��������B
html{
<strong>�Ō�ɁA&quot;\\&quot;��t����̂�Y��Ȃ��ł��������B</strong>
}html

�Ⴆ�΁A
resdir = &quot;C:\\hsp\\Meida\\&quot;
��
resdir = dir_cur + &quot;\\&quot;
�Ȃǂ̂悤�Ɏw�肵�Ă��������B




������
1. [IN] ������܂��́A������̕ϐ��@�F�@resdir
�@�@�e�N�X�`���[�̂���t�H���_ �̃p�X������B
�@�@�Ō�ɁA&quot;\\&quot;���K�v�B

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

3. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

4. [OUT] �ϐ��@�F�@hsid
�@�@�ǂݍ��񂾌`��f�[�^�����ʂ���hsid

5. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


6. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�{���̒l���w�肵�Ă��������B
�@�@�f�t�H���g��1.0�ł��B
�@�@���{�͂P�D�O�B
�@�@�����B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DSigImportFromBuf
����������A�`��f�[�^�̃C���|�[�g���s���܂��B
%group
Easy3D For HSP3 : �`��f�[�^

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@resdir
p3 : [IN] �ϐ��@�F�@buf
p4 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p5 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p6 : [IN] �ϐ��܂��́A���l�@�F�@mult
p7 : [IN] �ϐ��܂��́A���l�@�F�@offsetx
p8 : [IN] �ϐ��܂��́A���l�@�F�@offsety
p9 : [IN] �ϐ��܂��́A���l�@�F�@offsetz
p10 : [IN] �ϐ��܂��́A���l�@�F�@rotx
p11 : [IN] �ϐ��܂��́A���l�@�F�@roty
p12 : [IN] �ϐ��܂��́A���l�@�F�@rotz

%inst
����������A�`��f�[�^�̃C���|�[�g���s���܂��B
���������ɂ́Asig�t�@�C���Ɠ����t�H�[�}�b�g��
�����Ă���Ƃ݂Ȃ��āA�������܂��B

�e�N�X�`���t�@�C���́A�ʏ�Ǎ��Ɠ��l�ɁA
�t�@�C������s���܂��B

resdir�ɂ́A�e�N�X�`���̑��݂���t�H���_�̃p�X���w�肵�Ă��������B
html{
<strong>�Ō�ɁA&quot;\\&quot;��t����̂�Y��Ȃ��ł��������B</strong>
}html





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���hsid

2. [IN] ������܂��́A������̕ϐ��@�F�@resdir
�@�@�e�N�X�`���[�̂���t�H���_ �̃p�X������B
�@�@�Ō�ɁA&quot;\\&quot;���K�v�B

3. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

4. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���


5. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O
�@�@���K������ꍇ�͂P���w��
�@�@���Ȃ��ꍇ�͂O���w��

6. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�{���̒l���w�肵�Ă��������B
�@�@�f�t�H���g�͂P�D�O�ł��B
�@�@���{�͂P�D�O�B
�@�@�����B

7. [IN] �ϐ��܂��́A���l�@�F�@offsetx
8. [IN] �ϐ��܂��́A���l�@�F�@offsety
9. [IN] �ϐ��܂��́A���l�@�F�@offsetz
�@�@�ǂݍ��݈ʒu�̃I�t�Z�b�g���W���A
�@�@�ioffsetx, offsety, offsetz�j�Ŏw�肵�܂��B
�@�@���[�J�����W�Ŏw�肵�܂��B
�@�@�����B

10. [IN] �ϐ��܂��́A���l�@�F�@rotx
11. [IN] �ϐ��܂��́A���l�@�F�@roty
12. [IN] �ϐ��܂��́A���l�@�F�@rotz
�@�@�ǉ��`����A�w�C�x�C�y���ꂼ��̎��ɑ΂��āA
�@�@rotx, roty, rotz�x�����A��]���Ă���A
�@�@�C���|�[�g���s���܂��B
�@�@��]�����́A�y�C�x�C�w�̏��Ԃł��B
�@�@�����B

�p�����[�^�̓K�p�����́A
�܂��A�{�����|���āA
���ɁA��]�����āA
�Ō�ɁA�ړ����܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DAddMotionFromBuf
���������烂�[�V�����f�[�^�̃��[�h���s���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@datakind
p3 : [IN] �ϐ��@�F�@buf
p4 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p5 : [OUT] �ϐ��@�F�@mk
p6 : [OUT] �ϐ��@�F�@maxframe
p7 : [IN] �ϐ��܂��́A���l�@�F�@mvmult

%inst
���������烂�[�V�����f�[�^�̃��[�h���s���܂��B
���������ɂ́Aqua�܂���mot�t�@�C����
�����t�H�[�}�b�g�������Ă���Ƃ݂Ȃ��āA
�������܂��B

qua�f�[�^�̓ǂݍ��ݎ��́A
datakind�ɂO���w�肵�A
mot�f�[�^�̓ǂݍ��ݎ��ɂ́A
datakind�ɂP���w�肵�Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���hsid

2. [IN] �ϐ��܂��́A���l�@�F�@datakind
�@�@qua�f�[�^�̎��͂O���A
�@�@mot�f�[�^�̎��͂P���w�肵�Ă��������B

3. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

4. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

5. [OUT] �ϐ��@�F�@mk
�@�@�ǂݍ��񂾃��[�V���������ʂ���ԍ�

6. [OUT] �ϐ��@�F�@maxframe
�@�@�ǂݍ��񂾃��[�V�����̍ő�t���[���ԍ�
�@�@�i���t���[���� - 1 �Ɠ����j

7. [IN] �ϐ��܂��́A���l�@�F�@mvmult
�@�@���[�V�����̈ړ������Ɋ|����{��
�@�@�ȗ�����ƂP�D�O
�@�@����




�o�[�W���� : ver1.0.0.1<BR>
      ver4.0.1.6�ň����ǉ�<BR>
      

%index
E3DCheckFullScreenParams
�t���X�N���[���̃p�����[�^���`�F�b�N���A�^���������ɋ߂��p�����[�^���擾���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] ���l�܂��́A�ϐ��@�F�@screenw
p2 : [IN] ���l�܂��́A�ϐ��@�F�@screenh
p3 : [IN] ���l�܂��́A�ϐ��@�F�@bits
p4 : [OUT] �ϐ��@�F�@validflag
p5 : [OUT] �ϐ��@�F�@validw
p6 : [OUT] �ϐ��@�F�@validh
p7 : [OUT] �ϐ��@�F�@validbits
p8 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�t���X�N���[���̃p�����[�^���`�F�b�N���A�^���������ɋ߂��p�����[�^���擾���܂��B

validflag�ɂP���Ԃ��ꂽ�ꍇ�̂݁A
validw, validh, validbits�̒l�͗L���ł��B

validflag�ɂO���Ԃ��ꂽ�ꍇ�ɂ́A
�E�C���h�E�̑傫���Ȃǂ̏�����ς��āA
�L���ȃp�����[�^���擾�ł���܂ŁA
�J��Ԃ��A���̖��߂��Ăяo���Ă��������B


���̖��߂́AE3DInit�����O�ɌĂԂ��Ƃ�O��ɂ��Ă��܂��B

���̖��߂ŁA�擾����validw��validh�ŃE�C���h�E���쐬������iscreen���߂�bgscr���߂ȂǂŁj�A
E3DInit��bits������validbits���w�肵�āA�t���X�N���[�����������Ă��������B


��̓I�Ȏg�p��́A
e3dhsp3_fullscreen.hsp
�ɏ����܂����̂ŁA�������������B

ver5.3.1.3��flag�����ǉ��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@screenw
2. [IN] ���l�܂��́A�ϐ��@�F�@screenh
3. [IN] ���l�܂��́A�ϐ��@�F�@bits
�@�@�g�p�������t���X�N���[���̃p�����[�^���w�肵�܂��B
�@�@screenw�ɃX�N���[���̕�
�@�@screenh�ɃX�N���[���̍���
�@�@bits�ɐF���������r�b�g�����w�肵�܂��B

4. [OUT] �ϐ��@�F�@validflag
�@�@screenw, screenh, bits�Ŏw�肵���p�����[�^�ɋ߂�
�@�@�t���X�N���[�������邱�Ƃ����������ꍇ�ɁA
�@�@�P���Z�b�g����܂��B

�@�@�^����ꂽ�p�����[�^�ł́A�t���X�N���[�������Ȃ����Ƃ�
�@�@���������ꍇ�ɂ́A�O���Z�b�g����܂��B

5. [OUT] �ϐ��@�F�@validw
6. [OUT] �ϐ��@�F�@validh
7. [OUT] �ϐ��@�F�@validbits
�@�@�t���X�N���[���̍쐬�ɗL���ȃp�����[�^���Ԃ���܂��B
�@�@screenw, screenh, bits�Ŏw�肵�����̂Ƃ́A
�@�@�����A�قȂ�ꍇ������܂��B

�@�@�����̒l�́Avalidflag�ɂP���������Ă���Ƃ��̂ݗL���ł��B

8. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@���F�c���S�F�R�̃E�C���h�E�T�C�Y�Ɏ����I�ɒ����������ꍇ�͂P���w�肵�܂��B
�@�@�����@�\���I�t�ɂ���screenw, screenh�������̂܂܂̒l�Ŕ��肷��ɂ͂Q���w�肵�܂��B
�@�@�f�t�H���g�l�͂P�ł��B
�@�@flag�ɂQ���w�肵���ꍇ��E3DInit��fullscreenflag�ɂ��Q���w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.1.3�Ŋg��

%index
E3DGetMaxMultiSampleNum
�A���`�G�C���A�X�ɕK�v�ȁA�}���`�T���v���̐��̍ő�l���擾���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@bits
p2 : [IN] ���l�܂��́A�ϐ��@�F�@iswindowmode
p3 : [OUT] �ϐ��@�F�@maxmultisamplenum

%inst
�A���`�G�C���A�X�ɕK�v�ȁA�}���`�T���v���̐��̍ő�l���擾���܂��B

���̊֐��́AE3DInit�����O�ɌĂяo�����Ƃ�
�z�肵�Ă��܂��B

E3DInit�ɓn��multisamplenum�̒l�̌����
�g�p���Ă��������B


��̓I�Ȏg�p��́A
e3dhsp3_antialias.hsp
�ɏ����܂����̂ŁA�������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@bits
�@�@�F�������߂�r�b�g�����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@iswindowmode
�@�@�E�C���h�E���[�h�̎��͂P��
�@�@�t���X�N���[���̎��͂O���w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@maxmultisamplenum
�@�@�}���`�T���v���̐��̎w��ɗL���ȁA�ő�̒l�������܂��B
�@�@�O�܂��́A�Q����P�U�̒l���������܂��B
�@�@�n�[�h�E�F�A�ɂ���āA�قȂ�l���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfLineAndFace
�C�ӂ̐����ƁAsig�̖ʂƂ̓����蔻������܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17
p1 : [IN] ���l�܂��́A�ϐ��@�F�@posx1
p2 : [IN] ���l�܂��́A�ϐ��@�F�@posy1
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posz1
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posx2
p5 : [IN] ���l�܂��́A�ϐ��@�F�@posy2
p6 : [IN] ���l�܂��́A�ϐ��@�F�@posz2
p7 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p8 : [IN] ���l�܂��́A�ϐ��@�F�@needtrans
p9 : [OUT] �ϐ��@�F�@partno
p10 : [OUT] �ϐ��@�F�@faceno
p11 : [OUT] �ϐ��@�F�@confx
p12 : [OUT] �ϐ��@�F�@confy
p13 : [OUT] �ϐ��@�F�@confz
p14 : [OUT] �ϐ��@�F�@nx
p15 : [OUT] �ϐ��@�F�@ny
p16 : [OUT] �ϐ��@�F�@nz
p17 : [OUT] �ϐ��@�F�@revfaceflag

%inst
�C�ӂ̐����ƁAsig�̖ʂƂ̓����蔻������܂��B

���̓����蔻��́A
hsid�Ŏw�肵���f�[�^�̃{�[���ό`���A
�K�v�ɂȂ�܂��B

�ł����A�����|�[�Y�ŉ���������蔻����s���ꍇ�Ȃǂɂ́A���������{�[���ό`���v�Z�������Ȃ����������ł��B
needtrans�ɂO���w�肷��ƁA
�{�[���ό`�v�Z���ȗ����邱�Ƃ��o���܂��B
�i�|�[�Y���ς�����ꍇ��A
�J�����ʒu��ς����ꍇ�ɂ́A
needtrans���P�ɂ��Ă��������B�j


�����ƖʂƂ̓�����E3DChkConfLineAndFace�́A���\�A�d�������ł��B
�ł��̂ŁA�o���邾���A�Ăяo���񐔂�
���Ȃ�����悤�ɐS�����Ă��������B
�Ăяo���񐔂����Ȃ����邽�߂̍H�v�Ƃ��āA
�܂��AE3DChkConflict�ŁA
���������ςȓ����蔻����s���A
E3DChkConflict�ŁA�������Ă���Ɣ��肳�ꂽ�Ƃ��̂݁A
E3DChkConfLineAndFace���Ăяo���A
�Ȃǂ̕��@���L���ł��B

E3DChkInView����ŌĂяo���Ă��������B

��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_ConfLineAndFace.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B





������

1. [IN] ���l�܂��́A�ϐ��@�F�@posx1
2. [IN] ���l�܂��́A�ϐ��@�F�@posy1
3. [IN] ���l�܂��́A�ϐ��@�F�@posz1

4. [IN] ���l�܂��́A�ϐ��@�F�@posx2
5. [IN] ���l�܂��́A�ϐ��@�F�@posy2
6. [IN] ���l�܂��́A�ϐ��@�F�@posz2

�������A�iposx1, posy1, posz1�j�ƁA(posx2, posy2, posz2)��
�w�肵�Ă��������B
�@�@�����B

7. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f���f�[�^�����ʂ���h�c

8. [IN] ���l�܂��́A�ϐ��@�F�@needtrans
�@�@�{�[���ό`�v�Z�����邩�ǂ����̃t���O
�@�@�ڂ����́A���L���������������B

9. [OUT] �ϐ��@�F�@partno
10. [OUT] �ϐ��@�F�@faceno
�@�@������hsid�̃��f�����Փ˂��Ă����ꍇ�ɁA
�@�@�Փ˂����p�[�c�̔ԍ��ƁA�ʂ̔ԍ����������܂��B
�@�@�Փ˂��Ă��Ȃ������ꍇ�́A-1���������܂��B

11. [OUT] �ϐ��@�F�@confx
12. [OUT] �ϐ��@�F�@confy
13. [OUT] �ϐ��@�F�@confz
�@�@�Փ˂��Ă����ꍇ�ɁA�Փ˂������W���������܂��B
�@�@�����^�̕ϐ��B

14. [OUT] �ϐ��@�F�@nx
15. [OUT] �ϐ��@�F�@ny
16. [OUT] �ϐ��@�F�@nz
�@�@�Փ˂��Ă����ꍇ�ɁA�Փ˂���hsid�̖ʂ̖@���x�N�g�����������܂��B
�@�@�����^�̕ϐ��B

17. [OUT] �ϐ��@�F�@revfaceflag
�@�@�Փ˂��Ă����ʂ����ʂ������ꍇ�A�P���������܂��B
�@�@�\�ʂ������ꍇ�́A�O���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DPickFace
�Q�c�̉�ʂ̍��W�ɑΉ�����A�R�c���f���̍��W���擾�ł��܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@pos2x
p4 : [IN] ���l�܂��́A�ϐ��@�F�@pos2y
p5 : [IN] ���l�܂��́A�ϐ��@�F�@maxdist
p6 : [OUT] �ϐ��@�F�@partno
p7 : [OUT] �ϐ��@�F�@faceno
p8 : [OUT] �ϐ��@�F�@pos3x
p9 : [OUT] �ϐ��@�F�@pos3y
p10 : [OUT] �ϐ��@�F�@pos3z
p11 : [OUT] �ϐ��@�F�@nx
p12 : [OUT] �ϐ��@�F�@ny
p13 : [OUT] �ϐ��@�F�@nz
p14 : [OUT] �ϐ��@�F�@dist
p15 : [IN] ���l�܂��́A�ϐ��@�F�@calcmode

%inst
�Q�c�̉�ʂ̍��W�ɑΉ�����A�R�c���f���̍��W���擾�ł��܂��B

�}�E�X�ŃN���b�N�����ꏊ�ɁA
�R�c�I�u�W�F�N�g���ړ������邱�ƂȂǂɎg�p���Ă��������B

E3DPickVert���A�R�c���f���̒��_�𒊏o����̂ɑ΂��A
E3DPickFace�́A�R�c���f���̖ʂ𒊏o���A
�Q�c���W�ɑΉ�����ʏ�̂R�c���W���擾���܂��B

maxdist �ɂ���āA�ǂ̂��炢�����܂�
�������邩���w��ł��܂��B
maxdist�̒l������������قǁA
�����͍����ɂȂ�܂��B



html{
<strong>�v�Z�ɂ́AE3DChkInView�̌��ʂ�
�g�p���Ă��܂��B
</strong>
}html

��̓I�Ȏg�p��́A
e3dhsp3_pickface.hsp
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B


3. [IN] ���l�܂��́A�ϐ��@�F�@pos2x
4. [IN] ���l�܂��́A�ϐ��@�F�@pos2y
�@�@��ʏ�̂Q�c���W���w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@maxdist
�@�@�ǂ̂��炢�̋����܂ŁA�R�c���f���̌��������邩���w�肵�܂��B
�@�@���̒l������������قǁA�����͍����ɂȂ�܂��B

6. [OUT] �ϐ��@�F�@partno
7. [OUT] �ϐ��@�F�@faceno
�@�@2D���W�ɑΉ�����R�c���W�����������ꍇ�ɁA
�@�@���̂R�c���f���̃p�[�c�̔ԍ��ƁA�ʂ̔ԍ���
�@�@�������܂��B

�@�@������Ȃ������ꍇ�́A-1���������܂��B

8. [OUT] �ϐ��@�F�@pos3x
9. [OUT] �ϐ��@�F�@pos3y
10. [OUT] �ϐ��@�F�@pos3z
�@�@�Q�c���W�ɑΉ�����R�c���W���������܂��B
�@�@partno��-1�ȊO�̒l���������Ă���Ƃ��̂݁A
�@�@�����̒l�͈Ӗ��������܂��B
�@�@�����^�̕ϐ��B

11. [OUT] �ϐ��@�F�@nx
12. [OUT] �ϐ��@�F�@ny
13. [OUT] �ϐ��@�F�@nz
�@�@2D���W�ɑΉ�����R�c���W���܂ޖʂ̖@���x�N�g����
�@�@�������܂��B

�@�@�x�N�g���̑傫���͂P�̂��̂������܂��B

�@�@partno��-1�ȊO�̒l���������Ă���Ƃ��̂݁A
�@�@�����̒l�͈Ӗ��������܂��B

�@�@�����^�̕ϐ��B

14. [OUT] �ϐ��@�F�@dist
�@�@���_�Ɓipos3x, pos3y, pos3z�j�Ƃ̋������������܂��B
�@�@partno��-1�ȊO�̒l���������Ă���Ƃ��̂݁A
�@�@���̒l�͈Ӗ��������܂��B
�@�@�����^�̕ϐ��B

15. [IN] ���l�܂��́A�ϐ��@�F�@calcmode
�@�@�P���w�肵�Ă��������B




�o�[�W���� : ver1.0.0.1

%index
E3DGetBBox
�ǂݍ��񂾃��f���f�[�^�̃o�E���_���[�{�b�N�X�̎擾���o���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@mode
p4 : [OUT] �ϐ��@�F�@minx
p5 : [OUT] �ϐ��@�F�@maxx
p6 : [OUT] �ϐ��@�F�@miny
p7 : [OUT] �ϐ��@�F�@maxy
p8 : [OUT] �ϐ��@�F�@minz
p9 : [OUT] �ϐ��@�F�@maxz

%inst
�ǂݍ��񂾃��f���f�[�^�̃o�E���_���[�{�b�N�X�̎擾���o���܂��B

�J�����̐ݒ��A�v���W�F�N�V�����̐ݒ���A���f���̑傫���ɉ����ĕύX����ꍇ�ȂǂɎg���Ă��������B

mode�����ŁA
���[�J�����W���A�O���[�o�����W����
�w��ł���悤�ɂ���\��ł��B
���݂́A�O���[�o�����W�����擾�ł��܂���B

���̖��߂Ŏg�p������́AE3DChkInView�ōX�V����܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
�@�@�r���{�[�h�̏��𓾂����ꍇ��-1���w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@-1���w�肵���ꍇ�́A���f���S�̂̃o�E���_���[�{�b�N�X���擾���܂��B

�@�@hsid��-1���w�肵���ꍇ��
�@�@�r���{�[�h��ID���w�肵�Ă��������B


3. [IN] ���l�܂��́A�ϐ��@�F�@mode
�@�@���݂̓T�|�[�g����Ă��܂���B
�@�@�O���w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@minx
5. [OUT] �ϐ��@�F�@maxx
6. [OUT] �ϐ��@�F�@miny
7. [OUT] �ϐ��@�F�@maxy
8. [OUT] �ϐ��@�F�@minz
9. [OUT] �ϐ��@�F�@maxz
�@�@�w���W�̍ŏ��A�ő�
�@�@�x���W�̍ŏ��A�ő�
�@�@�y���W�̍ŏ��A�ő�
�@�@�����ꂼ��A�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.2.9�Ŋg��

%index
E3DGetVertNoOfFace
 faceno�Ŏw�肵���ʂɊ܂܂�钸�_�̔ԍ����R�擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@faceno
p4 : [OUT] �ϐ��@�F�@vertno1
p5 : [OUT] �ϐ��@�F�@vertno2
p6 : [OUT] �ϐ��@�F�@vertno3

%inst
 faceno�Ŏw�肵���ʂɊ܂܂�钸�_�̔ԍ����R�擾���܂��B�i�R�p�`�̒��_�ł��j

faceno�ɂ́AE3DPickFace�ȂǂŎ擾����
�ʂ̔ԍ����w�肵�Ă��������B

E3DGetSamePosVert�̐�����
���ǂ݂��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@faceno
�@�@�ʂ����ʂ���ԍ����w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@vertno1
5. [OUT] �ϐ��@�F�@vertno2
6. [OUT] �ϐ��@�F�@vertno3
�@�@�R�p�`�̖ʂ��\������R�̒��_�̔ԍ���
�@�@�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetSamePosVert
�����ʒu�̒��_�ԍ����擾����B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@samevertno
p5 : [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
p6 : [OUT] �ϐ��@�F�@samenum

%inst
�����ʒu�̒��_�ԍ����擾����B

���f���f�[�^���ɂ́A�������_���W�ŁA
�t�u���W�����Ⴄ���_�����݂��܂��B

�����ʒu�̒��_�̔ԍ����擾����֐��ł��B
E3DGetVertNoOfFace�Ƒg�ݍ��킹��
�g�����Ƃ�z�肵�Ă��܂��B

samevertno �ɂ́A�����������_������
���_�ԍ����������܂��B

arrayleng�ɂT���炢�̒l�����āA
dim samevertno, arrayleng
�ŁA�z����쐬���Ă��������B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�����ʂ���ԍ����w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@samevertno
�@�@dim samevertno, arrayleng�ō쐬�����z����w�肵�Ă��������B
�@�@�����������_�̔ԍ����������܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
�@�@samevertno�z����쐬�����Ƃ��̑傫�����w�肵�Ă��������B

6. [OUT] �ϐ��@�F�@samenum
�@�@�����������_�̐����������܂��B
�@�@�܂�Amaxindex = samenum - 1�Ƃ����
�@�@samevertno(0) ����@samevertno(maxindex)
�@�@�܂ŁA�����������_�̔ԍ����A�������Ă��邱�ƂɂȂ�܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DRdtscStart
���Ԃ̌v���B
%group
Easy3D For HSP3 : ����

%prm
�Ȃ�

%inst
���Ԃ̌v���B

E3DRdtscStart��E3DRdtscStop�́A�Z�b�g�Ŏg�p���܂��B

E3DRdtscStart���Ăяo���Ă���A
E3DRdtscStop���Ăяo���܂łɁA
�v���Z�b�T�̃^�C���X�^���v�J�E���^��
�ǂꂭ�炢�����������擾�ł��܂��B




������
�Ȃ�

�o�[�W���� : ver1.0.0.1

%index
E3DRdtscStop
���Ԃ̌v���B
%group
Easy3D For HSP3 : ����

%prm
p1
p1 : [OUT] �ϐ��@�F�@time

%inst
���Ԃ̌v���B

E3DRdtscStart��E3DRdtscStop�́A�Z�b�g�Ŏg�p���܂��B

E3DRdtscStart���Ăяo���Ă���A
E3DRdtscStop���Ăяo���܂łɁA
�v���Z�b�T�̃^�C���X�^���v�J�E���^��
�ǂꂭ�炢�����������擾�ł��܂��B

�����^�̒l���擾����܂��B





������
1. [OUT] �ϐ��@�F�@time
�@�@E3DRdtscStart���Ă�ł���́A
�@�@�^�C���X�^���v�J�E���^�̑������������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSaveSig2Buf
�ǂݍ��ݍς̌`��f�[�^���A��������ɕۑ����܂��B
%group
Easy3D For HSP3 : ���f���o��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] ���l�܂��́A�ϐ��@�F�@bufsize
p4 : [OUT] �ϐ��@�F�@writesize

%inst
�ǂݍ��ݍς̌`��f�[�^���A��������ɕۑ����܂��B

�ۑ����邽�߂̃o�b�t�@�́A
���[�U�[���񑤂��p�ӂ��܂��B

�o�b�t�@�̒�����������Ȃ��ƁA
�ۑ����삪�s���Ȃ����߁A
html{
<strong>�o�b�t�@���̎擾�ƁA���ۂ̕ۑ��ƂŁA
���v�Q��A���̊֐����Ăяo���Ă��������B</strong>
}html

bufsize�����ɂO���w�肷��ƁA
�ۑ����s�킸�ɁA
�ۑ��ɕK�v�ȃo�b�t�@�̒������擾���܂��B

�o�b�t�@�̒������擾������ɁA
���̒�����bufsize�����Ɏw�肵�āA
���ۂ̕ۑ����s���Ă��������B


���ۂ̃R�[�h�́A�ȉ��̂悤�ɂȂ�܂��B

E3DSaveSig2Buf hsid, sigbuf, 0, sigwritesize

sdim sigbuf, sigwritesize

E3DSaveSig2Buf hsid2, sigbuf, sigwritesize, writesize1





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@bufsize
�@�@�O���w�肷��ƁA
�@�@�ۑ��ɕK�v�ȃo�b�t�@�̒������Awritesize�ɑ������܂��B
�@�@�O�ȊO���w�肷��ƁA
�@�@�o�b�t�@buf�ɁA�`��f�[�^��ۑ����܂��B

4. [OUT] �ϐ��@�F�@writesize
�@�@bufsize�ɂO���w�肳��Ă���ꍇ�ɂ́A
�@�@�K�v�ȃo�b�t�@�̃T�C�Y���������܂��B

�@�@bufsize�ɂO�ȊO���w�肳��Ă���ꍇ�ɂ́A
�@�@���ۂɕۑ������f�[�^�̃o�C�g���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSaveQua2Buf
�ǂݍ��ݍς̃��[�V�����f�[�^���A��������ɕۑ����܂��B
%group
Easy3D For HSP3 : ���[�V�����o��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mkid
p3 : [IN] �ϐ��@�F�@buf
p4 : [IN] ���l�܂��́A�ϐ��@�F�@bufsize
p5 : [OUT] �ϐ��@�F�@writesize
p6 : [IN] ���l�܂��́A�ϐ��@�F�@quatype

%inst
�ǂݍ��ݍς̃��[�V�����f�[�^���A��������ɕۑ����܂��B

�ۑ����邽�߂̃o�b�t�@�́A
���[�U�[���񑤂��p�ӂ��܂��B

�o�b�t�@�̒�����������Ȃ��ƁA
�ۑ����삪�s���Ȃ����߁A
html{
<strong>�o�b�t�@���̎擾�ƁA���ۂ̕ۑ��ƂŁA
���v�Q��A���̊֐����Ăяo���Ă��������B</strong>
}html

bufsize�����ɂO���w�肷��ƁA
�ۑ����s�킸�ɁA
�ۑ��ɕK�v�ȃo�b�t�@�̒������擾���܂��B

�o�b�t�@�̒������擾������ɁA
���̒�����bufsize�����Ɏw�肵�āA
���ۂ̕ۑ����s���Ă��������B


���ۂ̃R�[�h�́A�ȉ��̂悤�ɂȂ�܂��B


E3DSaveQua2Buf hsid, mkid, quabuf, 0, quawritesize, quatype

sdim quabuf, quawritesize

E3DSaveQua2Buf hsid, mkid, quabuf, quawritesize, writesize2, quatype

      quatype�����Ńt�@�C���̃^�C�v���w�肵�܂��B
e3dhsp3.as�Œ�`����Ă���QUATYPE_ �Ŏn�܂�萔���g���܂��B
QUATYPE_NUM�̓{�[���̊K�w�\������v�Z�����ԍ�����Ƀt�@�C�������܂��B
QUATYPE_NAME�̓{�[���̖��O����Ƀt�@�C�������܂��B

ver5.0.3.8���O�̃o�[�W������qua�t�@�C����QUATYPE_NUM�ł��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@mkid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ����w�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@bufsize
�@�@�O���w�肷��ƁA
�@�@�ۑ��ɕK�v�ȃo�b�t�@�̒������Awritesize�ɑ������܂��B
�@�@�O�ȊO���w�肷��ƁA
�@�@�o�b�t�@buf�ɁA���[�V�����f�[�^��ۑ����܂��B

5. [OUT] �ϐ��@�F�@writesize
�@�@bufsize�ɂO���w�肳��Ă���ꍇ�ɂ́A
�@�@�K�v�ȃo�b�t�@�̃T�C�Y���������܂��B

�@�@bufsize�ɂO�ȊO���w�肳��Ă���ꍇ�ɂ́A
�@�@���ۂɕۑ������f�[�^�̃o�C�g���������܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@quatype
�@�@QUATYPE_ �Ŏn�܂�萔���w��B
�@�@�f�t�H���g�l��QUATYPE_NAME�B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.3.8�ň����ǉ�<BR>
      

%index
E3DCameraShiftLeft
�J���������ɕ��s�ړ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@shift

%inst
�J���������ɕ��s�ړ����܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@shift
�@�@�ړ��ʁB
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCameraShiftRight
�J�������E�ɕ��s�ړ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@shift

%inst
�J�������E�ɕ��s�ړ����܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@shift
�@�@�ړ��ʁB
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCameraShiftUp
�J��������ɕ��s�ړ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@shift

%inst
�J��������ɕ��s�ړ����܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@shift
�@�@�ړ��ʁB
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCameraShiftDown
�J���������ɕ��s�ړ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@shift

%inst
�J���������ɕ��s�ړ����܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@shift
�@�@�ړ��ʁB
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetCameraQ
�J�����̉�]�ϊ���\���N�H�[�^�j�I����
�擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid

%inst
�J�����̉�]�ϊ���\���N�H�[�^�j�I����
�擾���܂��B

�g�����̗�́A
html{
<strong>e3dhsp3_toolscamera.hsp</strong>
}html
�ɂ���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I���̂h�c��n���Ă��������B
�@�@qid�Ŏ��ʂ����N�H�[�^�j�I���ɁA
�@�@�J�����̉�]���������܂��B

�@�@qid�ɂ́AE3DCreateQ�Ŏ擾�����h�c���g�p���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DInvQ
�t�N�H�[�^�j�I�����擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@srcqid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@dstqid

%inst
�t�N�H�[�^�j�I�����擾���܂��B

�g�����̗�́A
html{
<strong>e3dhsp3_toolscamera.hsp</strong>
}html
�ɂ���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@srcqid
2. [IN] ���l�܂��́A�ϐ��@�F�@dstqid
�@�@�N�H�[�^�j�I���̂h�c��n���Ă��������B
�@�@dstqid�Ŏ��ʂ����N�H�[�^�j�I���ɁA
�@�@srcqid�Ŏ��ʂ����N�H�[�^�j�I���̋t�N�H�[�^�j�I���������܂��B

�@�@srcqid, dstqid�ɂ́A
�@�@E3DCreateQ�Ŏ擾�����h�c���g�p���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DSetCameraTwist
�J�������c�C�X�g�i���[���j�����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@twistdeg

%inst
�J�������c�C�X�g�i���[���j�����܂��B

�J�����̎g�����́A���̕\�̑O�ɏ����Ă��镔�������ǂ݂��������B

E3DSetCameraTwist�́A�ǂ̃^�C�v�̃J�����֐����g�p���Ă���ꍇ�ł��A�L���ł��B

E3DSetCameraTarget���g�p���Ă���ꍇ�ɂ́A
E3DSetCameraTarget�Ŏw�肵��������̃x�N�g�����A�����twistdeg���˂���܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@twistdeg
�@�@�J������twistdeg�x�����A�c�C�X�g���܂��B
�@�@�����B


�o�[�W���� : ver1.0.0.1

%index
E3DIKRotateBeta
�h�j�ɂ��W���C���g�̉�]���s���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@jointno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@motionid
p5 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p6 : [IN] ���l�܂��́A�ϐ��@�F�@iklevel
p7 : [IN] ���l�܂��́A�ϐ��@�F�@axiskind
p8 : [IN] ���l�܂��́A�ϐ��@�F�@axisx
p9 : [IN] ���l�܂��́A�ϐ��@�F�@axisy
p10 : [IN] ���l�܂��́A�ϐ��@�F�@axisz
p11 : [IN] ���l�܂��́A�ϐ��@�F�@calclevel
p12 : [IN] ���l�܂��́A�ϐ��@�F�@targetx
p13 : [IN] ���l�܂��́A�ϐ��@�F�@targety
p14 : [IN] ���l�܂��́A�ϐ��@�F�@targetz
p15 : [OUT] �ϐ��@�F�@resx
p16 : [OUT] �ϐ��@�F�@resy
p17 : [OUT] �ϐ��@�F�@resz
p18 : [OUT] �ϐ��@�F�@lastparent

%inst
�h�j�ɂ��W���C���g�̉�]���s���܂��B
�ڕW�̍��W�Ȃǂ��w�肷��ƁA
�����ɋ߂Â��悤�ɁA��]���܂��B

html{
<strong>���̊֐��́A�x�[�^�łł��B
����̃o�[�W�����A�b�v�ŁA
�݊����̂Ƃ�Ȃ��ύX������ꍇ������܂��̂ŁA�����ӂ��������B</strong>
}html

���̊֐��ł́A�w�肵�����[�V������1�t���[�����̎p����񂵂��ύX���܂���B
���[�V�����S�̂ɁA�h�j���ʂ𔽉f���������ꍇ�́A
�h�j�v�Z�����O��̃L�[�t���[���ԂŁA
E3DFillUpMotion���Ăяo���K�v������܂��B


�g�����̗�́A
e3dhsp3_ikrotatebeta.hsp
�ɂ���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@jointno
�@�@�W���C���g�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetPartNoByName�ȂǂŎ擾�����l��A
�@�@E3DGetJointInfo�Ŏ擾�����V���A���ԍ����w�肵�Ă��������B
�@�@�W���C���g�ȊO�̃p�[�c�̔ԍ����w�肷��ƃG���[�ɂȂ�܂��B
�@�@
4. [IN] ���l�܂��́A�ϐ��@�F�@motionid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@���[�V�����̃t���[���ԍ����w�肵�Ă��������B

6. [IN] ���l�܂��́A�ϐ��@�F�@iklevel
�@�@�h�j�v�Z���̊K�w�����w�肵�܂��B
�@�@���K�w�A�e�������̂ڂ��āA�h�j�v�Z���邩���w�肵�܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@axiskind
�@�@IK�̉�]�̍ۂ̎����ǂ̂悤�Ɍ��肷�邩���w�肵�܂��B
�@�@�O�̎��́A�����ɕ��s�ȃx�N�g�����g���܂��B
�@�@�P�̎��́Aaxisx, axisy, axisz�Ɏw�肵�������g���܂��B
�@�@2�̎��́A�����I�Ɏ���ݒ肵�܂��B
�@�@
8. [IN] ���l�܂��́A�ϐ��@�F�@axisx
9. [IN] ���l�܂��́A�ϐ��@�F�@axisy
10. [IN] ���l�܂��́A�ϐ��@�F�@axisz
�@�@IK�̉�]�����w�肵�܂��B
�@�@axiskind�ɁA�P���w�肵���Ƃ��̂݁A�L���ł��B
�@�@�����B

11. [IN] ���l�܂��́A�ϐ��@�F�@calclevel
�@�@�v�Z�ׂ̍������w�肵�܂��B
�@�@���̐������w�肵�Ă��������B
�@�@�l���傫���قǍׂ��������܂����A
�@�@���o�[�W�����ł́A�傫�����Ă��A���܂������܂���B

12. [IN] ���l�܂��́A�ϐ��@�F�@targetx
13. [IN] ���l�܂��́A�ϐ��@�F�@targety
14. [IN] ���l�܂��́A�ϐ��@�F�@targetz
�@�@jointno�Ŏw�肵���W���C���g���A
�@�@���W�itargetx, targety, targetz�j�ɋ߂Â��悤�ɁA��]���܂��B�@
�@�@�����B

15. [OUT] �ϐ��@�F�@resx
16. [OUT] �ϐ��@�F�@resy
17. [OUT] �ϐ��@�F�@resz
�@�@jointno�Ŏw�肵���W���C���g�́A�v�Z��̍��W���������܂��B
�@�@�����^�̕ϐ��B

18. [OUT] �ϐ��@�F�@lastparent
�@�@�p���̕ύX�̂������{�[���̂����A
�@�@��Ԑe�̔ԍ����������܂��B
�@�@���̒l���AE3DRender�ɓn���ƁA�����̍��������o���܂��B
�@�@�ڂ����́AE3DRedner�̂Ƃ���̒��ӎ��������ǂ݂��������B




�o�[�W���� : ver1.0.0.1

%index
E3DIKRotateBeta2D
E3DIKRotateBeta�̂Q�c���W�w��o�[�W�����ł��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@jointno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@motionid
p5 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p6 : [IN] ���l�܂��́A�ϐ��@�F�@iklevel
p7 : [IN] ���l�܂��́A�ϐ��@�F�@axiskind
p8 : [IN] ���l�܂��́A�ϐ��@�F�@axisx
p9 : [IN] ���l�܂��́A�ϐ��@�F�@axisy
p10 : [IN] ���l�܂��́A�ϐ��@�F�@axisz
p11 : [IN] ���l�܂��́A�ϐ��@�F�@calclevel
p12 : [IN] ���l�܂��́A�ϐ��@�F�@target2dx
p13 : [IN] ���l�܂��́A�ϐ��@�F�@target2dy
p14 : [OUT] �ϐ��@�F�@resx
p15 : [OUT] �ϐ��@�F�@resy
p16 : [OUT] �ϐ��@�F�@resz
p17 : [OUT] �ϐ��@�F�@lastparent

%inst
E3DIKRotateBeta�̂Q�c���W�w��o�[�W�����ł��B

�ڕW���W���A�Q�c�ɂȂ����ȊO�́A
E3DIKRotateBeta�Ɠ����ł��B
�ڂ����́AE3DIKRotateBeta�̐�����
���ǂ݂��������B

��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_MouseDePose.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@jointno
�@�@�W���C���g�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetPartNoByName�ȂǂŎ擾�����l��A
�@�@E3DGetJointInfo�Ŏ擾�����V���A���ԍ����w�肵�Ă��������B
�@�@�W���C���g�ȊO�̃p�[�c�̔ԍ����w�肷��ƃG���[�ɂȂ�܂��B
�@�@
4. [IN] ���l�܂��́A�ϐ��@�F�@motionid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@���[�V�����̃t���[���ԍ����w�肵�Ă��������B

6. [IN] ���l�܂��́A�ϐ��@�F�@iklevel
�@�@�h�j�v�Z���̊K�w�����w�肵�܂��B
�@�@���K�w�A�e�������̂ڂ��āA�h�j�v�Z���邩���w�肵�܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@axiskind
�@�@IK�̉�]�̍ۂ̎����ǂ̂悤�Ɍ��肷�邩���w�肵�܂��B
�@�@�O�̎��́A�����ɕ��s�ȃx�N�g�����g���܂��B
�@�@�P�̎��́Aaxisx, axisy, axisz�Ɏw�肵�������g���܂��B
�@�@2�̎��́A�����I�Ɏ���ݒ肵�܂��B
�@�@
8. [IN] ���l�܂��́A�ϐ��@�F�@axisx
9. [IN] ���l�܂��́A�ϐ��@�F�@axisy
10. [IN] ���l�܂��́A�ϐ��@�F�@axisz
�@�@IK�̉�]�����w�肵�܂��B
�@�@axiskind�ɁA�P���w�肵���Ƃ��̂݁A�L���ł��B
�@�@�����B

11. [IN] ���l�܂��́A�ϐ��@�F�@calclevel
�@�@�v�Z�ׂ̍������w�肵�܂��B
�@�@���̐������w�肵�Ă��������B
�@�@�l���傫���قǍׂ��������܂����A
�@�@���o�[�W�����ł́A�傫�����Ă��A���܂������܂���B

12. [IN] ���l�܂��́A�ϐ��@�F�@target2dx
13. [IN] ���l�܂��́A�ϐ��@�F�@target2dy
�@�@jointno�Ŏw�肵���W���C���g���A
�@�@�w�肵���Q�c���W�ɋ߂Â��悤�ɁA��]���܂��B


14. [OUT] �ϐ��@�F�@resx
15. [OUT] �ϐ��@�F�@resy
16. [OUT] �ϐ��@�F�@resz
�@�@jointno�Ŏw�肵���W���C���g�́A�v�Z��̍��W���������܂��B
�@�@�����^�̕ϐ��B

17. [OUT] �ϐ��@�F�@lastparent
�@�@�p���̕ύX�̂������{�[���̂����A
�@�@��Ԑe�̔ԍ����������܂��B
�@�@���̒l���AE3DRender�ɓn���ƁA�����̍��������o���܂��B
�@�@�ڂ����́AE3DRedner�̂Ƃ���̒��ӎ��������ǂ݂��������B


�o�[�W���� : ver1.0.0.1

%index
E3DGetMotionType
���[�V�����̃^�C�v���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [OUT] �ϐ��@�F�@typeptr

%inst
���[�V�����̃^�C�v���擾���܂��B

������^�C�v�̈Ӗ��́A�ȉ��̂悤�ɂȂ�܂��B
�P���t���[���ԍ��Œ�(Stop)
�Q���ŏI�t���[���ԍ��܂Ői�񂾂�Œ�(Clamp)
�R���ŏI�t���[���ԍ��܂Ői�񂾂�A�擪�t���[���ɖ߂�(Round)
�S���ŏI�t���[���ԍ��܂Ői�񂾂�A�擪�t���[���̕����ɋt�i����iPingPong�j
�T���ŏI�t���[���܂Ői�񂾂�A�w��t���[���ɃW�����v����iJump�j




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@typeptr
�@�@���Ő����������[�V�����̎�ނ��������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetMotionType
���[�V�����̃^�C�v���Z�b�g���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@type

%inst
���[�V�����̃^�C�v���Z�b�g���܂��B

type�Ɏw�肷��l�̈Ӗ��́A�ȉ��̂悤�ɂȂ�܂��B�P���t���[���ԍ��Œ�(Stop)
�Q���ŏI�t���[���ԍ��܂Ői�񂾂�Œ�(Clamp)
�R���ŏI�t���[���ԍ��܂Ői�񂾂�A�擪�t���[���ɖ߂�(Round)
�S���ŏI�t���[���ԍ��܂Ői�񂾂�A�擪�t���[���̕����ɋt�i����iPingPong�j




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@type
�@�@���Ő����������[�V�����̎�ނ��w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DGetIKTransFlag
�h�j�`�B�֎~�����A�W���C���g����擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@jointid
p3 : [OUT] �ϐ��@�F�@flagptr

%inst
�h�j�`�B�֎~�����A�W���C���g����擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@jointid
�@�@�W���C���g�����ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@flagptr
�@�@�ʏ�̏ꍇ�͂O���A
�@�@�h�j�`�B�֎~�̎��͂P���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetIKTransFlag
�h�j�`�B�֎~�����A�W���C���g�ɃZ�b�g���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@jointid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�h�j�`�B�֎~�����A�W���C���g�ɃZ�b�g���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@jointid
�@�@�W���C���g�����ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@�ʏ�̏ꍇ�͂O���A
�@�@�h�j�`�B�֎~�̎��͂P���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyAllMotion
E3DAddMotion�œǂݍ��񂾁A���[�V�����f�[�^���A�S�āA�j�����܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid

%inst
E3DAddMotion�œǂݍ��񂾁A���[�V�����f�[�^���A�S�āA�j�����܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DGetUserInt1OfPart
�p�[�c�ɐݒ肳��Ă���A���[�U�[�f�[�^���A�擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [OUT] �ϐ��@�F�@dataptr

%inst
�p�[�c�ɐݒ肳��Ă���A���[�U�[�f�[�^���A�擾���܂��B




������
 1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@dataptr
�@�@���[�U�[�f�[�^���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetUserInt1OfPart
�p�[�c�ɁA���[�U�[�f�[�^���Z�b�g���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@data

%inst
�p�[�c�ɁA���[�U�[�f�[�^���Z�b�g���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@data
�@�@���[�U�[�f�[�^���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DGetBSphere

�p�[�c���́A���E�������擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [OUT] �ϐ��@�F�@centerx
p4 : [OUT] �ϐ��@�F�@centery
p5 : [OUT] �ϐ��@�F�@centerz
p6 : [OUT] �ϐ��@�F�@r

%inst

�p�[�c���́A���E�������擾���܂��B
�{�[���ό`���l�������A�O���[�o�����W�n��
�l���擾�ł��܂��B

html{
<strong>E3DChkInView�̌v�Z���ʂ��A���Ƃɂ��Ă��܂��B</strong>
}html

�\���p�I�u�W�F�N�g�݂̂ɑ΂��ėL���ł��B
�i�{�[���ɑ΂��ČĂ�ł��A���Ӗ��ł��B�j

partno��-1���w�肷��ƃ��f���S�̂̋��E�����擾�ł��܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@centerx
4. [OUT] �ϐ��@�F�@centery
5. [OUT] �ϐ��@�F�@centerz
�@�@���E���̒��S���W���������܂��B
�@�@�����^�̕ϐ��B

6. [OUT] �ϐ��@�F�@r
�@�@���E���̔��a���������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.4.1.4�Ŋg��<BR>
      

%index
E3DGetChildJoint
�w�肵���W���C���g�́A�q���W���C���g�̐��ƁA�q���̃V���A���ԍ����擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@parentno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
p4 : [OUT] �ϐ��@�F�@childarray
p5 : [OUT] �ϐ��@�F�@childnum

%inst
�w�肵���W���C���g�́A�q���W���C���g�̐��ƁA�q���̃V���A���ԍ����擾���܂��B


childarray�z��ɁA
�q���̐����́A�V���A���ԍ���
�������܂��B

�q���̐����A�z��̒������A�傫���悤��
���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@parentno
�@�@�e�̃W���C���g�̔ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
�@�@childarray�����Ɋi�[�ł���v�f�����w�肵�Ă��������B
�@�@dim childarray, 100�Ƃ����ꍇ�́A
�@�@�P�O�O���w�肵�Ă��������B

�@�@childnum�����ɑ������鐔���Aarrayleng���傫���ꍇ�́A
�@�@�z��̒���������Ȃ����ƂɂȂ�܂��B


4. [OUT] �ϐ��@�F�@childarray
�@�@�q���W���C���g�́A�V���A���ԍ����A�������܂��B
�@�@arrayleng��childnum���A�������ꍇ�́A
�@�@arrayleng�́A�V���A���ԍ������A�������܂���B

5. [OUT] �ϐ��@�F�@childnum
�@�@�q���W���C���g�̐����A�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyMotionFrame
�w�肵���L�[�t���[�����폜���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@frameno

%inst
�w�肵���L�[�t���[�����폜���܂��B

html{
<strong>���[�V�����̕ύX�𔽉f������ɂ́A
E3DFillUpMotion���ĂԕK�v������܂��B
</strong>
}html




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@�폜����t���[���̔ԍ����w�肵�Ă��������B
�@�@-1���w�肷��ƁA�S�ẴL�[�t���[�����폜���܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetKeyFrameNo
�w�肵���{�[���́A�L�[�t���[���̃t���[���ԍ���S�Ď擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p4 : [OUT] �ϐ��@�F�@framearray
p5 : [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
p6 : [OUT] �ϐ��@�F�@framenum

%inst
�w�肵���{�[���́A�L�[�t���[���̃t���[���ԍ���S�Ď擾���܂��B


framearray�ɂ́A
dim framearray, 50
�Ȃǂō쐬�����A�傫�߂̔z����g�p���Ă��������B

�z��̒������Aframenum���A�傫���ꍇ�ɂ́A�G���[�ɂȂ�܂��̂ŁA
���ӂ��Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[���p�[�c�����ʂ���ԍ����w�肵�Ă��������B


4. [OUT] �ϐ��@�F�@framearray
�@�@���̔z��ɁA�t���[���ԍ����A�������܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@arrayleng
�@�@framearray���A���P�[�g�idim�j�����Ƃ��̗v�f�����w�肵�Ă��������B

6. [OUT] �ϐ��@�F�@framenum
�@�@framearray�Ɋi�[�����v�f�̐����������܂��B
�@�@�L�[�t���[���̐��ł��B



�o�[�W���� : ver1.0.0.1

%index
E3DConvScreenTo3D
�C�ӂ̂Q�c���W���R�c���W�ɕϊ����܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@x2d
p3 : [IN] ���l�܂��́A�ϐ��@�F�@y2d
p4 : [IN] ���l�܂��́A�ϐ��@�F�@z
p5 : [OUT] �ϐ��@�F�@x3d
p6 : [OUT] �ϐ��@�F�@y3d
p7 : [OUT] �ϐ��@�F�@z3d

%inst
�C�ӂ̂Q�c���W���R�c���W�ɕϊ����܂��B

�}�E�X�̈ʒu�ɑΉ�����A�R�c���W��
���߂�ꍇ�ȂǂɁA�֗��ł��B


���̊֐����g�p���āA
�}�E�X�N���b�N�ŁA
�R�c���C����`�悷��T���v����
html{
<strong>e3dhsp3_DrawLine.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@x2d
3. [IN] ���l�܂��́A�ϐ��@�F�@y2d
�@�@�ϊ��������A�}�E�X�̈ʒu�Ȃǂ��A
�@�@(x2d, y2d)�Ŏw�肵�܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@z
�@�@�J��������ǂ̂��炢�̋����̕��ʏ�̓_���擾���邩��
�@�@�w�肵�܂��B

�@�@�R�c���W�̂y�̒l�ł͂���܂���B
�@�@�J��������̋����𐧌�o������̂ƍl���Ă��������B
�@�@�i�����̒l�Ƃ͈Ⴂ�܂��B�j

�@�@0.0�̂Ƃ��A�J�����Ɉ�ԋ߂����W�������܂��B
�@�@1.0�̂Ƃ��A�J��������A��ԉ����i������͈͂ł́j
�@�@���W�������܂��B
�@�@������͈͂Ƃ́A
�@�@E3DSetProjection�Ŏw�肵���͈͂̂��Ƃł��B

�@�@���ۂ̃J�����̋����ƁA����z�̒l�́A
�@�@���֌W�ɂ���܂���B

�@�@z�̒l��������Ƒ傫�����������ŁA
�@�@�J��������̋������傫���ς������A
�@�@���΂ɁAz��傫���ς��Ă��A
�@�@�J��������̋��������������ς��Ȃ��̈������܂��B

�@�@�O�ɋ߂�����l�ł́A
�@�@�����Ȃ����Ƃ�����̂Œ��ӂ��Ă��������B

�@�@�����B

5. [OUT] �ϐ��@�F�@x3d
6. [OUT] �ϐ��@�F�@y3d
7. [OUT] �ϐ��@�F�@z3d
�@�@��Ŏw�肵���Q�c���W�ɑΉ�����R�c���W���A
�@�@�ix3d, y3d, z3d�j�ɑ������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DVec3Length
�w�肵���x�N�g���̒������擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@vecx
p2 : [IN] ���l�܂��́A�ϐ��@�F�@vecy
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vecz
p4 : [OUT] �ϐ��@�F�@length

%inst
�w�肵���x�N�g���̒������擾���܂��B

2�_�̋����̌v�Z�ȂǂɎg���Ă��������B
�Ⴆ�΁A
(posx1, posy1, posz1)��(posx2, posy2, posz2)
�̋������v�Z�������Ƃ��ɂ́A

vecx = posx1 - posx2
vecy = posy1 - posy2
vecz = posz1 - posz2
�Ƃ��āA���̊֐��ɓn���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@vecx
2. [IN] ���l�܂��́A�ϐ��@�F�@vecy
3. [IN] ���l�܂��́A�ϐ��@�F�@vecz
�@�@�x�N�g�����w�肵�܂��B
�@�@�����B

4. [OUT] �ϐ��@�F�@length
�@�@�x�N�g���̒������������܂��B
�@�@�����^�̕ϐ��B


�o�[�W���� : ver1.0.0.1

%index
E3DSetUV
�e�N�X�`���[�̂t�u���W���Z�b�g���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@vertno
p4 : [IN] �ϐ��܂��́A���l�@�F�@u
p5 : [IN] �ϐ��܂��́A���l�@�F�@v
p6 : [IN] �ϐ��܂��́A���l�@�F�@setflag
p7 : [IN] �ϐ��܂��́A���l�@�F�@clampflag

%inst
�e�N�X�`���[�̂t�u���W���Z�b�g���܂��B

partno�ɂ́A
E3DGetPartNoByName�Ŏ擾�����ԍ����A
vertno�ɂ́A
E3DGetVertNumOfPart�Ŏ擾�������_����
vertnum�Ƃ����Ƃ��A
0����(vertnum - 1)�܂ł̒l��n���Ă��������B

html{
<strong>
vertno��-1���w�肷��ƁA
�w��p�[�c�̑S�Ă̒��_�ɑ΂��āA
�������s���悤�ɂ��܂����B
</strong>
}html
ver5.0.4.4�Ńr���{�[�h�ɑΉ����܂����B

ver5.0.5.5��clampflag��ǉ����܂����B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id�B
�@�@-1��n���ƃr���{�[�h�̏��������܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ��B
�@�@hsid��-1��n�����ꍇ�̓r���{�[�hID���w�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@vertno
�@�@���_�̔ԍ��B

�@�@-1���w�肷��ƁA�S�Ă̒��_�ɑ΂��ď������܂��B


4. [IN] �ϐ��܂��́A���l�@�F�@u
5. [IN] �ϐ��܂��́A���l�@�F�@v
�@�@�ݒ肵�����t�u�l�̒l���w�肵�Ă��������B
�@�@�ʏ��0.0����1.0�̒l�B
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@setflag
�@�@setflag �ɂO���w�肷��ƁA
�@�@�w��t�u�l���A���̂܂܃Z�b�g���܂��B

�@�@setflag�ɂP���w�肷��ƁA
�@�@�w��t�u�l���A�����̂t�u�l�ɁA�����Z���܂��B

7. [IN] �ϐ��܂��́A���l�@�F�@clampflag
�@�@�P���Z�b�g�����UV�̒l���O�D�O����P�D�O�̊ԂɃN�����v���܂��B
�@�@�O���w�肷��ƃN�����v�͍s���܂���B
�@�@�����w�肵�Ȃ������ꍇ�͂O�Ɠ����ł��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.4.4�Ŋg��<BR>
      ver5.0.5.5�Ŋg��<BR>
      

%index
E3DGetUV
�e�N�X�`���[�̂t�u���W���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@vertno
p4 : [OUT] �ϐ��@�F�@u
p5 : [OUT] �ϐ��@�F�@v

%inst
�e�N�X�`���[�̂t�u���W���擾���܂��B

partno�ɂ́A
E3DGetPartNoByName�Ŏ擾�����ԍ����A
vertno�ɂ́A
E3DGetVertNumOfPart�Ŏ擾�������_����
vertnum�Ƃ����Ƃ��A
0����(vertnum - 1)�܂ł̒l��n���Ă��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@vertno
�@�@���_�̔ԍ�

4. [OUT] �ϐ��@�F�@u
5. [OUT] �ϐ��@�F�@v
�@�@�t�u���W�̒l���A�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DPickBone
�w�肵���Q�c���W�ɋ߂��W���C���g�̔ԍ����擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@posx
p3 : [IN] �ϐ��܂��́A���l�@�F�@posy
p4 : [OUT] �ϐ��@�F�@jointno

%inst
�w�肵���Q�c���W�ɋ߂��W���C���g�̔ԍ����擾���܂��B

�Q�c���W�ɂ́A�}�E�X�̍��W�Ȃǂ��w�肵�Ă��������B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_MouseDePose.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@posx
3. [IN] �ϐ��܂��́A���l�@�F�@posy
�@�@�Q�c���W���A�iposx, posy�j�Ŏw�肵�܂��B

4. [OUT] �ϐ��@�F�@jointno
�@�@�w�肵���Q�c���W�ɋ߂��W���C���g������ꍇ�ɂ́A
�@�@���̃W���C���g�̂h�c���������܂��B
�@�@
�@�@�߂��ɃW���C���g���Ȃ��ꍇ�ɂ́A�O�ȉ����������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DShiftBoneTree2D
�w�肵���Q�c���W�ɋ߂Â��悤�ɁA�{�[���c���[�S�̂��A�ړ����܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@jointno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p5 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p6 : [IN] ���l�܂��́A�ϐ��@�F�@target2dx
p7 : [IN] ���l�܂��́A�ϐ��@�F�@target2dy

%inst
�w�肵���Q�c���W�ɋ߂Â��悤�ɁA�{�[���c���[�S�̂��A�ړ����܂��B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_MouseDePose.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@jointno
�@�@�W���C���g�����ʂ���h�c
�@�@E3DPickBone�ȂǂŎ擾�����A
�@�@�W���C���g�̔ԍ���n���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c
�@�@E3DAddMotion�Ŏ擾����motid���w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@�|�[�Y��ݒ肵�����t���[���ԍ����w�肵�Ă��������B

6. [IN] ���l�܂��́A�ϐ��@�F�@target2dx
7. [IN] ���l�܂��́A�ϐ��@�F�@target2dy
�@�@jointno�Ŏw�肵���W���C���g���A
�@�@�w�肵���Q�c���W�ɋ߂Â��悤�ɁA
�@�@�{�[���c���[�S�̂��ړ����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetDispSwitch
�f�B�X�v���C�X�C�b�`�̏�Ԃ��擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p4 : [OUT] �ϐ��@�F�@dispswitch

%inst
�f�B�X�v���C�X�C�b�`�̏�Ԃ��擾���܂��B

�f�B�X�v���C�X�C�b�`���́A�r�b�g���Ƃ̘a�ɂȂ��Ă��܂��B
�f�B�X�v���C�X�C�b�`�ԍ�ds ���I���̏ꍇ�́A
�Q��ds��̒l��������Ă��邱�ƂɂȂ�܂��B
�Ⴆ�΁A�f�B�X�v���C�X�C�b�`�R�������I���̏ꍇ�́A�Q��3��̂W�Ƃ����l���������Ă��܂��B


�f�B�X�v���C�X�C�b�`���I���ɂȂ��Ă��邩�𒲂ׂď�������ɂ́A
�����Z�q�ƁA�Q�̃X�C�b�`�ԍ���̒l���g���܂��B

�Ⴆ�΁A�X�C�b�`3���I�����ǂ����𒲂ׂ�ɂ́A

if( (dispswitch &amp; 8) != 0 ) {
�@�@//�I���̎��̏���
} else {
�@�@//�I�t�̎��̏���
}

�̂悤�ɂ��܂��B

html{
<strong>���̖��߂�ver5.0.0.1�ȍ~�͋@�\���܂���B
�V����E3DGetDispSwitch2�������p���������B
</strong>
}html



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c

�@�@motid��-1���w�肷��ƁA
�@�@E3DSetDispSwitch�ŁAmotid��-1���w�肵�Đݒ肵���l��
�@�@dispswitch�����ɑ������܂��B

�@�@motid��-2���w�肷��ƁA
�@�@���ݐݒ肳��Ă���A���[�V�����̃X�C�b�`��Ԃ��A
�@�@dispswitch�����ɑ������܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

�@�@frameno��-1���w�肷��ƁA
�@�@���݂̃t���[���ԍ��́A�X�C�b�`��Ԃ��A
�@�@dispswitch�����ɑ������܂��B

4. [OUT] �ϐ��@�F�@dispswitch
�@�@�X�C�b�`�̏�Ԃ��������܂��B
�@�@�ڂ����́A���L���������������B



�o�[�W���� : ver1.0.0.1

%index
E3DRotateBillboard
�r���{�[�h���A�J�����̕������������܂܁A��]���܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@billboardid
p2 : [IN] �ϐ��܂��́A���l�@�F�@rotdeg
p3 : [IN] �ϐ��܂��́A���l�@�F�@rotkind

%inst
�r���{�[�h���A�J�����̕������������܂܁A��]���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@billboardid
�@�@�r���{�[�h�����ʂ���ԍ�

2. [IN] �ϐ��܂��́A���l�@�F�@rotdeg
�@�@�r���{�[�h���Arotdeg�x�����A
�@�@��]���܂��B
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@rotkind

�@�@rotkind�ɂO���w�肷��ƁA���Βl���[�h�ɂȂ�܂�
�@�@���݂̃r���{�[�h�̌����ɁA
�@�@�X�ɁA�w��p�x�����A��]�������܂��B

�@�@rotkind�ɂP���w�肷��ƁA��Βl���[�h�ɂȂ�܂��B
�@�@������Ԃɑ΂��āA�w��p�x�����A��]�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetBillboardUV
�r���{�[�h�̂t�u��ݒ肵�܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@bbid
p2 : [IN] �ϐ��܂��́A���l�@�F�@unum
p3 : [IN] �ϐ��܂��́A���l�@�F�@vnum
p4 : [IN] �ϐ��܂��́A���l�@�F�@tileno
p5 : [IN] �ϐ��܂��́A���l�@�F�@revuflag

%inst
�r���{�[�h�̂t�u��ݒ肵�܂��B

��������unum�A�c������vnum�́A�^�C����ɍ�����e�N�X�`���[�́A�^�C���̔ԍ����w�肷�邱�ƂŁA�w�肵���摜�̂t�u��ݒ肵�܂��B

�^�C����̃e�N�X�`���摜�ƃ^�C���ԍ��̑Ή��́A(Link http://www5d.biglobe.ne.jp/~ochikko/e3dhsp_texturetile.htm )�^�C���ԍ��̐������������������B


�^�C���̐���12�̏ꍇ�́A
�^�C���̔ԍ��́A�O����P�P�ɂȂ�܂����A
������傫�Ȓl�⏬���Ȓl���w�肷�邱�Ƃ��\�ł��B

�Ⴆ�΁A�^�C���̐���12�̏ꍇ�A
�P�Q���w�肷��ƁA
�^�C���ԍ��O���\������A
13���w�肷��ƁA
�^�C���ԍ��P���\������A
-1���w�肷��ƁA
�^�C���ԍ��P�P���\�������Ƃ������
�@�\���܂��B


ver5.0.4.5��revuflag������ǉ����܂����B





������
1. [IN] �ϐ��܂��́A���l�@�F�@bbid
�@�@�r���{�[�h�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@unum
3. [IN] �ϐ��܂��́A���l�@�F�@vnum
�@�@�^�C���̉��Əc�̌�

4. [IN] �ϐ��܂��́A���l�@�F�@tileno
�@�@�ݒ肵�����e�N�X�`���̃^�C���̔ԍ�

5. [IN] �ϐ��܂��́A���l�@�F�@revuflag
�@�@�P���w�肷��ƃe�N�X�`�������E���]�����܂��B
�@�@�O���w�肷��Ƃ��̂܂܁B
�@�@�ȗ������Ƃ��͂O�i���̂܂܁j�ƂȂ�܂��B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.4.5�Ŋg��<BR>
      

%index
E3DCreateTexture
�w�肵���t�@�C������e�N�X�`�������܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@pool
p3 : [IN] �ϐ��܂��́A���l�@�F�@transparent
p4 : [OUT] �ϐ��@�F�@texid

%inst
�w�肵���t�@�C������e�N�X�`�������܂��B��ʂƓ����e�N�X�`������邱�Ƃ��\�ł��B

�e�N�X�`���̑���ɂ́A���̊֐��Ŏ擾����
�e�N�X�`���̂h�c�Atexid���g�p���Ă��������B


transparent�ɂP�i�����߁j���w�肵���ꍇ�ɂ́A
�����ߏ������s���܂��B
D3DPOOL_DEFAULT�ŁA
�e�N�X�`�����쐬����ꍇ�ɂ́Atransparent�ɂP���w�肷��Ǝ��s���邱�Ƃ�����܂��B


filename�ɁA&quot;MainWindow&quot;���w�肷��ƁA
�o�b�N�o�b�t�@�Ɠ������e�ŁA
�����傫���̃T�[�t�F�X���쐬���܂��B
���̍ہApool�ɉ����w�肵�Ă��A
�����I�ɁA�V�X�e���������ɍ쐬���܂��B
�܂��A���̂Ƃ��Atransparent�ɂP���w��ł��܂���B

&quot;MainWindow&quot;���w�肵���ꍇ�́A
E3DSetTextureToDispObj�́A�g���܂���B
E3DCopyTextureToBackBuffer���g���Ă��������B


&quot;MainWindow&quot;���w�肵���Ƃ��́A�o�b�N�o�b�t�@�Ɠ����t�H�[�}�b�g�ŁA����ȊO�́AD3DFMT_A8R8G8B8�ō쐬���܂��B
DX8����DX9�ւ̈ڍs���̕ύX�̊֌W�ŁA
ver3.0.3.4���݁A&quot;MainWindow&quot;�w��͎g�p�ł��Ȃ���Ԃł��B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_TextureChange.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@�e�N�X�`���t�@�C�� �̃p�X������B
�@�@&quot;MainWindow&quot;���w�肷��ƁA
�@�@��ʂƓ������e�ŁA�����傫���̃e�N�X�`�����쐬����܂��B
�@�@�������A���̂Ƃ��A���ӂ���_������������̂ŁA
�@�@���L���������������B


2. [IN] �ϐ��܂��́A���l�@�F�@pool
�@�@�ǂ̃������ʒu�Ƀe�N�X�`�����쐬���邩���w�肵�܂��B

�@�@e3dhsp3.as�Œ�`���Ă���
�@�@D3DPOOL_DEFAULT�@�i���ʂ̓r�f�I�������ɍ���܂��j
�@�@D3DPOOL_MANAGED�@�iDirectX�̊Ǘ��i�o�b�N�A�b�v�L��j�j
�@�@D3DPOOL_SYSTEMMEM�@�i�V�X�e���������ɍ���܂��j
�@�@�̒�����I�т܂��B


3. [IN] �ϐ��܂��́A���l�@�F�@transparent
�@�@���ߏ����w�肵�܂��B

�@�@�O���w�肷��ƁA�s�����̃e�N�X�`���B
�@�@�P���w�肷��ƁA���F�𓧉߂���e�N�X�`���B
�@�@�Q���w�肷��ƁA�e�N�X�`���t�@�C���̃A���t�@�ɏ]����
�@�@���߂���e�N�X�`���ɂȂ�܂��B


4. [OUT] �ϐ��@�F�@texid
�@�@�쐬�����e�N�X�`�������ʂ���h�c
�@�@�e�N�X�`������̍ۂɂ́A���̂h�c���g�p���Ă��������B




�o�[�W���� : ver1.0.0.1

%index
E3DGetTextureInfo
�쐬�����e�N�X�`���̏����擾���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@texid
p2 : [OUT] �ϐ��@�F�@width
p3 : [OUT] �ϐ��@�F�@height
p4 : [OUT] �ϐ��@�F�@pool
p5 : [OUT] �ϐ��@�F�@transparent
p6 : [OUT] �ϐ��@�F�@format

%inst
�쐬�����e�N�X�`���̏����擾���܂��B

�e�N�X�`���̃T�C�Y�́A
�r�f�I�J�[�h�ɂ���ẮA�Q�̏搔�̃T�C�Y����
�m�ۂł��Ȃ��̂ŁA
�t�@�C���̃T�C�Y�ƈقȂ�ꍇ������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@texid
�@�@�e�N�X�`�������ʂ���h�c

2. [OUT] �ϐ��@�F�@width
3. [OUT] �ϐ��@�F�@height
�@�@�e�N�X�`���̕��ƍ���

4. [OUT] �ϐ��@�F�@pool
�@�@�쐬�������ʒu

5. [OUT] �ϐ��@�F�@transparent
�@�@���߃��[�h

6. [OUT] �ϐ��@�F�@format
�@�@�t�H�[�}�b�g



�o�[�W���� : ver1.0.0.1

%index
E3DCopyTextureToTexture
�e�N�X�`������e�N�X�`���ցA���e���R�s�[���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p2 : [IN] �ϐ��܂��́A���l�@�F�@dsttexid

%inst
�e�N�X�`������e�N�X�`���ցA���e���R�s�[���܂��B

src��dst�ő傫����A�t�H�[�}�b�g���Ⴄ�ꍇ�́A
�G���[�ɂȂ�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�R�s�[���̃e�N�X�`�������ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@dsttexid
�@�@�R�s�[�����e�N�X�`�������ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DGetTextureFromDispObj
�ǂݍ��ݍς̂R�c�I�u�W�F�N�g�ɐݒ肳��Ă���e�N�X�`�����擾���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [OUT] �ϐ��@�F�@texid

%inst
�ǂݍ��ݍς̂R�c�I�u�W�F�N�g�ɐݒ肳��Ă���e�N�X�`�����擾���܂��B

sig���f���f�[�^�ɑ΂��鑀��ɂ�
E3DGetTextureFromMaterial�����g�����������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���h�c

�@�@-1���w�肷��ƁA�r���{�[�h�̏������s���܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�̔ԍ��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

�@�@hsid��-1���w�肵���ꍇ�ɂ́A
�@�@�r���{�[�h�̂h�c���w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@texid
�@�@�e�N�X�`�������ʂ���ID
�@�@�w�肵���p�[�c�Ƀe�N�X�`�����\���Ă��Ȃ��ꍇ�ɂ́A
�@�@texid�ɂ́A-1���������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DSetTextureToDispObj
�ǂݍ��ݍς̂R�c�I�u�W�F�N�g�ɁA�e�N�X�`����ݒ肵�܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@texid

%inst
�ǂݍ��ݍς̂R�c�I�u�W�F�N�g�ɁA�e�N�X�`����ݒ肵�܂��B

sig���f���f�[�^�ɑ΂��鑀��ɂ�
E3DSetTextureToMaterial�����g�����������B


�e�N�X�`�����Z�b�g���Ă��A
�t�u���W�͎����I�ɐ�������܂���B
���I�Ƀe�N�X�`����ݒ肷��ꍇ�́A
�t�u���W���AE3DSetUV�ŁA�ݒ肷�邩�A
�������́A
���炩���߁A���f���ɉ��̃e�N�X�`����\���Ă����āA�t�u�ݒ肵�Ă����K�v������܂��B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_TextureChange.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���h�c

�@�@-1���w�肷��ƁA�r���{�[�h�̏������s���܂��B
�@�@-2���w�肷��ƃX�v���C�g�̏������s���܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�̔ԍ��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

�@�@hsid��-1���w�肵���ꍇ�ɂ́A
�@�@�r���{�[�h�̂h�c���w�肵�Ă��������B

�@�@hsid��-2���w�肵���ꍇ�ɂ�
�@�@�X�v���C�g��ID���w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@texid
�@�@�\��t�������e�N�X�`���̂h�c���w�肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DRasterScrollTexture
�e�N�X�`���ɁA���X�^�[�X�N���[�������������܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p2 : [IN] �ϐ��܂��́A���l�@�F�@desttexid
p3 : [IN] �ϐ��܂��́A���l�@�F�@t
p4 : [IN] �ϐ��܂��́A���l�@�F�@param1
p5 : [IN] �ϐ��܂��́A���l�@�F�@param2

%inst
�e�N�X�`���ɁA���X�^�[�X�N���[�������������܂��B

�����Ɨh�����ʂ������܂��B

srctexid��desttexid�́A�������́A�G���[�ɂȂ�܂��B
src��dest�ŁA�傫���A�t�H�[�}�b�g���Ⴄ�Ƃ����A�G���[�ɂȂ�܂��B
texid�ɂ́A�����Ƃ��AD3DPOOL_SYSTEMMEM�ō쐬�����e�N�X�`���[���w�肵�Ă��������B
����ȊO���\�ł����A�ɒ[�ɏ������x�������܂��B
�r�f�I�������Ƀ��X�^�[�������������ꍇ�́A
�V�X�e���������̃e�N�X�`���[���m�ŁA���X�^�[�������������ƁA
�r�f�I�������̃e�N�X�`���[�ɁAE3DCopyTextureToTexture�œ]�����Ă��������B
DX8����DX9�ւ̈ڍs���̕ύX�̊֌W�ŁA
ver3.0.3.4���݂��̖��߂͎g�p�ł��Ȃ���Ԃł��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@��������O�̃e�N�X�`�������ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@desttexid
�@�@�����������ʂ��i�[����e�N�X�`�������ʂ���h�c

3. [IN] �ϐ��܂��́A���l�@�F�@t
�@�@���Ԍo�߂��w�肵�܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@param1
�@�@�h��̏c�����̋���w�肵�܂��B
�@�@param1�̒l���傫���قǁA
�@�@�ω����������Ȃ�܂��B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@param2
�@�@�h��̉������̋���w�肵�܂��B
�@�@param2�̒l���傫���قǁA
�@�@�ω����������Ȃ�܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DCopyTextureToBackBuffer
�e�N�X�`�����o�b�N�o�b�t�@�ɃR�s�[���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@texid

%inst
�e�N�X�`�����o�b�N�o�b�t�@�ɃR�s�[���܂��B

E3DCreateTexture�ŁA
filename��&quot;MainWindow&quot;���w�肵�č쐬����
�e�N�X�`���[���A�o�b�N�o�b�t�@�ɃR�s�[���܂��B

�t�H�[�}�b�g���قȂ�ꍇ�́A���s���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@texid
�@�@�R�s�[���̃e�N�X�`�������ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DDestroyTexture
�e�N�X�`����j�����܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@texid

%inst
�e�N�X�`����j�����܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@texid
�@�@�e�N�X�`�������ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DSetLightAmbient
���C�g�̃A���r�G���g�F���w�肵�܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@lightid
p2 : [IN] �ϐ��܂��́A���l�@�F�@R
p3 : [IN] �ϐ��܂��́A���l�@�F�@G
p4 : [IN] �ϐ��܂��́A���l�@�F�@B

%inst
���C�g�̃A���r�G���g�F���w�肵�܂��B
�n�ʃf�[�^�ɂ̂݁A�e�����܂��B

���̖��߂́A���݃T�|�[�g����Ă��܂���B



������
1. [IN] �ϐ��܂��́A���l�@�F�@lightid
�@�@���C�g�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@R
3. [IN] �ϐ��܂��́A���l�@�F�@G
4. [IN] �ϐ��܂��́A���l�@�F�@B
�@�@�F�̂q�f�a���O����Q�T�T�܂ł̒l�ŁA�w�肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetLightSpecular
���C�g�̃X�y�L�����[�F���w�肵�܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@lightid
p2 : [IN] �ϐ��܂��́A���l�@�F�@R
p3 : [IN] �ϐ��܂��́A���l�@�F�@G
p4 : [IN] �ϐ��܂��́A���l�@�F�@B

%inst
���C�g�̃X�y�L�����[�F���w�肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@lightid
�@�@���C�g�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@R
3. [IN] �ϐ��܂��́A���l�@�F�@G
4. [IN] �ϐ��܂��́A���l�@�F�@B
�@�@�F�̂q�f�a���O����Q�T�T�܂ł̒l�ŁA�w�肵�܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DInvColTexture
�e�N�X�`���̐F�𔽓]���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@texid

%inst
�e�N�X�`���̐F�𔽓]���܂��B

��̓I�Ȏg�p��́A
html{
<strong>e3dhsp_TextureRasteras</strong>
}html
�ɏ����܂����̂ŁA�������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@texid
�@�@�e�N�X�`�������ʂ���h�c



�o�[�W���� : ver1.0.0.1

%index
E3DSaveGndFile
�n�ʃf�[�^��gnd�t�@�C���ɕۑ����܂��B
%group
Easy3D For HSP3 : �n�ʏo��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@filename

%inst
�n�ʃf�[�^��gnd�t�@�C���ɕۑ����܂��B

���̊֐��̓T�|�[�g�����~����܂����B
�n�ʂ������ɓǂݍ��݂����ꍇ��sig���g���Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�n�ʃf�[�^�����ʂ���h�c

2. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ۑ��t�@�C�����i�p�X�j���w�肵�Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DLoadGndFile
�n�ʃf�[�^�i*.gnd�j��ǂݍ���ŁAhsid�𓾂�B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p2 : [OUT] �ϐ��@�F�@hsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@mult

%inst
�n�ʃf�[�^�i*.gnd�j��ǂݍ���ŁAhsid�𓾂�B

gnd�t�@�C���̓ǂݍ��ݑ��x�́Amqo�t�@�C���̓ǂݍ��݂����A
�����ԑ����Ȃ�܂��B




������
1. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.gnd �̃p�X������B

2. [OUT] �ϐ��@�F�@hsid
�@�@�ǂݍ��񂾌`��f�[�^�����ʂ���hsid

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O
�@�@���K������ꍇ�͂P���w��
�@�@���Ȃ��ꍇ�͂O���w��
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


4. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@���{�͂P�D�O�B
�@�@�����B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DLoadGndFileFromBuf
����������n�ʃf�[�^�̃��[�h���s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ������܂��́A������̕ϐ��@�F�@resdir
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p4 : [OUT] �ϐ��@�F�@hsid
p5 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag

%inst
����������n�ʃf�[�^�̃��[�h���s���܂��B
���������ɂ́Agnd�t�@�C���Ɠ����t�H�[�}�b�g��
�����Ă���Ƃ݂Ȃ��āA�������܂��B

�e�N�X�`���t�@�C���́A�ʏ�Ǎ��Ɠ��l�ɁA
�t�@�C������s���܂��B

resdir�ɂ́A�e�N�X�`���̑��݂���t�H���_�̃p�X���w�肵�Ă��������B
html{
<strong>�Ō�ɁA&quot;\\&quot;��t����̂�Y��Ȃ��ł��������B</strong>
}html

�Ⴆ�΁A
resdir = &quot;C:\\hsp\\Meida\\&quot;
��
resdir = dir_cur+ &quot;\\&quot;
�Ȃǂ̂悤�Ɏw�肵�Ă��������B





������
1. [IN] ������܂��́A������̕ϐ��@�F�@resdir
�@�@�e�N�X�`���[�̂���t�H���_ �̃p�X������B
�@�@�Ō�ɁA&quot;\\&quot;���K�v�B

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

3. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

4. [OUT] �ϐ��@�F�@hsid
�@�@�ǂݍ��񂾌`��f�[�^�����ʂ���hsid

5. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O
�@�@���K������ꍇ�͂P���w��
�@�@���Ȃ��ꍇ�͂O���w��
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B





�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DCreateTextureFromBuf
�������ɓǂݍ��񂾊G�̃f�[�^����A�e�N�X�`�����쐬���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��@�F�@buf
p2 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p3 : [IN] �ϐ��܂��́A���l�@�F�@pool
p4 : [IN] �ϐ��܂��́A���l�@�F�@transparent
p5 : [OUT] �ϐ��@�F�@texid

%inst
�������ɓǂݍ��񂾊G�̃f�[�^����A�e�N�X�`�����쐬���܂��B

filename�̑���ɁA�o�b�t�@���w�肵�A
&quot;MainWindow&quot;�������Ȃ����ƈȊO�́A
E3DCreateTexture�Ɠ����ł��B

E3DCreateTexture�̐������A
���ǂ݂��������B


�Ⴆ�΁A�ȉ��̂悤�Ȏg�����ɂȂ�܂��B

sdim buf0, 800000 ;�t�@�C���T�C�Y���傫��
bload &quot;pict.bmp&quot;, buf0
bufsize0 = strsize
E3DCreateTextureFromBuf buf0, bufsize0, D3DPOOL_MANAGED, 1, texid0





������
1. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

2. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���(�o�C�g)

3. [IN] �ϐ��܂��́A���l�@�F�@pool
�@�@�ǂ̃������ʒu�Ƀe�N�X�`�����쐬���邩���w�肵�܂��B

�@�@e3dhsp3.as�Œ�`���Ă���
�@�@D3DPOOL_DEFAULT�@�i���ʂ̓r�f�I�������ɍ���܂��j
�@�@D3DPOOL_MANAGED�@�iDirectX�̊Ǘ��i�o�b�N�A�b�v�L��j�j
�@�@D3DPOOL_SYSTEMMEM�@�i�V�X�e���������ɍ���܂��j
�@�@�̒�����I�т܂��B


4. [IN] �ϐ��܂��́A���l�@�F�@transparent
�@�@���ߏ����w�肵�܂��B

�@�@�O���w�肷��ƁA�s�����̃e�N�X�`���B
�@�@�P���w�肷��ƁA���F�𓧉߂���e�N�X�`���B
�@�@�Q���w�肷��ƁA�e�N�X�`���t�@�C���̃A���t�@�ɏ]����
�@�@���߂���e�N�X�`���ɂȂ�܂��B


5. [OUT] �ϐ��@�F�@texid
�@�@�쐬�����e�N�X�`�������ʂ���h�c
�@�@�e�N�X�`������̍ۂɂ́A���̂h�c���g�p���Ă��������B



�o�[�W���� : ver1.0.0.1

%index
E3DLoadSoundFromBuf
���������特�f�[�^��ǂݍ��݁A�h�c���擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��@�F�@buf
p2 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p3 : [IN] �ϐ��܂��́A���l�@�F�@type
p4 : [IN] �ϐ��܂��́A���l�@�F�@use3dflag
p5 : [IN] �ϐ��܂��́A���l�@�F�@reverbflag
p6 : [IN] �ϐ��܂��́A���l�@�F�@bufnum
p7 : [OUT] �ϐ��@�F�@soundid

%inst
���������特�f�[�^��ǂݍ��݁A�h�c���擾���܂��B

����������ǂݍ��ނ��ƈȊO�́A
E3DLoadSound�Ɠ����ł��B

E3DLoadSound�̐��������ǂ݂��������B

���݁Aogg�ɂ͂��̖��߂͎g���܂���B

ver5.3.1.6��oggdatanum�������폜�B



������
1. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

2. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���(�o�C�g)

3. [IN] �ϐ��܂��́A���l�@�F�@type
�@�@�O���w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@use3dflag
�@�@�R�c�T�E���h�Ƃ��ēǂݍ��ޏꍇ�͂P���w�肵�Ă��������B
�@�@�f�t�H���g�l�͂O�D

5. [IN] �ϐ��܂��́A���l�@�F�@reverbflag
�@�@���o�[�u���I���ɂ������Ƃ��͂P��
�@�@�I�t�ɂ������Ƃ��͂O���w�肵�Ă��������B

6. [IN] �ϐ��܂��́A���l�@�F�@bufnum
�@�@�����h�c�̃T�E���h�𓯎��ɂ����d�˂čĐ��ł��邩���w�肵�܂��B

7. [OUT] �ϐ��@�F�@soundid
�@�@�쐬�������f�[�^�����ʂ���ԍ����������܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.3.0.0�Ŏd�l�ύX<BR>
      ver5.3.0.3�Ŋg��<BR>
      ver5.3.1.6�ŏC��<BR>
      <BR>
      

%index
E3DTwistBone
�{�[�����c�C�X�g���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@jointno
p5 : [IN] �ϐ��܂��́A���l�@�F�@twistdeg

%inst
�{�[�����c�C�X�g���܂��B

�w�肵���W���C���g�ƁA���̐e�̃W���C���g�̃x�N�g�������Ƃ��āA��]���܂��B

boneno�����Ɏw�肵���W���C���g��
�e�̃W���C���g���Ȃ��ꍇ�́A
���̊֐����Ă�ł��A
�������ʂ͂���܂���B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ�

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@���삷�郂�[�V�����̃t���[���ԍ�

4. [IN] �ϐ��܂��́A���l�@�F�@jointno
�@�@�W���C���g�����ʂ���ԍ�
�@�@E3DGetPartNoByName�ȂǂŎ擾�����l��A
�@�@E3DGetJointInfo�Ŏ擾�����V���A���ԍ����w�肵�Ă��������B
�@�@�W���C���g�ȊO�̃p�[�c�̔ԍ����w�肷���
�@�@�G���[�ɂȂ�܂��B


5. [IN] �ϐ��܂��́A���l�@�F�@twistdeg
�@�@twistdeg �x�����A�c�C�X�g���܂��B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DGetBoneQ
�{�[���̃N�H�[�^�j�I�����擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p5 : [IN] ���l�܂��́A�ϐ��@�F�@kind
p6 : [IN][OUT] ���l�܂��́A�ϐ��@�F�@qid

%inst
�{�[���̃N�H�[�^�j�I�����擾���܂��B

kind�����̒l�ɂ��A
�e�̃N�H�[�^�j�I���̉e�����󂯂����̂ƁA
�󂯂Ă��Ȃ����̂��擾�ł��܂��B

���[�V������ǂݍ���ł��Ȃ��Ƃ��́A
�G���[�ɂȂ�܂��B

�w�肵��frameno�ɁA�L�[�t���[�����Ȃ��ꍇ�́A
��Ԍv�Z�������ʂ��擾���܂��B

�G���h�W���C���g�i�q���������Ȃ��W���C���g�j
�ɑ΂��Ă��A�ĂԂ��Ƃ��o���܂��B

�{�[���ȊO�̔ԍ���boneno�ɓ�����
�G���[�ɂȂ�܂��B

�}���`���C���[���[�V�������g�p����ꍇ��
���̖��߂͎g���܂���B
E3DGetCurrentBoneQ�����g�����������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetBoneNoByName�܂��́A
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@�t���[���̔ԍ����w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@kind
�@�@�e�̉e�����󂯂��N�H�[�^�j�I����
�@�@�擾����ꍇ�́A�P���w�肵�Ă��������B

�@�@�e�̉e�����󂯂Ă��Ȃ��N�H�[�^�j�I����
�@�@�擾����ꍇ�́A�O���w�肵�Ă��������B

�@�@�e�̉e�����󂯁A
�@�@�X�ɁA���f���S�̂̌����̉e�����󂯂��N�H�[�^�j�I�����擾
�@�@����ɂ́A�Q���w�肵�Ă��������B


6. [IN][OUT] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���ԍ��B
�@�@E3DCreateQ�Ŏ擾�����ԍ����w�肵�Ă��������B

�@�@qid�Ŏ��ʂ����N�H�[�^�j�I���̓��e�ɁA
�@�@�w�肵���{�[���̃N�H�[�^�j�I���̓��e���A
�@�@������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetBoneQ
�{�[���̃N�H�[�^�j�I�����Z�b�g���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p5 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p6 : [IN] ���l�܂��́A�ϐ��@�F�@curboneonly

%inst
�{�[���̃N�H�[�^�j�I�����Z�b�g���܂��B

�w�肵���t���[���ɁA���[�V�����|�C���g�����݂��Ȃ��ꍇ�́A
�����I�ɁA���[�V�����|�C���g���쐬������A
�N�H�[�^�j�I�����Z�b�g���܂��B

E3DFillUpMotion���Ăяo���Ȃ��ƁA
���̃t���[���ɂ́A���f����܂���B

ver5.4.0.0��curboneonly�t���O��ǉ����܂����B
���̃t���O���O�̂Ƃ��i���܂łƓ�������j�́A�N�H�[�^�j�I�����Z�b�g������A�e�ɂ����̂ڂ��Ďp���̌v�Z�����܂��B
���̌v�Z��E3DFillUpMotion�ł��s����̂ŁA�����̃{�[����SetBoneQ������Ƃ��Ȃ�̃^�C�����X�ɂȂ�܂��B
curboneonly�ɂP���Z�b�g����Ƃ��̌v�Z���X�L�b�v���܂��B
curboneonly�ɂP���Z�b�g���đ����̃{�[���̐ݒ���s������ɁA���E3DFillUpMotion������Ηǂ����ƂɂȂ�܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetBoneNoByName�܂��́A
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@�t���[���̔ԍ����w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���ԍ��B
�@�@E3DCreateQ�Ŏ擾�����ԍ����w�肵�Ă��������B

�@�@qid�Ŏ��ʂ����N�H�[�^�j�I���̓��e���A
�@�@�{�[���̎p���ɃZ�b�g���܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@curboneonly
�@�@�O�q�����ǂ݉������B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.4.0.0�Ŋg��<BR>
      

%index
E3DIsSoundPlaying
�����Đ������ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@playing

%inst
�����Đ������ǂ����𒲂ׂ܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ԍ����A�w�肵�܂��B

2. [OUT] �ϐ��@�F�@playing
�@�@�Đ����̏ꍇ�͂P���A
�@�@�����łȂ��ꍇ�͂O���A�������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DIKTranslate
�h�j�ŁA�{�[���̈ʒu���ړ����܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p5 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p6 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p7 : [IN] ���l�܂��́A�ϐ��@�F�@posz

%inst
�h�j�ŁA�{�[���̈ʒu���ړ����܂��B
RokDeBone2�̂s�{�^���Ɠ��l�ɁA
��Ԑe�̃{�[���ȊO�ŁA���̊֐����ĂԂƁA
���f���̌`�󂪁A����܂��B
�`���ۂ������ꍇ�́AE3DIKRotateBeta���g�p���Ă��������B

�ʒu�ɂ́A�O���[�o�����W���w�肵�Ă��������B

���[�V������ǂݍ���ł��Ȃ��ƁA�G���[�ɂȂ�܂��B

frameno�ɁA���[�V�����|�C���g���Ȃ��ꍇ�́A
�����I�ɍ쐬������ɁA�ړ����Z�b�g���܂��B

�W���C���g�ȊO�ɑ΂��ČĂԂƃG���[�ɂȂ�܂��B

���̃t���[���ɂ��A���ʂ𔽉f���������ꍇ�́A
E3DFillUpMotion���Ă�ł��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetBoneNoByName�܂��́A
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@�t���[���̔ԍ����w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@posx
6. [IN] ���l�܂��́A�ϐ��@�F�@posy
7. [IN] ���l�܂��́A�ϐ��@�F�@posz
�@�@�{�[�����ړ����������O���[�o�����W���A
�@�@�iposx, posy, posz�j�Ŏw�肵�܂��B
�@�@�����B




�o�[�W���� : ver1.0.0.1

%index
E3DSetUVTile
�ЂƂ̉摜�ɁA�^�C���摜��~���l�߂��e�N�X�`���́A�t�u���W���A�^�C���ԍ��ŁA�Z�b�g�ł��܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@texrule
p4 : [IN] ���l�܂��́A�ϐ��@�F�@unum
p5 : [IN] ���l�܂��́A�ϐ��@�F�@vnum
p6 : [IN] ���l�܂��́A�ϐ��@�F�@tileno

%inst
�ЂƂ̉摜�ɁA�^�C���摜��~���l�߂��e�N�X�`���́A�t�u���W���A�^�C���ԍ��ŁA�Z�b�g�ł��܂��B

�^�C����̃e�N�X�`���摜�ƃ^�C���ԍ��̑Ή��́A(Link http://www5d.biglobe.ne.jp/~ochikko/e3dhsp_texturetile.htm )�^�C���ԍ��̐������������������B


�^�C���̐���12�̏ꍇ�́A
�^�C���̔ԍ��́A�O����P�P�ɂȂ�܂����A
������傫�Ȓl�⏬���Ȓl���w�肷�邱�Ƃ��\�ł��B

�Ⴆ�΁A�^�C���̐���12�̏ꍇ�A
�P�Q���w�肷��ƁA
�^�C���ԍ��O���\������A
13���w�肷��ƁA
�^�C���ԍ��P���\������A
-1���w�肷��ƁA
�^�C���ԍ��P�P���\�������Ƃ������
�@�\���܂��B



5��ނ̓��e�A�\��t�����T�|�[�g���܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�\���p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@texrule
�@�@���e�A�\��t���̃��[�h���w�肵�܂��B

�@�@�O���w�肷��ƁA�w�����e
�@�@�P���w�肷��ƁA�x�����e
�@�@�Q���w�肷��ƁA�y�����e
�@�@�R���w�肷��ƁA�~���\��t��
�@�@�S���w�肷��ƁA���\��t��
�@�@�ł��B


4. [IN] ���l�܂��́A�ϐ��@�F�@unum
�@�@�e�N�X�`���̃^�C���摜��
�@�@�������̌����w�肵�Ă��������B

5. [IN] ���l�܂��́A�ϐ��@�F�@vnum
�@�@�e�N�X�`���̃^�C���摜��
�@�@�c�����̌����w�肵�Ă��������B

6. [IN] ���l�܂��́A�ϐ��@�F�@tileno
�@�@�\���������^�C���̔ԍ����w�肵�Ă��������B
�@�@�^�C���ԍ��ɂ��ẮA���L�����ǂ݂��������B



�o�[�W���� : ver1.0.0.1

%index
E3DImportMQOFileAsGround
hsid�ɓǂݍ��ݍς̒n�ʃf�[�^�ɁA
filename�Ŏw�肵���n�ʃf�[�^��
�C���|�[�g�i�ǉ��ǂݍ��݁j���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@filename
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@mult
p5 : [IN] �ϐ��܂��́A���l�@�F�@offsetx
p6 : [IN] �ϐ��܂��́A���l�@�F�@offsety
p7 : [IN] �ϐ��܂��́A���l�@�F�@offsetz
p8 : [IN] �ϐ��܂��́A���l�@�F�@rotx
p9 : [IN] �ϐ��܂��́A���l�@�F�@roty
p10 : [IN] �ϐ��܂��́A���l�@�F�@rotz

%inst
hsid�ɓǂݍ��ݍς̒n�ʃf�[�^�ɁA
filename�Ŏw�肵���n�ʃf�[�^��
�C���|�[�g�i�ǉ��ǂݍ��݁j���܂��B







������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�ǂݍ��ݍς̒n�ʃ��f�������ʂ���ԍ���
�@�@�w�肵�Ă��������B

2. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ǂݍ��ށAmqo �t�@�C�����B

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV���W�𐳋K���������Ƃ��͂P���A
�@�@�����łȂ��Ƃ��́A�O���w�肵�Ă��������B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


4. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|���鐔�l�B
�@�@���W�l�@���@mult�Ōv�Z����܂��B
�@�@���{�͂P�D�O�B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@offsetx
6. [IN] �ϐ��܂��́A���l�@�F�@offsety
7. [IN] �ϐ��܂��́A���l�@�F�@offsetz
�@�@�ǂݍ��݈ʒu�̃I�t�Z�b�g���W���A
�@�@�ioffsetx, offsety, offsetz�j�Ŏw�肵�܂��B
�@�@���[�J�����W�Ŏw�肵�܂��B
�@�@�����B

8. [IN] �ϐ��܂��́A���l�@�F�@rotx
9. [IN] �ϐ��܂��́A���l�@�F�@roty
10. [IN] �ϐ��܂��́A���l�@�F�@rotz
�@�@�ǉ��`����A�w�C�x�C�y���ꂼ��̎��ɑ΂��āA
�@�@rotx, roty, rotz�x�����A��]���Ă���A
�@�@�C���|�[�g���s���܂��B
�@�@��]�����́A�y�C�x�C�w�̏��Ԃł��B
�@�@�����B

�p�����[�^�̓K�p�����́A
�܂��A�{�����|���āA
���ɁA��]�����āA
�Ō�ɁA�ړ����܂��B


�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DLoadMQOFileAsMovableAreaFromBuf
�ړ��\�̈���`����f�[�^���A����������ǂݍ��݂܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��@�F�@buf
p2 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p3 : [IN] �ϐ��܂��́A���l�@�F�@mult
p4 : [OUT] �ϐ��@�F�@hsid

%inst
�ړ��\�̈���`����f�[�^���A����������ǂݍ��݂܂��B

����������ǂݍ��ނ��ƈȊO�́A
E3DLoadMQOFileAsMovableArea
�Ɠ����ł��B
E3DLoadMQOFileAsMovableArea
�̐��������ǂ݂��������B

����������ǂݍ��ގ菇�́A
sdim buf0, 500000 ;�t�@�C���T�C�Y���傫��
bload �t�@�C����, buf0
bufsize = strsize

E3DLoadMQOFileAsMovableAreaFromBuf
buf0, bufsize, mult100, hsid

�Ƃ�������ɂȂ�܂��B






������
1. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

2. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

3. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|���鐔�l�B
�@�@���W�l�@���@mult �Ōv�Z����܂��B
�@�@���{�͂P�D�O�B
�@�@�����B

4. [OUT] �ϐ��@�F�@hsid
�@�@�쐬�����ǃf�[�^�����ʂ���hsid���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkThreadWorking
�֐��̍Ō�ɁAThread���t���Ă���֐��́A�V���ɃX���b�h���쐬���܂��B
%group
Easy3D For HSP3 : �X���b�h�Ǘ�

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@threadid
p2 : [OUT] �ϐ��@�F�@working
p3 : [OUT] �ϐ��@�F�@returnval1
p4 : [OUT] �ϐ��@�F�@returnval2

%inst
�֐��̍Ō�ɁAThread���t���Ă���֐��́A�V���ɃX���b�h���쐬���܂��B

���̍쐬�����X���b�h���A
���݁A���쒆�ł��邩�ǂ������`�F�b�N���邽�߂̊֐��ł��B

�X���b�h���I�����Ă���ꍇ�ɂ́A
�X���b�h�̓��쌋�ʂ��A
returnval1, reteurnval2�ϐ��Ŏ擾�ł��܂��B
���̕ϐ��́Ahsid��A���[�V�����h�c���擾���邽�߂ɁA�g�p���܂��B

�X���b�h�ǂݍ��݊֐��ɁA���݂��Ȃ��t�@�C�����Ȃǂ��w�肵���ꍇ�Ȃǂ́A�G���[�ɂȂ炸�ɁA
hsid���������������-1����������̂Œ��ӂ��Ă��������B


��̓I�Ȏg�p��́A
e3dhsp3_LoadByNewThread.hsp
���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@threadid
�@�@�X���b�h�����ʂ���h�c
�@�@���O�̍Ō��Thread���t���Ă���֐��ŁA
�@�@�擾�����h�c���w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@working
�@�@�X���b�h���A���쒆���ǂ������������܂��B
�@�@���쒆�̏ꍇ�͂P���A
�@�@���삪�I�����Ă���ꍇ�ɂ͂O���A�������܂��B

�@�@working���O�̏ꍇ�́A
�@�@returnval1, returnval2�ɑ�������l���A
�@�@�Ӗ��������܂��B

3. [OUT] �ϐ��@�F�@returnval1
4. [OUT] �ϐ��@�F�@returnval2
�@�@�X���b�h�̎��s���ʂ��A�������܂��B
�@�@returnval1, returnval2�ɑ�������l��
�@�@�Ӗ��ɂ��ẮA
�@�@�eThread�쐬�֐��̐��������ǂ݂��������B




�o�[�W���� : ver1.0.0.1

%index
E3DLoadMQOFileAsGroundThread
�X���b�h���쐬���āAE3DLoadMQOFileAsGround�����s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@mult
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p4 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadMQOFileAsGround�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B

�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

html{
<strong>
</strong>
}htmlver5.0.0.7����͖��߂��ƂɈقȂ�f�B���N�g���Ƀe�N�X�`���������Ă��ǂݍ��߂�悤�ɂȂ�܂����B

E3DLoadMQOFileAsGround�̐��������ǂ݂��������B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ǂݍ��ށAmqo �t�@�C�����B

2. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|���鐔�l�B
�@�@���W�l�@���@mult �Ōv�Z����܂��B
�@�@���{�͂P�D�O�B
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV���W�𐳋K���������Ƃ��͂P���A
�@�@�����łȂ��Ƃ��́A�O���w�肵�Ă��������B
�@�@�����w�肵�Ȃ��Ƃ��́A�O�Ƃ��Ĉ����܂��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


4. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DSigLoadThread
�X���b�h���쐬���āAE3DSigLoad�����s���܂��B
%group
Easy3D For HSP3 : �`��f�[�^

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p2 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p3 : [IN] �ϐ��܂��́A���l�@�F�@mult
p4 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DSigLoad�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

html{
<strong>
</strong>
}htmlver5.0.0.7����͖��߂��ƂɈقȂ�f�B���N�g���Ƀe�N�X�`���������Ă��ǂݍ��߂�悤�ɂȂ�܂����B


E3DSigLoad�̐������A���ǂ݂��������B




������
1. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.sig �̃p�X������B

2. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


3. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@���{�͂P�D�O�B
�@�@�����B

4. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B




�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DSigLoadFromBufThread
�X���b�h���쐬���āAE3DSigLoadFromBuf�����s���܂��B
%group
Easy3D For HSP3 : �`��f�[�^

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ������܂��́A������̕ϐ��@�F�@resdir
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p4 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p5 : [IN] �ϐ��܂��́A���l�@�F�@mult
p6 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DSigLoadFromBuf�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j      E3DFreeThread�̐������������������B

�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

html{
<strong>
</strong>
}htmlver5.0.0.7����͖��߂��ƂɈقȂ�f�B���N�g���Ƀe�N�X�`���������Ă��ǂݍ��߂�悤�ɂȂ�܂����B


E3DSigLoadFromBuf�̐��������ǂ݂��������B




������
1. [IN] ������܂��́A������̕ϐ��@�F�@resdir
�@�@�e�N�X�`���[�̂���t�H���_ �̃p�X������B
�@�@�Ō�ɁA&quot;\\&quot;���K�v�B

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

3. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

4. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


5. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�{�����w�肵�Ă��������B
�@�@�f�t�H���g��1.0�ł��B
�@�@���{�́A�P�D�O�B
�@�@�����B

6. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DLoadMQOFileAsMovableAreaThread
�X���b�h���쐬���āAE3DLoadMQOFileAsMovableArea�����s���܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@mult
p3 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadMQOFileAsMovableArea�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j      E3DFreeThread�̐������������������B

�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

E3DLoadMQOFileAsMovableArea�̐��������ǂ݂��������B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ǂݍ��ށAmqo �t�@�C�����B

2. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|���鐔�l�B
�@�@���W�l�@���@mult �Ōv�Z����܂��B
�@�@���{�͂P�D�O�B
�@�@�����B

3. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DLoadMQOFileAsMovableAreaFromBufThread
�X���b�h���쐬���āAE3DLoadMQOFileAsMovableAreaFromBuf�����s���܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��@�F�@buf
p2 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p3 : [IN] �ϐ��܂��́A���l�@�F�@mult
p4 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadMQOFileAsMovableAreaFromBuf�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j      E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

E3DLoadMQOFileAsMovableAreaFromBuf�̐��������ǂ݂��������B



������
1. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

2. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

3. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|���鐔�l�B
�@�@���W�l�@���@mult �Ōv�Z����܂��B
�@�@���{�͂P�D�O�B
�@�@�����B

4. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B





�o�[�W���� : ver1.0.0.1

%index
E3DLoadGroundBMPThread
�X���b�h���쐬���āAE3DLoadGroundBMP�����s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10
p1 : [IN] ������܂��́A������ϐ��@�F�@filename1
p2 : [IN] ������܂��́A������ϐ��@�F�@filename2
p3 : [IN] ������܂��́A������ϐ��@�F�@filename3
p4 : [IN] ������܂��́A������ϐ��@�F�@filename4
p5 : [IN] �ϐ��܂��́A���l�@�F�@maxx
p6 : [IN] �ϐ��܂��́A���l�@�F�@maxz
p7 : [IN] �ϐ��܂��́A���l�@�F�@divx
p8 : [IN] �ϐ��܂��́A���l�@�F�@divz
p9 : [IN] �ϐ��܂��́A���l�@�F�@maxheight
p10 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadGroundBMP�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

E3DLoadGroundBMP�̐��������ǂ݂��������B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename1
�@�@�n�ʂ̍��W���̌��ƂȂ�A�a�l�o�t�@�C����

2. [IN] ������܂��́A������ϐ��@�F�@filename2
�@�@�n�ʂ̓��̏��̌��ƂȂ�A�a�l�o�t�@�C����

3. [IN] ������܂��́A������ϐ��@�F�@filename3
�@�@�n�ʂ̐�̏��̌��ƂȂ�A�a�l�o�t�@�C����

4. [IN] ������܂��́A������ϐ��@�F�@filename4
�@�@�n�ʁA���A��̖͗l�����߂�A�a�l�o�t�@�C����

5. [IN] �ϐ��܂��́A���l�@�F�@maxx
�@�@�n�ʂ̂w���W�̍ő�l
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@maxz
�@�@�n�ʂ̂y���W�̍ő�l
�@�@�����B

7. [IN] �ϐ��܂��́A���l�@�F�@divx
�@�@X�����̕�����

8. [IN] �ϐ��܂��́A���l�@�F�@divz
�@�@Z�����̕�����

9. [IN] �ϐ��܂��́A���l�@�F�@maxheight
�@�@�n�ʂ̍����̍ő�l
�@�@�����B

10. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DLoadGndFileThread
�X���b�h���쐬���āAE3DLoadGNDFile�����s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p2 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p3 : [IN] �ϐ��܂��́A���l�@�F�@mult
p4 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadGNDFile�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j      E3DFreeThread�̐������������������B

�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

html{
<strong>
</strong>
}htmlver5.0.0.7����͖��߂��ƂɈقȂ�f�B���N�g���Ƀe�N�X�`���������Ă��ǂݍ��߂�悤�ɂȂ�܂����B


E3DLoadGNDFile�̐��������ǂ݂��������B



������
1. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.gnd �̃p�X������B

2. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


3. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@���{�͂P�D�O�B
�@�@�����B

4. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      

%index
E3DLoadGndFileFromBufThread
�X���b�h���쐬���āAE3DLoadGNDFileFromBuf�����s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ������܂��́A������̕ϐ��@�F�@resdir
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p4 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p5 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadGNDFileFromBuf�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B


html{
<strong>
</strong>
}htmlver5.0.0.7����͖��߂��ƂɈقȂ�f�B���N�g���Ƀe�N�X�`���������Ă��ǂݍ��߂�悤�ɂȂ�܂����B


E3DLoadGNDFileFromBuf�̐��������ǂ݂��������B



������
1. [IN] ������܂��́A������̕ϐ��@�F�@resdir
�@�@�e�N�X�`���[�̂���t�H���_ �̃p�X������B
�@�@�Ō�ɁA&quot;\\&quot;���K�v�B

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

3. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

4. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


5. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DAddMotionThread
�X���b�h���쐬���āAE3DAddMotion�����s���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p3 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DAddMotion�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S����4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���[�V�����������ʂ���ID���������܂��B
returnval2�ɁA
�ő�t���[���ԍ����������܂��B

���̊֐����I������܂ŁA
���̊֐��ɓn����hsid�ɑ΂��āA
���[�V�����̍Đ����߂Ȃǂ́A�g��Ȃ��悤�ɂ��Ă��������B


E3DAddMotion�̐��������ǂ݂��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�ǂ̃��f���f�[�^�ɑ΂��郂�[�V���������w�肷��B

2. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.qua�̃p�X������B

3. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DAddMotionFromBufThread
�X���b�h���쐬���āAE3DAddMotionFromBuf�����s���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@datakind
p3 : [IN] �ϐ��@�F�@buf
p4 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p5 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DAddMotionFromBuf�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S����4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���[�V�����������ʂ���ID���������܂��B
returnval2�ɁA
�ő�t���[���ԍ����������܂��B

���̊֐����I������܂ŁA
���̊֐��ɓn����hsid�ɑ΂��āA
���[�V�����̍Đ����߂Ȃǂ́A�g��Ȃ��悤�ɂ��Ă��������B


E3DAddMotionFromBuf�̐��������ǂ݂��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���hsid

2. [IN] �ϐ��܂��́A���l�@�F�@datakind
�@�@qua�f�[�^�̎��͂O���A
�@�@mot�f�[�^�̎��͂P���w�肵�Ă��������B

3. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

4. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

5. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���h�c���A�������܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DGetShaderType
�V�F�[�_�[�̎�ނƁA�I�[�o�[�t���[�������擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@shader
p3 : [OUT] �ϐ��@�F�@overflow

%inst
�V�F�[�_�[�̎�ނƁA�I�[�o�[�t���[�������擾���܂��B

���ꂼ��̒l�̈Ӗ��́A
E3DSetShaderType�̐��������ǂ݂��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���hsid

2. [OUT] �ϐ��@�F�@shader
3. [OUT] �ϐ��@�F�@overflow
�@�@�V�F�[�_�[�̎�ނƁA
�@�@�I�[�o�[�t���[�������A�������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetShaderType
�V�F�[�_�[�̎�ނƁA
�F�̃I�[�o�[�t���[������ݒ肵�܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@shader
p3 : [IN] �ϐ��܂��́A���l�@�F�@overflow

%inst
�V�F�[�_�[�̎�ނƁA
�F�̃I�[�o�[�t���[������ݒ肵�܂��B

�V�F�[�_�[�̎�ނ́A
e3dhsp3.as��COL_ �Ŏn�܂�萔�ŁA��`����Ă��܂��B

COL_OLD
�@�@�]����RokDeBone2�̌v�Z�@
�@�@emissive�́A�����B
�@�@�X�y�L�����[�́A�`�����̎����B
�@�@��ԍ����B
COL_PHONG
�@�@Lambert�̃f�B�t�[�Y
�@�@Phong�̃X�y�L�����[
�@�@emissive�L��
COL_BLINN
�@�@Lambert�̃f�B�t�[�Y
�@�@Blinn�̃X�y�L�����[
�@�@emissive�L��
COL_SCHLICK
�@�@Lambert�̃f�B�t�[�Y
�@�@Schlick�̃X�y�L�����[
�@�@emissive�L��
COL_MQCLASSIC
�@�@���^�Z�R�C�A�̃}�e���A����
�@�@Classic���w�肵���Ƃ��̃��[�h
�@�@emissive�L��

COL_TOON1
�@�@�s�N�Z���V�F�[�_�[���g�p�����g�D�[���\���B
COL_PPHONG
�@�@�s�N�Z���V�F�[�_�[���g�p����Phong�\���B


�F�̃I�[�o�[�t���[�����́A
e3dhsp3.as��OVERFLOW_ �Ŏn�܂�萔�ŁA
��`����Ă��܂��B

OVERFLOW_CLAMP
�@�@�N�����v�B
�@�@���ȏƖ��������ƁA�F���j�]����B
�@�@��ԍ����B
OVERFLOW_SCALE
�@�@�X�P�[���B�F�͔j�]���Ȃ����A�Â��Ȃ�B
OVERFLOW_ORG
�@�@�I���W�i���B���邳��ۂB


ver3.0.0.1�ł̎d�l�ύX�ɂ��A���݂́ACOL_PHONG��COL_TOON1��COL_TOON0�݂̂̃T�|�[�g�ƂȂ�܂��iver3.0.3.4���݁j

ver5.2.1.5��COL_PPHONG��ǉ����܂����B

ver5.2.2.0��COL_TOON1��COL_TOON0�͓�������COL_TOON1�ƂȂ�܂����B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���hsid

2. [IN] �ϐ��܂��́A���l�@�F�@shader
3. [IN] �ϐ��܂��́A���l�@�F�@overflow
�@�@�V�F�[�_�[�̎�ނƁA
�@�@�I�[�o�[�t���[�����̎w������܂��B
�@�@�l�̈Ӗ��́A���L���������������B



�o�[�W���� : ver1.0.0.1<BR>
      ver5.2.1.5�Ŋg��

%index
E3DSetLightBlendMode
���_��diffuse�F�ƁA���C�g�F���u�����f�B���O����ۂ́A���@��ݒ肵�܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@lid
p2 : [IN] �ϐ��܂��́A���l�@�F�@mode

%inst
���_��diffuse�F�ƁA���C�g�F���u�����f�B���O����ۂ́A���@��ݒ肵�܂��B
�u�����h�����ɂ́APhotoShop�̃u�����h���[�h���g���܂��B


mode�����ɂ́ALBLEND_�Ŏn�܂�萔���g�p���܂��B
�����̒萔�́Ae3dhsp3.as�Œ�`����Ă��܂��B

LBLEND_MULT
�@�@��Z
LBLEND_SCREEN
�@�@�X�N���[��
LBLEND_OVERLAY
�@�@�I�[�o�[���C
LBLEND_HARDLIGHT
�@�@�n�[�h���C�g
LBLEND_DODGE
�@�@�����Ă�





������
1. [IN] �ϐ��܂��́A���l�@�F�@lid
�@�@���C�g�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@mode
�@�@�u�����h���[�h���w�肵�܂��B
�@�@LBLEND_ �Ŏn�܂�萔���g�p���܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DGetLightBlendMode
���_��diffuse�F�ƁA���C�g�F�Ƃ̃u�����h���[�h���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@lid
p2 : [OUT] �ϐ��@�F�@mode

%inst
���_��diffuse�F�ƁA���C�g�F�Ƃ̃u�����h���[�h���擾���܂��B

�擾����郂�[�h�̐��l�́A
e3dhsp3.as�Œ�`����Ă���
LBLEND_�Ŏn�܂�萔�ł��B

�ڂ����́AE3DSetLightBlendMode�����ǂ݂��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@lid
�@�@���C�g�����ʂ���h�c

2. [OUT] �ϐ��@�F�@mode
�@�@�u�����h���[�h���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetEmissive
�p�[�c��emissive�F���Z�b�g����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@R
p4 : [IN] ���l�܂��́A�ϐ��@�F�@G
p5 : [IN] ���l�܂��́A�ϐ��@�F�@B
p6 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p7 : [IN] ���l�܂��́A�ϐ��@�F�@vertno

%inst
�p�[�c��emissive�F���Z�b�g����֐��ł��B

�w�肵���F���A
���̂܂ܐݒ�A��Z���Đݒ�A���Z���Đݒ�A
���Z���Đݒ�́A4��ޏo���܂��B

���̎��_�ŁA�\������Ă���F�ɑ΂��āA
��Z�A���Z�A���Z���܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɐF���Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@R
4. [IN] ���l�܂��́A�ϐ��@�F�@G
5. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�w�肵�����_�ԍ��̐F���Z�b�g���܂��B
�@�@���̈������ȗ��A�܂��́A-1���Z�b�g�����ꍇ�ɂ́A
�@�@partno�Ŏw�肵���p�[�c�S�̂̐F�̐ݒ�����܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetSpecularPower
�p�[�c��specular power���Z�b�g����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@pow
p4 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p5 : [IN] ���l�܂��́A�ϐ��@�F�@vertno

%inst
�p�[�c��specular power���Z�b�g����֐��ł��B

�w�肵���F���A
���̂܂ܐݒ�A��Z���Đݒ�A���Z���Đݒ�A
���Z���Đݒ�́A4��ޏo���܂��B

���̎��_�ŁA�\������Ă���F�ɑ΂��āA
��Z�A���Z�A���Z���܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F��ݒ�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@�S�Ẵp�[�c�ɐF���Z�b�g�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@pow
�@�@�����B
�@�@pow �̒l���Asetflag�Ɋ�Â��āA
�@�@���݂̐F�ɑ΂��ď������s���܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�w�肵���l���Z�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@���݂̒l�ɁA�w�肵���l����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@���݂̒l�ɁA�w�肵���l�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@���݂̒l�ɁA�w�肵���l�����Z���܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�w�肵�����_�ԍ��̐F���Z�b�g���܂��B
�@�@���̈������ȗ��A�܂��́A-1���Z�b�g�����ꍇ�ɂ́A
�@�@partno�Ŏw�肵���p�[�c�S�̂̐F�̐ݒ�����܂��B




�o�[�W���� : ver1.0.0.1

%index
E3DGetEmissive
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aemissive�F���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@r
p5 : [OUT] �ϐ��@�F�@g
p6 : [OUT] �ϐ��@�F�@b

%inst
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aemissive�F���擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F���擾�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�F���擾���������_�̔ԍ����w�肵�܂��B

4. [OUT] �ϐ��@�F�@r
5. [OUT] �ϐ��@�F�@g
6. [OUT] �ϐ��@�F�@b
�@�@�@�w�肵�����_��emissive�F���A
�@�@�@RGB = ( r, g, b )�ɑ������܂��B
�@�@�@r, g, b���ꂼ��A�O����Q�T�T�̒l���������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetSpecularPower
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aspecular power���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@pow

%inst
�C�ӂ̃p�[�c�̔C�ӂ̒��_�́Aspecular power���擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̐F���擾�ł��܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�F���擾���������_�̔ԍ����w�肵�܂��B

4. [OUT] �ϐ��@�F�@pow
�@�@�@�w�肵�����_��specular power���A
�@�@�@�������܂��B
�@�@����1�^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetInfElemNum
�w�肵�����_���A���̃{�[���̉e�����󂯂Ă��邩���擾���܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [OUT] �ϐ��@�F�@num

%inst
�w�肵�����_���A���̃{�[���̉e�����󂯂Ă��邩���擾���܂��B

�e���x���́A�e�����󂯂�{�[�����Ƃɑ��݂��܂��B
�i�e�����󂯂�{�[���̐��������݂��܂��j

���̉e���x���̂��Ƃ��A
Easy3D�ł́AInfElem�ƌĂт܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�̔ԍ�

4. [OUT] �ϐ��@�F�@num
�@�@�e���x���̌����������܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DGetInfElem
�w�肵�����_�́A�{�[���e���x�����擾���܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@infno
p5 : [OUT] �ϐ��@�F�@childjointno
p6 : [OUT] �ϐ��@�F�@calcmode
p7 : [OUT] �ϐ��@�F�@userrate
p8 : [OUT] �ϐ��@�F�@orginf
p9 : [OUT] �ϐ��@�F�@dispinf

%inst
�w�肵�����_�́A�{�[���e���x�����擾���܂��B

infno�ɂ́A
E3DGetInfElemNum�Ŏ擾�������l��infnum�Ƃ���ƁA
0����(infnum - 1)�̒l��n���Ă��������B


childjointno��0�ȉ��i�O���܂ށj�̐��l���擾���ꂽ�ꍇ�ɂ́A���̃f�[�^�̓_�~�[�f�[�^�ł��̂ŁA��������悤�ɂ��Ă��������B



calcmode�̈Ӗ�
calcmode�́A�e���x�̌v�Z���@��\���܂��B
e3dhsp3.as���Œ�`����Ă���CALCMODE_�Ŏn�܂�萔���g�p���܂��B
�ȉ��̂悤�ɒ�`����Ă��܂��B
#define CALCMODE_NOSKIN0 0
define CALCMODE_ONESKIN0	1
define CALCMODE_ONESKIN1	2
define CALCMODE_DIRECT0	3
#define CALCMODE_SYM 4
NOSKIN0�́A�X�L�j���O�����B
ONESKIN0�́A�����Ɗp�x�ɂ��X�L�j���O�B
ONESKIN1�́A�����݂̂ɂ��X�L�j���O�B
DIRECT0�́A���ڐ��l�w��B
SYM�́A�Ώ̃R�s�[�ɂ��w��B
��\���܂��B



Easy3D�����ł̉e���x�̌v�Z���@
�e���x���Z�o����ۂɂ́A
orginf, dispinf, userrate, normalizeflag���g���܂��B
orginf�́Acalcmode�Ŏw�肵�����@�ŁA�Z�o�����e���x�B
userrate�́A��d�B
normalizeflag�́A���K���i��̒��_�̉e���x�̍��v���P�ɂȂ�悤�ɂ���j�����邩�ǂ����̃t���O�B
html{
<strong>dispinf���A�ŏI�I�ȁA�e���x�B</strong>
}html
�܂��AInfElem���ƂɁA�ȉ��̌v�Z�����܂��B
orginf * userrate / 100
normalizeflag���O�̂Ƃ��́A���̒l�����̂܂܁Adispinf�ɂȂ�܂��B
normalizeflag���P�̂Ƃ��́A
�S����InfElem�̉e���x�idispinf�j�̍��v���P�ɂȂ�悤�ɁA���K�����܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�̔ԍ�

4. [IN] ���l�܂��́A�ϐ��@�F�@infno
�@�@�e���x���̔ԍ�
�@�@�O����i�e���x�̌�-1�j�܂ł̐�

5. [OUT] �ϐ��@�F�@childjointno
�@�@�ǂ̃{�[���̉e�����󂯂邩���������܂��B
�@�@���̒l���A0�ȉ��̒l�̎��́A�_�~�[�f�[�^�ł��B
�@�@�{�[���̐����̓��A�q���̕��̃W���C���g�̔ԍ���
�@�@�������܂��B

6. [OUT] �ϐ��@�F�@calcmode
�@�@�e���x�̌v�Z���@���������܂��B

7. [OUT] �ϐ��@�F�@userrate
�@�@��d���������܂��B
�@�@���l���������܂��B
�@�@�Ⴆ�΁A�P�O�O���̏ꍇ�́A100.0���������܂��B
�@�@�����B

8. [OUT] �ϐ��@�F�@orginf
9. [OUT] �ϐ��@�F�@dispinf
�@�@orginf, dispinf�̒l���������܂��B
�@�@���ꂼ��̈Ӗ��́A���L���������������B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetInfElem
���_�Ƀ{�[���e���x��ݒ肵�܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@childjointno
p5 : [IN] ���l�܂��́A�ϐ��@�F�@calcmode
p6 : [IN] ���l�܂��́A�ϐ��@�F�@paintmode
p7 : [IN] ���l�܂��́A�ϐ��@�F�@normalizeflag
p8 : [IN] ���l�܂��́A�ϐ��@�F�@userrate
p9 : [IN] ���l�܂��́A�ϐ��@�F�@directval

%inst
���_�Ƀ{�[���e���x��ݒ肵�܂��B


paintmode�̈Ӗ�
paintmode�́A�e���x�̐ݒ���@��\���܂��B
e3dhsp3.as���ŁAPAINT_�Ŏn�܂�萔�ŁA
��`����Ă��܂��B
#define PAINT_NOR 0
#define PAINT_EXC 1
#define PAINT_ADD 2
#define PAINT_SUB 3
#define PAINT_ERA 4
NOR�́A
���łɐݒ肵�Ă���e���x���ɁA�e���x�f�[�^��ǉ����܂��B
�����{�[���̏�񂪊��ɂ���ꍇ�́A�㏑�����܂��B
EXC�́A���łɐݒ肵�Ă���e���x�����A�j�����Ă���A�e���x�f�[�^��ݒ肵�܂��B
ADD�́A���łɐݒ肵�Ă���e���x�̔�d�ɁA�w�肵����d�𑫂��Z���܂��B
SUB�́A���łɐݒ肵�Ă���e���x�̔�d����A�w�肵����d�������Z���܂��B


calcmode�ɂ��ẮA
E3DGetInfElem�̐������������������B


calcmode��paintmode�̈ˑ��֌W
CALCMODE_NOSKIN0�̂Ƃ��́APAINT_EXC��ݒ肵�Ă��������B
CALCMODE_DIRECT0�̂Ƃ��́APAINT_NOR�܂��́APAINT_EXC��ݒ肵�Ă��������B


�e���x�̌v�Z���@�ɂ��ẮA
E3DGetInfElem�̐������������������B


directval�́ACALCMODE_DIRECT0�̂Ƃ��݈̂Ӗ��������܂��B���̒l��orginf�Ƃ��Đݒ肵�܂��B
���̏������w�肵�Ă��������B


�X���[�W���O�p�x�̊֌W�ȂǂŁA�����ʒu�ɕ����̒��_�����݂���ꍇ������܂��B
�����̒��_�𓯎��ɓ����悤�ɐݒ肵�Ȃ��ƁA�{�[���ό`���A����邱�Ƃ�����̂ŁA���ӂ��Ă��������B


childjointno�́A�{�[���̐����̓��̎q���̃W���C���g�̔ԍ��ł��B
childjointno�ɂ́A�K���e�����݂���W���C���g�̔ԍ����w�肵�Ă��������B
��Ԑe�̃W���C���g�́Achildjoint�ɂ́A�w��ł��܂���B


CALCMODE_SYM�̉e���x�ݒ�͂��̖��߂ł͂ł��܂���B
html{
<strong>E3DSetSymInfElem</strong>
}html�����g�����������B

���̖��߂��Ă񂾂����ł͕\���ɂ͔��f����܂���B
html{
<strong>�e���x�̕ҏW�����ׂďI�������AE3DCreateSkinMat���Ă��</strong>
}html�\���ɔ��f�����Ă��������B

PAINT_ERA�͎g���܂���B
�e���x�����������ꍇ��
E3DDeleteInfElem�����g�p���������B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�̔ԍ�

4. [IN] ���l�܂��́A�ϐ��@�F�@childjointno
�@�@�e�����󂯂�{�[���̎w��B
�@�@�{�[���̐����̓��A�q���̕��̃W���C���g�̔ԍ���
�@�@�w�肵�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@calcmode
�@�@�e���x�̌v�Z���@���w�肵�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@paintmode
�@�@�e���x�̐ݒ���@���w�肵�܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@normalizeflag
�@�@���K��������Ƃ��͂P�A
�@�@���Ȃ��Ƃ��͂O���w�肵�܂��B
�@�@�ڂ����́AE3DGetInfElem�̐��������ǂ݂��������B

8. [IN] ���l�܂��́A�ϐ��@�F�@userrate
�@�@��d���̒l���w�肵�܂��B
�@�@�P�O�O���̎��́A100.0���w�肵�܂��B
�@�@�ڂ����́AE3DGetInfElem�̐��������ǂ݂��������B
�@�@�����B

9. [IN] ���l�܂��́A�ϐ��@�F�@directval
�@�@���ڐ��l�w��̐��l���w�肵�܂��B
�@�@�ڂ����́A���L���������������B
�@�@�����B



�o�[�W���� : ver1.0.0.1

%index
E3DDeleteInfElem
�{�[���e���x�����폜���܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@childjointno
p5 : [IN] ���l�܂��́A�ϐ��@�F�@normalizeflag

%inst
�{�[���e���x�����폜���܂��B

normalizeflag�ɂP���w�肷��ƁA
�폜������ɁA
�w�蒸�_�̎c��̉e���x�����A
���K�����܂��B

���̖��߂��Ă񂾂����ł͕\���ɂ͔��f����܂���B
html{
<strong>�e���x�̕ҏW�����ׂďI�������AE3DCreateSkinMat���Ă��</strong>
}html�\���ɔ��f�����Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�̔ԍ�

4. [IN] ���l�܂��́A�ϐ��@�F�@childjointno
�@�@�e�����󂯂�{�[���̎w��B
�@�@�{�[���̐����̓��A�q���̕��̃W���C���g�̔ԍ���
�@�@�w�肵�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@normalizeflag
�@�@���K��������Ƃ��͂P�A
�@�@���Ȃ��Ƃ��͂O���w�肵�܂��B
�@�@�ڂ����́AE3DGetInfElem�̐��������ǂ݂��������B



�o�[�W���� : ver1.0.0.1

%index
E3DSetInfElemDefault
�{�[���e���x�����A�f�t�H���g��Ԃɖ߂��܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno

%inst
�{�[���e���x�����A�f�t�H���g��Ԃɖ߂��܂��B

html{
<strong>partno</strong>
}html�ɁA-1���w�肷��ƁA
�S�p�[�c�̑S���_�̉e���x��
�f�t�H���g��Ԃɖ߂��܂��B

���̖��߂��Ă񂾂����ł͕\���ɂ͔��f����܂���B
html{
<strong>�e���x�̕ҏW�����ׂďI�������AE3DCreateSkinMat���Ă��</strong>
}html�\���ɔ��f�����Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�̔ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DNormalizeInfElem
�{�[���e���x�����A���K�����܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno

%inst
�{�[���e���x�����A���K�����܂��B

�w�肵�����_�̉e���x�̍��v���P�ɂȂ�悤�ɁA�e�e���x�����v�l�Ŋ���Z���܂��B

html{
<strong>vertno</strong>
}html�ɁA-1���w�肷��ƁA
�w��p�[�c�́A�S���_�ɑ΂��āA
���K�����s���܂��B


���̖��߂��Ă񂾂����ł͕\���ɂ͔��f����܂���B
html{
<strong>�e���x�̕ҏW�����ׂďI�������AE3DCreateSkinMat���Ă��</strong>
}html�\���ɔ��f�����Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�̔ԍ�



�o�[�W���� : ver1.0.0.1

%index
E3DGetVisiblePolygonNum
������̃|���S�������擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [OUT] �ϐ��@�F�@num1
p3 : [OUT] �ϐ��@�F�@num2

%inst
������̃|���S�������擾���܂��B

html{
<strong>E3DRender�̌�ŌĂяo���Ă��������B</strong>
}html

�n�ʃf�[�^�ɑ΂��ČĂяo�����ꍇ�́A
num2�ɂ́Anum1�Ɠ������l���������܂��B


ver3.0.0.1�ł̕ύX�ŁA���̊֐��͈Ӗ��������Ȃ��Ȃ�܂����B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [OUT] �ϐ��@�F�@num1
�@�@�p�[�c�P�ʂŌv�Z����������|���S������
�@�@�������܂��B

3. [OUT] �ϐ��@�F�@num2
�@�@�N���b�s���O�A�w�ʃJ�����O���l������
�@�@�ʒP�ʂŌv�Z�����|���S�������������܂��B
�@�@�n�ʃf�[�^�̏ꍇ�́Anum1�Ɠ����l���������܂��B





�o�[�W���� : ver1.0.0.1

%index
E3DChkConfGroundPart
�n�ʂ̎w��p�[�c�ƁA�L�����N�^�[�Ƃ̓����蔻����s���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13
p1 : [IN] �ϐ��܂��́A���l�@�F�@charahsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@groundhsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@groundpart
p4 : [IN] �ϐ��܂��́A���l�@�F�@mode
p5 : [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
p6 : [IN] �ϐ��܂��́A���l�@�F�@mapminy
p7 : [OUT] �ϐ��@�F�@result
p8 : [OUT] �ϐ��@�F�@adjustx
p9 : [OUT] �ϐ��@�F�@adjusty
p10 : [OUT] �ϐ��@�F�@adjustz
p11 : [OUT] �ϐ��@�F�@nx
p12 : [OUT] �ϐ��@�F�@ny
p13 : [OUT] �ϐ��@�F�@nz

%inst
�n�ʂ̎w��p�[�c�ƁA�L�����N�^�[�Ƃ̓����蔻����s���܂��B

�n�ʂ̃p�[�c�ԍ����w�肷�鑼�́A
E3DChkConfGround�Ɠ����ł��B
E3DChkConfGround�̐��������ǂ݂��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@charahsid
�@�@�ړ�����`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@groundhsid
�@�@E3DLoadGroundBMP�A
�@�@�܂��́AE3DLoadMQOFileAsGround��
�@�@�쐬�����`��f�[�^��
�@�@���ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@groundpart
�@�@�����蔻����������n�ʂ̃p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@mode
�@�@�O���w�肷��ƁA��ԃ��[�h
�@�@�P���w�肷��ƁA�n�ʂ𔇂����[�h

5. [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
�@�@��x�̈ړ��œo�邱�Ƃ��o���鍂���̍ő�l��
�@�@�w�肵�Ă��������B
�@�@�����B

6. [IN] �ϐ��܂��́A���l�@�F�@mapminy
�@�@groundhsid�Ŏ��ʂ����f�[�^�̈�ԒႢ�x���W�̒l
�@�@�ʏ�́A0.0�ł��B
�@�@�����B

7. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@
�@�@mode == 0 �̂Ƃ�
�@�@�@�@�Ԃ���Ȃ������ꍇ�́Aresutl = 0
�@�@�@�@�Ԃ������ꍇ�́Aresult = 1
�@�@mode == 1�̂Ƃ�
�@�@�@�@�L�����N�^�[�̉��ɒn�ʂ����������ꍇ�A
�@�@�@�@�܂��́A�S���ړ����Ȃ������ꍇ�A
�@�@�@�@result = 0

�@�@�@�@diffmaxy��荂��������o�낤�Ƃ����Ƃ��A
�@�@�@�@result = 1

�@�@�@�@�n�ʂ����ɍ~�肽�Ƃ��A
�@�@�@�@�܂��́Adiffmaxy���Ⴂ������o�����Ƃ��A
�@�@�@�@result = 2

�@�@�ƂȂ�܂��B

8. [OUT] �ϐ��@�F�@adjustx
9. [OUT] �ϐ��@�F�@adjusty
10. [OUT] �ϐ��@�F�@adjustz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ��������W
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̍��W��
�@�@�@�@(adjustx, adjusty, adjustz)�ɑ������܂��B
�@�@�����^�̕ϐ��B

11. [OUT] �ϐ��@�F�@nx
12. [OUT] �ϐ��@�F�@ny
13. [OUT] �ϐ��@�F�@nz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ������|���S��
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̃|���S����
�@�@�@�@�@���x�N�g�����A
�@�@�@�@(nx, ny, nz)�ɑ������܂��B
�@�@�@�@
�@�@�@�@���˕Ԃ���������߂�Ƃ��ȂǂɁA
�@�@�@�@�g�p�ł���̂ł͂Ȃ����Ǝv���A
�@�@�@�@�����Ă݂܂����B
�@�@�@�@�����^�̕ϐ��B



�o�[�W���� : ver1.0.0.1

%index
E3DChkConfGroundPart2
�n�ʃp�[�c���w�肵�āA�����ƒn�ʂ̓����蔻����s���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18
p1 : [IN] �ϐ��܂��́A���l�@�F�@befposx
p2 : [IN] �ϐ��܂��́A���l�@�F�@befposy
p3 : [IN] �ϐ��܂��́A���l�@�F�@befposz
p4 : [IN] �ϐ��܂��́A���l�@�F�@newposx
p5 : [IN] �ϐ��܂��́A���l�@�F�@newposy
p6 : [IN] �ϐ��܂��́A���l�@�F�@newposz
p7 : [IN] �ϐ��܂��́A���l�@�F�@groundhsid
p8 : [IN] �ϐ��܂��́A���l�@�F�@groundpart
p9 : [IN] �ϐ��܂��́A���l�@�F�@mode
p10 : [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
p11 : [IN] �ϐ��܂��́A���l�@�F�@mapminy
p12 : [OUT] �ϐ��@�F�@result
p13 : [OUT] �ϐ��@�F�@adjustx
p14 : [OUT] �ϐ��@�F�@adjusty
p15 : [OUT] �ϐ��@�F�@adjustz
p16 : [OUT] �ϐ��@�F�@nx
p17 : [OUT] �ϐ��@�F�@ny
p18 : [OUT] �ϐ��@�F�@nz

%inst
�n�ʃp�[�c���w�肵�āA�����ƒn�ʂ̓����蔻����s���܂��B

�p�[�c���w�肷�邱�ƈȊO�́A
E3DChkConfGround2�Ɠ����ł��B

�ڂ����́AE3DChkConfGround2�̐��������ǂ݂��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@befposx
2. [IN] �ϐ��܂��́A���l�@�F�@befposy
3. [IN] �ϐ��܂��́A���l�@�F�@befposz
�@�@�����̎n�_���ibefposx, befposy, befposz�j��
�@�@�w�肵�܂��B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@newposx
5. [IN] �ϐ��܂��́A���l�@�F�@newposy
6. [IN] �ϐ��܂��́A���l�@�F�@newposz
�@�@�����̏I�_���inewposx, newposy, newposz�j��
�@�@�w�肵�܂��B
�@�@�����B

7. [IN] �ϐ��܂��́A���l�@�F�@groundhsid
�@�@E3DLoadGroundBMP�A
�@�@�܂��́AE3DLoadMQOFileAsGround��
�@�@�쐬�����`��f�[�^��
�@�@���ʂ���id

8. [IN] �ϐ��܂��́A���l�@�F�@groundpart
�@�@�n�ʂ̃p�[�c�ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�w�肵�Ă��������B

9. [IN] �ϐ��܂��́A���l�@�F�@mode
�@�@�O���w�肷��ƁA��ԃ��[�h
�@�@�P���w�肷��ƁA�n�ʂ𔇂����[�h

10. [IN] �ϐ��܂��́A���l�@�F�@diffmaxy
�@�@��x�̈ړ��œo�邱�Ƃ��o���鍂���̍ő�l��
�@�@�w�肵�Ă��������B
�@�@�����B

11. [IN] �ϐ��܂��́A���l�@�F�@mapminy
�@�@groundhsid�Ŏ��ʂ����f�[�^�̈�ԒႢ�x���W�̒l
�@�@�ʏ�́A�O�ł��B
�@�@�����B

12. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@
�@�@mode == 0 �̂Ƃ�
�@�@�@�@�Ԃ���Ȃ������ꍇ�́Aresutl = 0
�@�@�@�@�Ԃ������ꍇ�́Aresult = 1
�@�@mode == 1�̂Ƃ�
�@�@�@�@�L�����N�^�[�̉��ɒn�ʂ����������ꍇ�A
�@�@�@�@�܂��́A�S���ړ����Ȃ������ꍇ�A
�@�@�@�@result = 0

�@�@�@�@diffmaxy��荂��������o�낤�Ƃ����Ƃ��A
�@�@�@�@result = 1

�@�@�@�@�n�ʂ����ɍ~�肽�Ƃ��A
�@�@�@�@�܂��́Adiffmaxy���Ⴂ������o�����Ƃ��A
�@�@�@�@result = 2

13. [OUT] �ϐ��@�F�@adjustx
14. [OUT] �ϐ��@�F�@adjusty
15. [OUT] �ϐ��@�F�@adjustz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ��������W
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̍��W��
�@�@�@�@(adjustx, adjusty, adjustz)�ɑ������܂��B
�@�@�����^�̕ϐ��B

16. [OUT] �ϐ��@�F�@nx
17. [OUT] �ϐ��@�F�@ny
18. [OUT] �ϐ��@�F�@nz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�@�@mode == 0�̂Ƃ��́A�Ԃ������|���S��
�@�@�@�@mode == 1�̂Ƃ��́A�n�ʂ̃|���S����
�@�@�@�@�@���x�N�g�����A
�@�@�@�@(nx, ny, nz)�ɑ������܂��B
�@�@�@�@
�@�@�@�@���˕Ԃ���������߂�Ƃ��Ȃǂ�
�@�@�@�@�g�p�ł���̂ł͂Ȃ����Ǝv���A
�@�@�@�@�����Ă݂܂����B
�@�@�����^�̕ϐ��B




�o�[�W���� : ver1.0.0.1

%index
E3DSetNextMotionFrameNo
���[�V�����̍Ō�̃t���[���ԍ��ɓ��B������A�ǂ̃��[�V�����́A�ǂ̃t���[���ԍ��ɁA�W�����v���邩���w��ł��܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@srcmotid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@nextmotid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@nextframeno

%inst
���[�V�����̍Ō�̃t���[���ԍ��ɓ��B������A�ǂ̃��[�V�����́A�ǂ̃t���[���ԍ��ɁA�W�����v���邩���w��ł��܂��B

���̊֐��ŁA���̃��[�V�����̎w����s���Ă����΁AE3DSetNewPose�ŁA�����I�Ƀ��[�V�������؂�ւ��܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@srcmotid
3. [IN] ���l�܂��́A�ϐ��@�F�@nextmotid
4. [IN] ���l�܂��́A�ϐ��@�F�@nextframeno
�@�@srcmotid�̃��[�V�������A�Ō�̃t���[���ԍ��ɒB������Anextmotid�̃��[�V�����́Anextframeno�̃t���[���ԍ��ɁA�W�����v����悤�ɐݒ肳��܂��B



�o�[�W���� : ver1.0.0.1

%index
E3DSetLinearFogParams
���_�t�H�O�i���`�j��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@enable
p2 : [IN] ���l�܂��́A�ϐ��@�F�@r
p3 : [IN] ���l�܂��́A�ϐ��@�F�@g
p4 : [IN] ���l�܂��́A�ϐ��@�F�@b
p5 : [IN] ���l�܂��́A�ϐ��@�F�@start
p6 : [IN] ���l�܂��́A�ϐ��@�F�@end
p7 : [IN] ���l�܂��́A�ϐ��@�F�@hsid

%inst
���_�t�H�O�i���`�j��ݒ肵�܂��B
���_�t�H�O�Ȃ̂ŁA�|���S���̂Ȃ������ɂ́A�t�H�O�͂�����܂���B
��ʑS�̂Ƀt�H�O�����������ꍇ�́A
E3DCreateBG�ŁA�w�i���쐬���Ă��������B�i�w�i�̓|���S���ł��B�j


hsid, �r���{�[�h���쐬���Ă���Ăяo���Ă��������B
E3DCreateBG�����O�ŌĂяo���Ă��������B


E3DSetHeightFogParams�Ƃ̍��݂͏o���܂���B


��̓I�Ȏg�p��́A
e3dhsp3_wall.hsp
�ɏ����܂����̂ŁA�������������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@enable
�@�@�P���w�肷��ƁA�t�H�O���L���ɁA
�@�@�O���w�肷��ƁA�t�H�O�������ɂȂ�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@r
3. [IN] ���l�܂��́A�ϐ��@�F�@g
4. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�t�H�O�̐F���A�ir, g, b�j�Ŏw�肵�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@start
6. [IN] ���l�܂��́A�ϐ��@�F�@end
�@�@�t�H�O���J�n����鋗����start�ɁA
�@�@�t�H�O���I������i��ԔZ���Ȃ�j������end��
�@�@�w�肵�܂��B
�@�@�����́A�J��������̋����ł��B

7. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���̈����ɁA���f���f�[�^��hsid��
�@�@�w�肷�邱�Ƃɂ��A
�@�@���f���P�ʂł̃t�H�O�̎w�肪�\�ɂȂ�܂��B
�@�@������ʂȂǂŁA�t�H�O�����������Ȃ��ꍇ�Ȃǂ�
�@�@�\���ɂ��g�����������B
�@�@���̈������A�ȗ������ꍇ�́A
�@�@���ׂẴ��f���f�[�^�ɑ΂��āA�ݒ肵�܂��B




�o�[�W���� : ver1.0.0.2�Œǉ�<BR>
      

%index
E3DChkConflict3
�Q�̌`��f�[�^�̎w�肵���p�[�c���m���A�Փ˂��Ă��邩�ǂ��𔻒肵�܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��@�F�@partno1
p3 : [IN] �ϐ��܂��́A���l�@�F�@partnum1
p4 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p5 : [IN] �ϐ��@�F�@partno2
p6 : [IN] �ϐ��܂��́A���l�@�F�@partnum2
p7 : [OUT] �ϐ��@�F�@confflag
p8 : [OUT] �ϐ��@�F�@inviewflag

%inst
�Q�̌`��f�[�^�̎w�肵���p�[�c���m���A�Փ˂��Ă��邩�ǂ��𔻒肵�܂��B

�p�[�c�̔ԍ��ɁA�z����w��ł��邱�ƈȊO�́A
�قƂ�ǁAE3DChkConflict2�Ɠ����ł��B
�iinviewflag�������ɈႢ�܂��j


�p�[�c�ԍ��ɂ́A
E3DGetPartNoByName�Ŏ擾�����A
�p�[�c�̔ԍ���n���Ă��������B

partno��-1���w�肷��ƁA
���f���S�̂Ƃ����蔻������܂��B


�i����̌��ɂȂ�f�[�^�́A
E3DChkInView���߂ɂ���āA�X�V����܂��B�j


���ׂẴp�[�c������O�������ꍇ�́A
inviewflag�ɂR���A
�ЂƂł�������̃p�[�c���������ꍇ�́A
inviewflag�ɂO���������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�`��f�[�^�����ʂ���id
2. [IN] �ϐ��@�F�@partno1
�@�@hsid1�̃��f�����̃p�[�c�̔ԍ��̔z��
�@�@dim partno1, partnum1
�@�@�ȂǂŔz����쐬���A���ꂼ��̔z��v�f�ɁA
�@�@������������p�[�c�̔ԍ������Ă��������B
3. [IN] �ϐ��܂��́A���l�@�F�@partnum1
�@�@partno1�ɒl���Z�b�g�����v�f�����w�肵�Ă��������B


4. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@�`��f�[�^�����ʂ���id
5. [IN] �ϐ��@�F�@partno2
�@�@hsid2�̃��f�����̃p�[�c�̔ԍ��̔z��
�@�@dim partno2, partnum2
�@�@�ȂǂŔz����쐬���A���ꂼ��̔z��v�f�ɁA
�@�@������������p�[�c�̔ԍ������Ă��������B
6. [IN] �ϐ��܂��́A���l�@�F�@partnum2
�@�@partno2�ɒl���Z�b�g�����v�f�����w�肵�Ă��������B


7. [OUT] �ϐ��@�F�@confflag
�@�@hsid1, hsid2�Ŏ��ʂ����`�󓯎m���A
�@�@�Փ˂��Ă���ꍇ�́A�P���A
�@�@�Փ˂��Ă��Ȃ��ꍇ�͂O���Z�b�g�����B

8. [OUT] �ϐ��@�F�@inviewflag
�@�@���ׂẴp�[�c������O�������ꍇ�́A
�@�@inviewflag�ɂR���A
�@�@�P�ł��A������̃p�[�c���������ꍇ�́A
�@�@inviewflag�ɂO���������܂��B




�o�[�W���� : ver1.0.0.7�Œǉ�

%index
E3DChkConfBySphere3
���E���ɂ�邠���蔻����A�C�ӂ̃p�[�c���Ƃɍs���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid1
p2 : [IN] �ϐ��@�F�@partno1
p3 : [IN] �ϐ��܂��́A���l�@�F�@partnum1
p4 : [IN] �ϐ��܂��́A���l�@�F�@hsid2
p5 : [IN] �ϐ��@�F�@partno2
p6 : [IN] �ϐ��܂��́A���l�@�F�@partnum2
p7 : [OUT] �ϐ��@�F�@confflag

%inst
���E���ɂ�邠���蔻����A�C�ӂ̃p�[�c���Ƃɍs���܂��B

�p�[�c�̔ԍ��ɔz����w��ł��邱�ƈȊO�́A
E3DChkConfBySphere2�Ɠ����ł��B


����̍ۂɁAE3DChkInView�ŃZ�b�g����
�f�[�^���g�p���܂��B


�p�[�c�ԍ��ɂ́A
E3DGetPartNoByName�Ŏ擾����
�p�[�c�̔ԍ���n���Ă��������B

�p�[�c�ԍ���-1���w�肷��ƁA
���f���S�̂Ƃ����蔻������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid1
�@�@�`��f�[�^�����ʂ���id
2. [IN] �ϐ��@�F�@partno1
�@�@hsid1�̃��f�����̃p�[�c�̔ԍ��̔z��
�@�@dim partno1, partnum1
�@�@�ȂǂŔz����쐬���A���ꂼ��̔z��v�f�ɁA
�@�@������������p�[�c�̔ԍ������Ă��������B
3. [IN] �ϐ��܂��́A���l�@�F�@partnum1
�@�@partno1�ɒl���Z�b�g�����v�f�����w�肵�Ă��������B


4. [IN] �ϐ��܂��́A���l�@�F�@hsid2
�@�@�`��f�[�^�����ʂ���id
5. [IN] �ϐ��@�F�@partno2
�@�@hsid2�̃��f�����̃p�[�c�̔ԍ��̔z��
�@�@dim partno2, partnum2
�@�@�ȂǂŔz����쐬���A���ꂼ��̔z��v�f�ɁA
�@�@������������p�[�c�̔ԍ������Ă��������B
6. [IN] �ϐ��܂��́A���l�@�F�@partnum2
�@�@partno2�ɒl���Z�b�g�����v�f�����w�肵�Ă��������B


7. [OUT] �ϐ��@�F�@confflag
�@�@hsid1, hsid2�Ŏ��ʂ����`�󓯎m���A
�@�@�Փ˂��Ă���ꍇ�́A�P���A
�@�@�Փ˂��Ă��Ȃ��ꍇ�͂O���Z�b�g�����B



�o�[�W���� : ver1.0.0.7�Œǉ�

%index
E3DSetMovableAreaThread
�X���b�h���쐬���āAE3DSetMovableArea�����s���܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ������܂��́A������ϐ��@�F�@filename1
p2 : [IN] �ϐ��܂��́A���l�@�F�@maxx
p3 : [IN] �ϐ��܂��́A���l�@�F�@maxz
p4 : [IN] �ϐ��܂��́A���l�@�F�@divx
p5 : [IN] �ϐ��܂��́A���l�@�F�@divz
p6 : [IN] �ϐ��܂��́A���l�@�F�@wallheight
p7 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DSetMovableArea�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B

html{
<strong>
</strong>
}htmlver5.0.0.7����͖��߂��ƂɈقȂ�f�B���N�g���Ƀe�N�X�`���������Ă��ǂݍ��߂�悤�ɂȂ�܂����B


E3DSetMovableArea�̐������A���ǂ݂��������B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename1
�@�@�ǂ̍��W���̌��ƂȂ�A�a�l�o�t�@�C����

2. [IN] �ϐ��܂��́A���l�@�F�@maxx
�@�@�ǂ̂w���W�̍ő�l
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@maxz
�@�@�ǂ̂y���W�̍ő�l
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@divx
�@�@X�����̕�����

5. [IN] �ϐ��܂��́A���l�@�F�@divz
�@�@Z�����̕�����

6. [IN] �ϐ��܂��́A���l�@�F�@wallheight
�@�@�쐬����ǂ̍���
�@�@�����B

7. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���A�h�c



�o�[�W���� : ver2.0.0.2�Œǉ�

%index
E3DCreateSpriteFromBMSCR
HSP�̕`���ʁiE3D�ł̕`��������j�Ɠ������e�̃X�v���C�g���쐬���܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@wid
p2 : [IN] �ϐ��܂��́A���l�@�F�@transparentflag
p3 : [OUT] �ϐ��@�F�@spriteID
p4 : [IN] �ϐ��܂��́A���l�@�F�@tpR
p5 : [IN] �ϐ��܂��́A���l�@�F�@tpG
p6 : [IN] �ϐ��܂��́A���l�@�F�@tpB

%inst
HSP�̕`���ʁiE3D�ł̕`��������j�Ɠ������e�̃X�v���C�g���쐬���܂��B

�����Ńe�N�X�`���[���g�p���邽�߁A
��ʂ̑傫�����A�Q�̏搔�Ŗ����ꍇ�́A
�X�v���C�g�̑傫���Ɖ�ʂ̑傫�����A�قȂ�ꍇ������܂��B

�X�v���C�g�̑傫���́A
E3DGetSpriteSize�Ŋm�F���Ă��������B

�g�����Ƃ��ẮA
��\���̃E�C���h�E���쐬���Ă����A
�����ɁAmes���߂ȂǂŁA�`����s���A
���̃E�C���h�E�ɑ΂��āA���̊֐����ĂсA
�o�����X�v���C�g���A���C���̃E�C���h�E�ɕ`�悷��A
�Ȃǂ��A�l�����܂��B

html{
<strong>screen���߂̂S�Ԗڂ̈����ŁA
�p���b�g���[�h���w�肵���ꍇ�́A
���̊֐��́A�g�p�ł��܂���B</strong>
}html






������
1. [IN] �ϐ��܂��́A���l�@�F�@wid
�@�@�E�C���h�EID

2. [IN] �ϐ��܂��́A���l�@�F�@transparentflag
�@�@���߃t���O�B

�@�@���߂����Ȃ��ꍇ�́A�O���w�肵�Ă��������B

�@�@�P���Z�b�g����ƁA���F�𓧉ߐF�Ƃ��ĐF�������܂��B

�@�@�Q���Z�b�g����ƁA�itpR, tpG, tpB�j�Ŏw�肵���F��
�@�@���ߐF�Ƃ��܂�

�@�@���̊֐���transparetflag�̈Ӗ��́A
�@�@���̊֐���transparent�Ƃ́A�Ⴄ�̂ŁA
�@�@�C��t���Ă��������B


3. [OUT] �ϐ��@�F�@spriteID
�@�@�쐬�����X�v���C�g�����ʂ���h�c�B

4. [IN] �ϐ��܂��́A���l�@�F�@tpR
5. [IN] �ϐ��܂��́A���l�@�F�@tpG
6. [IN] �ϐ��܂��́A���l�@�F�@tpB
�@�@transparentflag = 2 �̂Ƃ��A
�@�@���ߐF���A(tpR, tpG, tpB)�Ŏw�肵�܂��B



�o�[�W���� : ver2.0.0.5�Œǉ�

%index
E3DLoadMOAFile
���[�V�����A�N�Z�����[�^�t�@�C���i*.moa�j��ǂݍ��݂܂��B
%group
Easy3D For HSP3 : ���[�V�����A�N�Z�����[�^

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p3 : [IN] ���l�܂��͕ϐ��@�F�@FillUpFrameLength
p4 : [IN] �ϐ��܂��́A���l�@�F�@mvmult

%inst
���[�V�����A�N�Z�����[�^�t�@�C���i*.moa�j��ǂݍ��݂܂��B

moa�Ɠ����t�H���_�ɁA
moa�ɋL�q����Ă���S�Ă�qua�t�@�C�����A���݂��Ȃ���
�G���[�ɂȂ�܂��B

�ڂ����́A�}�j���A���́Ardb2_ma.htm��
e3dhsp3_MotionAccelerator.hsp
���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�ǂ̃��f���f�[�^�ɑ΂���moa�����w�肷��B

2. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.moa�̃p�X������B

3. [IN] ���l�܂��͕ϐ��@�F�@FillUpFrameLength
�@�@��ԃ��[�V�����̃t���[�����B
�@�@ver5.3.2.6�ȍ~�ł́A-1���w�肷���moa�t�@�C���ɋL�q����Ă���t���[������ǂݍ��݂܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@mvmult
�@�@���[�V�����̈ړ������Ɋ|����{��
�@�@�ȗ�����ƂP�D�O
�@�@����



�o�[�W���� : ver2.0.1.2�Œǉ�<BR>
      ver4.0.1.6�ň����ǉ�<BR>
      

%index
E3DSetNewPoseByMOA
���[�V�����A�N�Z�����[�^�Ɋ�Â��āA���[�V�����̍X�V�����܂��B
%group
Easy3D For HSP3 : ���[�V�����A�N�Z�����[�^

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@eventno

%inst
���[�V�����A�N�Z�����[�^�Ɋ�Â��āA���[�V�����̍X�V�����܂��BE3DSetNewPose�̑���ɌĂ�ł��������B

eventno�����ɂ́A�ʏ�A�Q�̏搔�̒l���g�p���܂��B
�l���傫���Ȃ�ƋL�q����ςȂ̂ŁA
�Q�̏搔�́Ae3dhsp3.as�Œ�`���Ă���POW2X�z���
�g�p���Ă��������B
�Ⴆ�΁A�Q�̂P�T��̒l�́APOW2X( 15 ) �ŃA�N�Z�X�\�ł��B


�ڂ����́A�}�j���A���́Ardb2_ma.htm��
e3dhsp3_MotionAccelerator.hsp
���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ID

2. [IN] �ϐ��܂��́A���l�@�F�@eventno
�@�@�C�x���g�ԍ�
�@�@�ڂ����́A�}�j���A���́Ardb2_ma.htm���������������B





�o�[�W���� : ver2.0.1.2�Œǉ�

%index
E3DGetMotionFrameNo
�J�����g�i���݂́j�̃��[�V�����ԍ��ƁA�t���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@mk
p3 : [OUT] �ϐ��@�F�@frame

%inst
�J�����g�i���݂́j�̃��[�V�����ԍ��ƁA�t���[���ԍ����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [OUT] �ϐ��@�F�@mk
�@�@���[�V���������ʂ���ԍ�

3. [OUT] �ϐ��@�F�@frame
�@�@�t���[���ԍ�



�o�[�W���� : ver2.0.1.2�Œǉ�

%index
E3DGetKeyboardCnt
256 �̉��z�L�[�̏��(�J�E���^�[)���A�w�肳�ꂽ�o�b�t�@keybuf�փR�s�[���܂��B
%group
Easy3D For HSP3 : �L�[�{�[�h

%prm
p1
p1 : [OUT] �ϐ��@�F�@keybuf

%inst
256 �̉��z�L�[�̏��(�J�E���^�[)���A�w�肳�ꂽ�o�b�t�@keybuf�փR�s�[���܂��B


E3DGetKeyboardState�֐��́A�Ăяo�����ɁA�L�[��������Ă��邩�ǂ��������A�擾�ł��܂��񂪁A
E3DGetKeyboardCnt�֐��́A�ǂ̂��炢�̎��ԁA���������Ă��邩��\���J�E���^�[���擾�ł��܂��B

Easy3D�����ŁA
�O��̂��[�̏���ۑ����Ă����A
�Ăяo�����ɁA�L�[��������Ă���΁A
�J�E���^�[���P���₵�܂��B
������Ă��Ȃ���΁A�J�E���^�[���O�ɂ��܂��B


keybuf �́A���̊֐����g�p����O�ɁA
dim keybuf, 256
�ŁA�m�ۂ��Ă��������B

�����̃L�[�̏�Ԃ��A��x�̌Ăяo���ŁA
�擾�ł��܂��B

�Ⴆ�΁A�`�L�[�̃J�E���^�𒲂ׂ�ꍇ�́A
E3DGetKeyboardCnt
�Ăяo����ɁA
keybuf('A') �̒l�𒲂ׂ܂��B
�i�@�f�@��Y�ꂸ�ɁB�@�j


��̓I�Ȏg�p��́Azip���́A
e3dhsp3_MotionAccelerator.hsp���������������B

�o�[�`�����L�[���́Azip���́A
e3dhsp3.as �ŁA
VK_ �Ŏn�܂�萔�Ƃ��āA�錾���Ă��܂��B
html{
<table border="1">
	<tr><th>�萔</th>	<th>�L�[����</th>	<th>�L�[����</th></tr>
	<tr><td>VK_LBUTTON</td>	<td>�}�E�X�@���N���b�N</td>	<td></td></tr>
	<tr><td>VK_RBUTTON</td>	<td>�}�E�X�@�E�N���b�N</td>	<td></td></tr>
	<tr><td>VK_CANCEL </td>	<td>Ctrl + Break</td>	<td></td></tr>

	<tr><td>VK_MBUTTON</td>	<td>�z�C�[���N���b�N</td>	<td></td></tr>
	<tr><td>VK_BACK   </td>	<td>Back Space</td>	<td></td></tr>
	<tr><td>VK_TAB    </td>	<td>Tab�L�[</td>	<td></td></tr>

	<tr><td>VK_CLEAR  </td>	<td>NumLock ���O������Ԃ̃e���L�[5</td>	<td></td></tr>
	<tr><td>VK_RETURN </td>	<td>Enter</td>	<td></td></tr>
	<tr><td>VK_SHIFT  </td>	<td>Shift</td>	<td></td></tr>

	<tr><td>VK_CONTROL</td>	<td>Ctrl</td>	<td></td></tr>
	<tr><td>VK_MENU   </td>	<td>Alt</td>	<td></td></tr>
	<tr><td>VK_PAUSE  </td>	<td>Pause</td>	<td>Ctrl + NumLock</td></tr>

	<tr><td>VK_CAPITAL</td>	<td>Shift + CapsLock</td>	<td></td></tr>
	<tr><td>VK_HANJA  </td>	<td>Alt + ���p�^�S�p�i�����j</td>	<td></td></tr>
	<tr><td>VK_KANJI  </td>	<td>Alt + ���p�^�S�p�i�����j</td>	<td></td></tr>
	<tr><td>VK_ESCAPE </td>	<td>Esc</td>	<td></td></tr>
	<tr><td>VK_SPACE   </td>	<td>�X�y�[�X�L�[</td>	<td></td></tr>

	<tr><td>VK_PRIOR   </td>	<td>PageUp</td>	<td></td></tr>
	<tr><td>VK_NEXT    </td>	<td>PageDown</td>	<td></td></tr>
	<tr><td>VK_END     </td>	<td>End</td>	<td>Shift + �e���L�[1</td></tr>

	<tr><td>VK_HOME    </td>	<td>Home</td>	<td>Shift + �e���L�[7</td></tr>
	<tr><td>VK_LEFT    </td>	<td>�����L�[</td>	<td>Shift + �e���L�[4</td></tr>
	<tr><td>VK_UP      </td>	<td>����L�[</td>	<td>Shift + �e���L�[8</td></tr>
	<tr><td>VK_RIGHT   </td>	<td>�E���L�[</td>	<td>Shift + �e���L�[6</td></tr>
	<tr><td>VK_DOWN    </td>	<td>�����L�[</td>	<td>Shift + �e���L�[2</td></tr>
	<tr><td>VK_SNAPSHOT</td>	<td>PrintScreen</td>	<td></td></tr>
	<tr><td>VK_INSERT  </td>	<td>Insert</td>	<td>Shift + �e���L�[0</td></tr>

	<tr><td>VK_DELETE  </td>	<td>Delete</td>	<td>Shift + �e���L�[.</td></tr>
	<tr><td>'0'</td>	<td>0</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>'9'</td>	<td>9</td>	<td></td></tr>
	<tr><td>'A'</td>	<td>A</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>'Z'</td>	<td>Z</td>	<td></td></tr>
	<tr><td>VK_LWIN </td>	<td>�E�B���h�E�Y�L�[�i���j</td>	<td></td></tr>
	<tr><td>VK_RWIN </td>	<td>�E�B���h�E�Y�L�[�i�E�j</td>	<td></td></tr>
	<tr><td>VK_APPS </td>	<td>Application�L�[	�i�E�N���b�N�Ɠ����@�\�̃L�[�̂��Ƃł��B�j</td>	<td></td></tr>

	<tr><td>VK_NUMPAD0  </td>	<td>�e���L�[�̂O</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>VK_NUMPAD9  </td>	<td>�e���L�[�̂X</td>	<td></td></tr>

	<tr><td>VK_MULTIPLY </td>	<td>�e���L�[�� *</td>	<td></td></tr>
	<tr><td>VK_ADD      </td>	<td>�e���L�[�� +</td>	<td></td></tr>
	<tr><td>VK_SUBTRACT </td>	<td>�e���L�[�� -</td>	<td></td></tr>
	<tr><td>VK_DECIMAL  </td>	<td>�e���L�[�� .</td>	<td></td></tr>
	<tr><td>VK_DIVIDE   </td>	<td>�e���L�[�� /</td>	<td></td></tr>

	<tr><td>VK_F1 </td>	<td>F1</td>	<td></td></tr>
	<tr><td>...</td>	<td>...</td>	<td></td></tr>
	<tr><td>VK_F12</td>	<td>F12</td>	<td></td></tr>
	<tr><td>VK_NUMLOCK</td>	<td>NumLock</td>	<td></td></tr>
	<tr><td>VK_SCROLL </td>	<td>ScrollLock</td>	<td></td></tr>
</table>

<table border="1">
	<tr><th>�萔</th>	<th>�L�[����</th>	<th>�L�[����</th></tr>

	<tr><td>VK_LSHIFT  </td>	<td>Shift�i���j</td>	<td></td></tr>
	<tr><td>VK_RSHIFT  </td>	<td>Shift�i�E�j</td>	<td></td></tr>
	<tr><td>VK_LCONTROL</td>	<td>Ctrl�i���j</td>	<td></td></tr>

	<tr><td>VK_RCONTROL</td>	<td>Ctrl�i�E�j</td>	<td></td></tr>
	<tr><td>VK_LMENU   </td>	<td>Alt�i���j</td>	<td></td></tr>
	<tr><td>VK_RMENU   </td>	<td>Alt�i�E�j</td>	<td></td></tr>

	<tr><td>VK_OEM_1     </td>	<td>';:' for US</td>	<td>:*</td></tr>
	<tr><td>VK_OEM_PLUS  </td>	<td>'+' any country</td>	<td>;+</td></tr>
	<tr><td>VK_OEM_COMMA </td>	<td>',' any country</td>	<td>,&lt;</td></tr>

	<tr><td>VK_OEM_MINUS </td>	<td>'-' any country</td>	<td>-=</td></tr>
	<tr><td>VK_OEM_PERIOD</td>	<td>'.' any country</td>	<td>.&gt;</td></tr>
	<tr><td>VK_OEM_2     </td>	<td>'/?' for US</td>	<td>/?</td></tr>

	<tr><td>VK_OEM_3     </td>	<td>'`~' for US</td>	<td>@`</td></tr>
	<tr><td>VK_OEM_4</td>	<td>'[{' for US</td>	<td>[{</td></tr>
	<tr><td>VK_OEM_5</td>	<td>'\|' for US</td>	<td>\ |</td></tr>

	<tr><td>VK_OEM_6</td>	<td>']}' for US</td>	<td>]}</td></tr>
	<tr><td>VK_OEM_7</td>	<td>''"' for US</td>	<td>^~</td></tr>
</table>

<table border="1">
	<tr><th>�萔</th>	<th>�L�[����</th>	<th>�L�[����</th></tr>
	<tr><td>VK_OEM_102  </td>	<td>"<>" or "\|" on RT 102-key kbd.</td>	<td>_��</td></tr>
</table>
}html


������
 1. [OUT] �ϐ��@�F�@keybuf
�@�@keybuf�ɁA�L�[�̏��(�J�E���^)���A�������܂��B
�@�@keybuf�́Adim keybuf, 256 �ŁA
�@�@�쐬����Ă���K�v������܂��B



�o�[�W���� : ver2.0.1.2�Œǉ�

%index
E3DResetKeyboardCnt
E3DGetKeyboardCnt���A�����Ŏg�p����A�O��̃L�[�̏������Z�b�g���܂��B
%group
Easy3D For HSP3 : �L�[�{�[�h

%prm
�Ȃ�

%inst
E3DGetKeyboardCnt���A�����Ŏg�p����A�O��̃L�[�̏������Z�b�g���܂��B




������
�Ȃ�

�o�[�W���� : ver2.0.1.2�Œǉ�

%index
E3DEncodeBeta
�t�@�C���̓��e���A�Í������܂��B
%group
Easy3D For HSP3 : �ȈՈÍ���

%prm
p1,p2
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �z��ϐ��@�F�@rnd10

%inst
�t�@�C���̓��e���A�Í������܂��B

�Í����Ƃ����Ă��A���ȈՂȕ��@�ł��̂ŁA
�v���O�����ɏڂ����l�Ȃ�A�����ł��Ă��܂����x�̂��̂ł��B

�t�@�C�����A�Í������āA���e���㏑�����܂��B
�Í��������t�@�C���ɑ΂���
�A���̊֐����Ăׂ΁A�Í����O�̃t�@�C���ɖ߂�܂��B





������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ȈՈÍ�������t�@�C����

2. [IN] �z��ϐ��@�F�@rnd10
�@�@�ȈՈÍ�������ۂɎg�p����A
�@�@�����_���ȃL�[�z����w�肵�܂��B
�@�@�L�[�́A�P�O�w�肵�܂��B
�@�@�L�[�̒l�́A�O����Q�T�T�̒l���g�p���Ă��������B
�@�@dim rnd10, 10
�@�@�ŁA�z����쐬���Ă���A�l���Z�b�g���Ă��������B





�o�[�W���� : ver2.0.1.3�Œǉ�

%index
E3DDecodeBeta
E3DEncodeBeta�ňÍ��������t�@�C�����A�o�b�t�@��ŕ������܂��B
%group
Easy3D For HSP3 : �ȈՈÍ���

%prm
p1,p2,p3
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �z��ϐ��@�F�@rnd10
p3 : [OUT] �z��ϐ��@�F�@dstbuffer

%inst
E3DEncodeBeta�ňÍ��������t�@�C�����A�o�b�t�@��ŕ������܂��B

�o�b�t�@�́Asdim�Ŋm�ۂ��Ă��������B





������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@��������t�@�C����

2. [IN] �z��ϐ��@�F�@rnd10
�@�@E3DEncodeBeta�Ŏg�p�����̂Ɠ������e��
�@�@�L�[�z��B

3. [OUT] �z��ϐ��@�F�@dstbuffer
�@�@�����������e���A�Z�b�g����܂��B
�@�@�t�@�C���̒�����flength�Ƃ����ꍇ�A
�@�@sdim dstbuffer, flength
�@�@�ō쐬�����o�b�t�@�[���w�肵�Ă��������B




�o�[�W���� : ver2.0.1.3�Œǉ�

%index
E3DGetMoaInfo
Moa�t�@�C����ǂݍ��񂾏ꍇ�̃��[�V�����̖��O��ID���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motmaxnum
p3 : [OUT] ������̔z��ϐ��@�F�@motionname
p4 : [OUT] �z��ϐ��@�F�@motionid
p5 : [OUT] �ϐ��@�F�@motgetnum

%inst
Moa�t�@�C����ǂݍ��񂾏ꍇ�̃��[�V�����̖��O��ID���擾���܂��B

motmaxnum�́A�傫�ڂ̒l��ݒ肵�Ă��������B
���̒l�����ۂ̃��[�V�����̐������������ƃG���[�ɂȂ�܂��B

motionname�����́A
sdim motionname, 256, motmaxnum
�ō쐬�����z����w�肵�Ă��������B

motionid�����́A
dim motionid, motmaxnum
�ō쐬�����z����w�肵�Ă��������B


�ڂ����g�����́A
e3dhsp3_MotionAccelerator.hsp���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motmaxnum
�@�@�f�[�^�擾�p�z��̑傫���i���[�V�����̐��j���w�肵�܂��B

3. [OUT] ������̔z��ϐ��@�F�@motionname
�@�@���O�����擾���邽�߂̔z���n���Ă��������B
�@�@���ɏ��������@�ŁAsdim�����z���n���Ă��������B

4. [OUT] �z��ϐ��@�F�@motionid
�@�@���[�V����ID���擾���邽�߂̔z��ϐ���n���Ă��������B
�@�@�E�ɏ��������@�ŁAdim�����z���n���Ă��������B

5. [OUT] �ϐ��@�F�@motgetnum
�@�@���̃��[�V�����̏����o�͂��������A�������܂��B



�o�[�W���� : ver3.0.0.1�Œǉ�

%index
E3DGetNextMotionFrameNo
E3DSetNextMotionFrameNo�Őݒ肵�������擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [OUT] �ϐ��@�F�@nextmotionid
p4 : [OUT] �ϐ��@�F�@nextframe

%inst
E3DSetNextMotionFrameNo�Őݒ肵�������擾���܂��B

Moa�t�@�C����ǂݍ���ŁA
E3DSetNewPoseByMOA���g�p����ꍇ�A
���[�V�����ƃ��[�V�����̊Ԃɕ�ԃ��[�V����������܂��B
���̕�ԃ��[�V�����̃��[�V����ID��ver3001�ł͏�ɂO�ł��B

���̕�ԃ��[�V�����ɂ́AE3D�������ŁA
���̃��[�V������E3DSetNextMotionFrameNo�ŃZ�b�g���Ă��܂��B

�܂�A���̕�ԃ��[�V�����ɑ΂��āA
E3DGetNextMotionFrameNo���Ăяo���΁A
���ɍĐ����郂�[�V�����̏�񂪎擾�ł���Ƃ����킯�ł��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���݂̃��[�V������ID


3. [OUT] �ϐ��@�F�@nextmotionid
�@�@���ɍĐ�����郂�[�V������ID

4. [OUT] �ϐ��@�F�@nextframe
�@�@�t���[���ԍ�


�o�[�W���� : ver3.0.0.1�Œǉ�

%index
E3DGetScreenPos3
�`��f�[�^�̉�ʏ�ł�2D�̍��W���擾����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p4 : [OUT] �ϐ��@�F�@scx
p5 : [OUT] �ϐ��@�F�@scy
p6 : [OUT] �ϐ��@�F�@scz
p7 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p8 : [IN] ���l�܂��́A�ϐ��@�F�@calcmode

%inst
�`��f�[�^�̉�ʏ�ł�2D�̍��W���擾����֐��ł��B
���s�����Z���擾�ł��܂��B

�p�[�c�P�ʁA���f���P�ʁA�r���{�[�h�P�ʂ�
�g�p�ł��܂��B

���_�P�ʂł̂Q�c���W���擾�ł��܂��B

�R�c�L�����N�^�[�̈ʒu�ɁA2D�̃X�v���C�g��\������A�Ȃǂ̗p�r�Ɏg���܂��B

Z���́A�X�v���C�g�`�掞��Z�w��̒l�Ɏg�p�ł��܂��B


html{
<strong>E3DChkInView����ŁA�Ăяo���Ă��������B</strong>
}html


��̓I�Ȏg�p��́Azip���́A
html{
<strong>e3dhsp3_pickvert.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B






������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̂Q�c�ʒu���擾�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@���f���S�̂̒��S���W�̂Q�c���W��
�@�@�擾�ł��܂��B

4. [OUT] �ϐ��@�F�@scx
5. [OUT] �ϐ��@�F�@scy
�@�@�w�肵���p�[�c��2D�X�N���[�����W���������܂��B
�@�@�����B�@

�@�@�������A�ȉ��̏ꍇ�ɂ́A
�@�@scx = -1, scy = -1���������܂��B
�@�@
�@�@�P�C�p�[�c���\���p�I�u�W�F�N�g�ł͂Ȃ��ꍇ
�@�@�Q�C�p�[�c�S�̂���ʊO�ɂ���ꍇ
�@�@�R�C�p�[�c�̃f�B�X�v���C�X�C�b�`���I�t�̏ꍇ
�@�@�S�C�p�[�c�������ɂȂ��Ă����ꍇ
�@�@�@�@�iE3DSetValidFlag�łO���w�肵���ꍇ�j

6. [OUT] �ϐ��@�F�@scz
�@�@���s�����Z
�@�@�����̕ϐ��B
�@�@���̒l�ɂO����P�͈̔͊O�̒l������ꂽ�ꍇ�́A
�@�@��ʂɕ`�悳��Ȃ����_�ł��B


7. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�擾���������_�̔ԍ����w�肵�܂��B
�@�@���̈������ȗ������ꍇ��A-1���w�肵���ꍇ�́A
�@�@�p�[�c�̒��S�̂Q�c���W���擾���܂��B

8. [IN] ���l�܂��́A�ϐ��@�F�@calcmode
�@�@1���w�肵�Ă��������B


�o�[�W���� : ver3.0.0.1�Œǉ�

%index
E3DEnableToonEdge
�֊s���̃I���I�t�����܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@type
p4 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�֊s���̃I���I�t�����܂��B

�g�D�[���ݒ肳�ꂽsig��ǂݍ���ł����Ԃ��A
�������́AE3DSetShaderType��COL_TOON1��ݒ肵�Ă����Ԃ�
�ł����@�\���܂���B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@���f���S�̗̂֊s���̃I���I�t�����܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@type
�@�@�֊s���̃^�C�v���w�肵�܂��B
�@�@�O���w�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@�֊s���I���ɂ������ꍇ�͂P���A
�@�@�I�t�ɂ������ꍇ�͂O���w�肵�Ă��������B



�o�[�W���� : ver3.0.1.1�Œǉ�

%index
E3DSetToonEdge0Color
�֊s���̐F���Z�b�g���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ������܂��́A������̕ϐ��@�F�@materialname
p4 : [IN] ���l�܂��́A�ϐ��@�F�@r
p5 : [IN] ���l�܂��́A�ϐ��@�F�@g
p6 : [IN] ���l�܂��́A�ϐ��@�F�@b

%inst
�֊s���̐F���Z�b�g���܂��B

�g�D�[���ݒ肳�ꂽsig��ǂݍ���ł����Ԃ��A
�������́AE3DSetShaderType��COL_TOON1��ݒ肵�Ă����Ԃ�
�ł����@�\���܂���B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@���f���S�̗̂֊s���̐F��ݒ肵�܂��B

3. [IN] ������܂��́A������̕ϐ��@�F�@materialname
�@�@�}�e���A���̖��O���w�肵�܂��B
�@�@RokDeBone2�́u�g�D�v�{�^�����������Ƃ���
�@�@���X�g�{�b�N�X�ɕ\�������}�e���A������
�@�@�w�肵�Ă��������B

�@�@partno��-1���w�肵�Ă���ꍇ�́A
�@�@&quot;dummy&quot;�Ǝw�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@r
5. [IN] ���l�܂��́A�ϐ��@�F�@g
6. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�F��RGB���w�肵�܂��B
�@�@���ꂼ��A�O����Q�T�T�̐������w�肵�Ă��������B





�o�[�W���� : ver3.0.1.1�Œǉ�

%index
E3DSetToonEdge0Width
�֊s���̕����Z�b�g���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ������܂��́A������̕ϐ��@�F�@materialname
p4 : [IN] ���l�܂��́A�ϐ��@�F�@width

%inst
�֊s���̕����Z�b�g���܂��B

�g�D�[���ݒ肳�ꂽsig��ǂݍ���ł����Ԃ��A
�������́AE3DSetShaderType��COL_TOON1��ݒ肵�Ă����Ԃ�
�ł����@�\���܂���B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@���f���S�̗̂֊s���̐F��ݒ肵�܂��B

3. [IN] ������܂��́A������̕ϐ��@�F�@materialname
�@�@�}�e���A���̖��O���w�肵�܂��B
�@�@RokDeBone2�́u�g�D�v�{�^�����������Ƃ���
�@�@���X�g�{�b�N�X�ɕ\�������}�e���A������
�@�@�w�肵�Ă��������B

�@�@partno��-1���w�肵�Ă���ꍇ�́A
�@�@&quot;dummy&quot;�Ǝw�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@width
�@�@�֊s�̕��������Ŏw�肵�Ă��������B




�o�[�W���� : ver3.0.1.1�Œǉ�

%index
E3DGetToonEdge0Color
�֊s���̐F���擾���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ������܂��́A������̕ϐ��@�F�@materialname
p4 : [OUT] �ϐ��@�F�@r
p5 : [OUT] �ϐ��@�F�@g
p6 : [OUT] �ϐ��@�F�@b

%inst
�֊s���̐F���擾���܂��B

�g�D�[���ݒ肳�ꂽsig��ǂݍ���ł����Ԃ��A
�������́AE3DSetShaderType��COL_TOON1��ݒ肵�Ă����Ԃ�
�ł����@�\���܂���B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

3. [IN] ������܂��́A������̕ϐ��@�F�@materialname
�@�@�}�e���A���̖��O���w�肵�܂��B
�@�@RokDeBone2�́u�g�D�v�{�^�����������Ƃ���
�@�@���X�g�{�b�N�X�ɕ\�������}�e���A������
�@�@�w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@r
5. [OUT] �ϐ��@�F�@g
6. [OUT] �ϐ��@�F�@b
�@�@�֊s�̐F��RGB���������܂��B
�@�@���ꂼ��A�O����Q�T�T�̐������擾����܂��B

�@�@�w�肵���}�e���A����������Ȃ������ꍇ��
�@�@(0, 0, 0)���������܂��B



�o�[�W���� : ver3.0.1.1�Œǉ�

%index
E3DGetToonEdge0Width
�֊s���̕����擾���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ������܂��́A������̕ϐ��@�F�@materialname
p4 : [OUT] �ϐ��@�F�@width

%inst
�֊s���̕����擾���܂��B

�g�D�[���ݒ肳�ꂽsig��ǂݍ���ł����Ԃ��A
�������́AE3DSetShaderType��COL_TOON1��ݒ肵�Ă����Ԃ�
�ł����@�\���܂���B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

3. [IN] ������܂��́A������̕ϐ��@�F�@materialname
�@�@�}�e���A���̖��O���w�肵�܂��B
�@�@RokDeBone2�́u�g�D�v�{�^�����������Ƃ���
�@�@���X�g�{�b�N�X�ɕ\�������}�e���A������
�@�@�w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@width
�@�@�֊s�̕����������܂��B
�@�@�����^�̕ϐ��B

�@�@�w�肵���}�e���A����������Ȃ������ꍇ�́A
�@�@0.0���������܂��B



�o�[�W���� : ver3.0.1.1�Œǉ�

%index
E3DCreateParticle
�p�[�e�B�N�����쐬���܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] ���l�܂��́A�ϐ��@�F�@maxnum
p2 : [IN] ������܂��́A������̕ϐ��@�F�@texname
p3 : [IN] ���l�܂��́A�ϐ��@�F�@width
p4 : [IN] ���l�܂��́A�ϐ��@�F�@height
p5 : [IN] ���l�܂��́A�ϐ��@�F�@blendmode
p6 : [OUT] �ϐ��@�F�@particleid
p7 : [IN] ���l�܂��́A�ϐ��@�F�@transparentflag
p8 : [IN] ���l�܂��́A�ϐ��@�F�@cmpalways

%inst
�p�[�e�B�N�����쐬���܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@maxnum
�@�@�\���ł���p�[�e�B�N���̍ő吔���w�肵�܂��B
�@�@�Q�O�O�O�ȉ��̐������w�肵�Ă��������B

2. [IN] ������܂��́A������̕ϐ��@�F�@texname
�@�@�e�N�X�`���[�����t���p�X�Ŏw�肵�܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@width
�@�@�p�[�e�B�N���̕����w�肵�܂��B
�@�@�����B

4. [IN] ���l�܂��́A�ϐ��@�F�@height
�@�@�p�[�e�B�N���̍������w�肵�܂��B
�@�@�����B

5. [IN] ���l�܂��́A�ϐ��@�F�@blendmode
�@�@�������̃u�����h���[�h���w�肵�܂��B
�@�@�O���w�肷��ƁA
�@�@�e�N�X�`���̃A���t�@�ɂ��u�����h�����܂��B
�@�@�P���w�肷��ƁA
�@�@�A�b�h���[�h�ł̃u�����h�����܂��B
�@�@�Q���w�肷��ƁA
�@�@���_�̃A���t�@���l������
�@�@�A�b�h���[�h�u�����h�����܂��B

6. [OUT] �ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���������܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@transparentflag
�@�@�P���w�肷��ƍ��F�𓧉߂��܂��iBMP�p�j�B
�@�@�O���w�肷��ƁA�摜�t�@�C���̃A���t�@��
�@�@���̂܂܎g���܂��B

�@�@�������ȗ�����ƂP���K�p����܂��B

8. [IN] ���l�܂��́A�ϐ��@�F�@cmpalways
�@�@�P���w�肷���Z�o�b�t�@�̔�r���s�킸��
�@�@��ɕ`�悷��悤�ɂȂ�܂��B
�@�@�f�t�H���g�͂O�B





�o�[�W���� : ver3.0.1.5�Œǉ�<BR>
      ver3.0.3.1�ň����ǉ�<BR>
      ver4.0.0.1�ň����ǉ�<BR>
      

%index
E3DDestroyParticle
�p�[�e�B�N����j�����܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid

%inst
�p�[�e�B�N����j�����܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�폜�������p�[�e�B�N�������ʂ���ID���w�肵�܂��B



�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DSetParticlePos
�p�[�e�B�N���̏ꏊ��ݒ肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posz

%inst
�p�[�e�B�N���̏ꏊ��ݒ肵�܂��B
�ݒ肵���ꏊ����p�[�e�B�N���������o���܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@posx
3. [IN] ���l�܂��́A�ϐ��@�F�@posy
4. [IN] ���l�܂��́A�ϐ��@�F�@posz
�@�@�p�[�e�B�N���̈ʒu���iposx, posy, posz�j��
�@�@�w�肵�܂��B
�@�@�����B




�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DSetParticleGravity
�p�[�e�B�N���̏d�͂�ݒ肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@gravity

%inst
�p�[�e�B�N���̏d�͂�ݒ肵�܂��B
�ݒ肵���l�́AY�����̕��̉����x�Ƃ��Čv�Z�Ɏg�p����܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@gravity
�@�@�d�͂��w�肵�܂��B
�@�@�����B



�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DSetParticleLife
�p�[�e�B�N���̎�����ݒ肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@life

%inst
�p�[�e�B�N���̎�����ݒ肵�܂��B
�p�[�e�B�N���������o���Ă��������܂ł̎��Ԃ�
�b�Ŏw�肵�܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@life
�@�@�p�[�e�B�N���̎������w�肵�܂��B
�@�@�����B
�@�@�b�B




�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DSetParticleEmitNum
�p�[�e�B�N���̐����������܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@emitnum

%inst
�p�[�e�B�N���̐����������܂��B
E3DRenderParticle���ĂԂ��тɎw�肵����������������܂��B
�����ł̎w�肪�\�ł��B
�Ⴆ�΂O�D�Q�Ǝw�肵���ꍇ�́A
�T��E3DRenderParticle���Ăяo�����ƂɂP�p�[�e�B�N����
��������܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@emitnum
�@�@�p�[�e�B�N���̂P�񂠂���̐��������w�肵�܂��B
�@�@�����B



�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DSetParticleVel0
�p�[�e�B�N���̑��x���w�肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@minvelx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@minvely
p4 : [IN] ���l�܂��́A�ϐ��@�F�@minvelz
p5 : [IN] ���l�܂��́A�ϐ��@�F�@maxvelx
p6 : [IN] ���l�܂��́A�ϐ��@�F�@maxvely
p7 : [IN] ���l�܂��́A�ϐ��@�F�@maxvelz

%inst
�p�[�e�B�N���̑��x���w�肵�܂��B

���x�̍Œ�l��minvelx, minvely, minvelz�Ɏw�肵�A
���x�̍ő�l��maxvelx, maxvely, maxvelz�Ɏw�肵�܂��B

�Œ�l�ƍő�l�̕����L���قǁA
�p�[�e�B�N���́A�܂΂�ɕ��o����܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@minvelx
3. [IN] ���l�܂��́A�ϐ��@�F�@minvely
4. [IN] ���l�܂��́A�ϐ��@�F�@minvelz
�@�@�p�[�e�B�N���̑��x�̍ŏ��l���w�肵�܂��B
�@�@�����B

5. [IN] ���l�܂��́A�ϐ��@�F�@maxvelx
6. [IN] ���l�܂��́A�ϐ��@�F�@maxvely
7. [IN] ���l�܂��́A�ϐ��@�F�@maxvelz
�@�@�p�[�e�B�N���̑��x�̍ő�l���w�肵�܂��B
�@�@�����B





�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DSetParticleRotation
�p�[�e�B�N���̉�]���w�肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@rotation

%inst
�p�[�e�B�N���̉�]���w�肵�܂��B

���̊֐����Ăяo�����тɁA
�p�[�e�B�N�����w��p�x������]���܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@rotation
�@�@�p�[�e�B�N���̉�]���p�x�i�x�j�Ŏw�肵�܂��B



�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DSetParticleDiffuse
�p�[�e�B�N���̒��_�F���w�肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@r
p3 : [IN] ���l�܂��́A�ϐ��@�F�@g
p4 : [IN] ���l�܂��́A�ϐ��@�F�@b

%inst
�p�[�e�B�N���̒��_�F���w�肵�܂��B

�e�N�X�`���F�ƃ��W�����[�g����ĕ\������܂��B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@r
3. [IN] ���l�܂��́A�ϐ��@�F�@g
4. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�p�[�e�B�N���̒��_�F���w�肵�܂��B
�@�@���ꂼ��A�O����Q�T�T�̊Ԃ̒l���w�肵�܂��B






�o�[�W���� : ver3.0.1.5�Œǉ�

%index
E3DRenderParticle
�p�[�e�B�N����`�悵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@fps
p3 : [IN] �ϐ��܂��́A���l�@�F�@scid
p4 : [IN] �ϐ��܂��́A���l�@�F�@onlyupdate

%inst
�p�[�e�B�N����`�悵�܂��B

�Ăяo�����тɁA�p�[�e�B�N���̏��ŁA�����A�ʒu�ړ������āA
�`�悵�܂��B

1.0 / fps �b�������Ԃ�i�߂ĕ`�悵�܂��B
fps�Ƀ}�C�i�X�̒l���w�肵���ꍇ�́A
�p�[�e�B�N�����Î~������Ԃŕ`�悵�܂��B


E3DCreateParticle�Ŏw�肵��maxnum��葽���p�[�e�B�N����
�`��ł��܂���B
�p�[�e�B�N���̕��o���A�r���œr�؂��ꍇ�́A
maxnum�̒l�𑝂₷���A�܂��́A
E3DSetParticleEmitNum�̒l�����������邩�A�܂��́A
E3DSetParticleLife�Ɏw�肷��life�̒l�����������Ă��������B

��̓I�Ȏg�p��́A
e3dhsp3_particle.hsp
���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@fps
�@�@�P�b�Ԃɉ���A���̊֐����ĂԂ���
�@�@�w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@onlyupdate
�@�@�P���w�肵���ꍇ�́A
�@�@�`����s�킸��Ԃ̃A�b�v�f�[�g�̂ݍs���܂��B
�@�@�O���w�肵���ꍇ��ȗ������ꍇ��
�@�@�ʏ�ʂ�A�b�v�f�[�g�ƕ`����s���܂��B



�o�[�W���� : ver3.0.1.5�Œǉ�<BR>
      ver4.0.0.8�ň����ǉ�

%index
E3DSetParticleAlpha
�p�[�e�B�N���̓����x��ݒ肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mintime
p3 : [IN] ���l�܂��́A�ϐ��@�F�@maxtime
p4 : [IN] ���l�܂��́A�ϐ��@�F�@alpha

%inst
�p�[�e�B�N���̓����x��ݒ肵�܂��B

�p�[�e�B�N�������o����Ă���̎��ԑт��ƂɁA
�ݒ�\�ł��B

��������Ă���̎��Ԃ��Amintime����maxtime�̊Ԃɂ���
�p�[�e�B�N���ɑ΂��āA�������s���܂��B

ver3.0.1.7�ŕ��ׂ͋C�ɂ��Ȃ��Ă������x�ɂȂ�܂����B

�Ăяo�����тɐݒ肳��܂��B
���[�v���Ŏg�p���܂��B
�i��񂾂��Ăяo���Ă��Ӗ�������܂���j


��̓I�Ȏg�p��́A
e3dhsp3_particle2.hsp
���������������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@mintime
3. [IN] ���l�܂��́A�ϐ��@�F�@maxtime
�@�@�����������p�[�e�B�N���̎��ԑт�
�@�@�b�Ŏw�肵�܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@alpha
�@�@�����x���O����P�̊Ԃ̎����Ŏw�肵�܂��B




�o�[�W���� : ver3.0.1.6�Œǉ�

%index
E3DSetParticleUVTile
�p�[�e�B�N����UV��ݒ肵�܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mintime
p3 : [IN] ���l�܂��́A�ϐ��@�F�@maxtime
p4 : [IN] ���l�܂��́A�ϐ��@�F�@unum
p5 : [IN] ���l�܂��́A�ϐ��@�F�@vnum
p6 : [IN] ���l�܂��́A�ϐ��@�F�@tileno

%inst
�p�[�e�B�N����UV��ݒ肵�܂��B

�p�[�e�B�N�������o����Ă���̎��ԑт��ƂɁA
�ݒ�\�ł��B

��������Ă���̎��Ԃ��Amintime����maxtime�̊Ԃɂ���
�p�[�e�B�N���ɑ΂��āA�������s���܂��B

���̏����́A�r�f�I�������ɃA�N�Z�X����K�v������̂ŁA
������Əd�������ł��B
�ЂƂ̉摜�ɁA�^�C���摜��~���l�߂��e�N�X�`���́A�t�u���W���A�^�C���ԍ��ŁA�Z�b�g�ł��܂��B

�^�C����̃e�N�X�`���摜�ƃ^�C���ԍ��̑Ή��́A(Link http://www5d.biglobe.ne.jp/~ochikko/e3dhsp_texturetile.htm )�^�C���ԍ��̐������������������B


�Ăяo�����тɐݒ肳��܂��B
���[�v���Ŏg�p���܂��B
�i��񂾂��Ăяo���Ă��Ӗ�������܂���j


��̓I�Ȏg�p��́A
e3dhsp3_particle2.hsp
���������������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@mintime
3. [IN] ���l�܂��́A�ϐ��@�F�@maxtime
�@�@�����������p�[�e�B�N���̎��ԑт�
�@�@�b�Ŏw�肵�܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@unum
�@�@�e�N�X�`���̉������̕��������w�肵�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@vnum
�@�@�e�N�X�`���̏c�����̕��������w�肵�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@tileno
�@�@�ݒ肵�����^�C���ԍ����w�肵�܂��B




�o�[�W���� : ver3.0.1.6�Œǉ�

%index
E3DInitParticle
�p�[�e�B�N���̔�����Ԃ�������Ԃɖ߂��܂��B
%group
Easy3D For HSP3 : �p�[�e�B�N��

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@particleid

%inst
�p�[�e�B�N���̔�����Ԃ�������Ԃɖ߂��܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@particleid
�@�@�p�[�e�B�N�������ʂ���ID���w�肵�܂��B



�o�[�W���� : ver3.0.1.8�Œǉ�

%index
E3DPickFace2
�Q�c�̉�ʂ̍��W�ɑΉ�����A�R�c���f���̍��W���擾�ł��܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] �z��ϐ��@�F�@partarray
p4 : [IN] ���l�܂��́A�ϐ��@�F�@partnum
p5 : [IN] ���l�܂��́A�ϐ��@�F�@pos2x
p6 : [IN] ���l�܂��́A�ϐ��@�F�@pos2y
p7 : [IN] ���l�܂��́A�ϐ��@�F�@maxdist
p8 : [OUT] �ϐ��@�F�@partno
p9 : [OUT] �ϐ��@�F�@faceno
p10 : [OUT] �ϐ��@�F�@pos3x
p11 : [OUT] �ϐ��@�F�@pos3y
p12 : [OUT] �ϐ��@�F�@pos3z
p13 : [OUT] �ϐ��@�F�@nx
p14 : [OUT] �ϐ��@�F�@ny
p15 : [OUT] �ϐ��@�F�@nz
p16 : [OUT] �ϐ��@�F�@dist
p17 : [IN] ���l�܂��́A�ϐ��@�F�@calcmode

%inst
�Q�c�̉�ʂ̍��W�ɑΉ�����A�R�c���f���̍��W���擾�ł��܂��B

���肵�����p�[�c���w��ł���_�ȊO�́A
E3DPickFace�Ɠ����ł��B
�ڂ�����E3DPciFace�̐��������ǂ݂��������B

�p�[�c�ԍ��R�ƃp�[�c�ԍ��S�ɂ��Ă̂݁A������s�������ꍇ�́A
partnum = 2
dim partarray, partnum
partarray( 0 ) = 3
partarray( 1 ) = 4
�̗l�ɒl���Z�b�g���āAE3DPickFace2���Ăяo���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �z��ϐ��@�F�@partarray
�@�@���肵�����p�[�c�ԍ����w�肵�܂��B
�@�@dim partarray, partnum�ō쐬���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@partnum
�@�@partarray�z��̗v�f��


5. [IN] ���l�܂��́A�ϐ��@�F�@pos2x
6. [IN] ���l�܂��́A�ϐ��@�F�@pos2y
�@�@��ʏ�̂Q�c���W���w�肵�Ă��������B

7. [IN] ���l�܂��́A�ϐ��@�F�@maxdist
�@�@�ǂ̂��炢�̋����܂ŁA�R�c���f���̌��������邩���w�肵�܂��B
�@�@���̒l������������قǁA�����͍����ɂȂ�܂��B

8. [OUT] �ϐ��@�F�@partno
9. [OUT] �ϐ��@�F�@faceno
�@�@2D���W�ɑΉ�����R�c���W�����������ꍇ�ɁA
�@�@���̂R�c���f���̃p�[�c�̔ԍ��ƁA�ʂ̔ԍ���
�@�@�������܂��B

�@�@������Ȃ������ꍇ�́A-1���������܂��B

10. [OUT] �ϐ��@�F�@pos3x
11. [OUT] �ϐ��@�F�@pos3y
12. [OUT] �ϐ��@�F�@pos3z
�@�@�Q�c���W�ɑΉ�����R�c���W���������܂��B
�@�@partno��-1�ȊO�̒l���������Ă���Ƃ��̂݁A
�@�@�����̒l�͈Ӗ��������܂��B
�@�@�����^�̕ϐ��B

13. [OUT] �ϐ��@�F�@nx
14. [OUT] �ϐ��@�F�@ny
15. [OUT] �ϐ��@�F�@nz
�@�@2D���W�ɑΉ�����R�c���W���܂ޖʂ̖@���x�N�g����
�@�@�������܂��B

�@�@�x�N�g���̑傫���͂P�̂��̂������܂��B

�@�@partno��-1�ȊO�̒l���������Ă���Ƃ��̂݁A
�@�@�����̒l�͈Ӗ��������܂��B

�@�@�����^�̕ϐ��B

16. [OUT] �ϐ��@�F�@dist
�@�@���_�Ɓipos3x, pos3y, pos3z�j�Ƃ̋������������܂��B
�@�@partno��-1�ȊO�̒l���������Ă���Ƃ��̂݁A
�@�@���̒l�͈Ӗ��������܂��B
�@�@�����^�̕ϐ��B

17. [IN] ���l�܂��́A�ϐ��@�F�@calcmode
�@�@�P���w�肵�Ă��������B



�o�[�W���� : ver3.0.2.0�Œǉ�

%index
E3DChkConfWall3
E3DSetMovableArea, �܂��́AE3DLoadMQOFileAsMovableArea�ō쐬�����ǃf�[�^�ƁA�L�����N�^�[�̂����蔻����s���܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12
p1 : [IN] �ϐ��܂��́A���l�@�F�@charahsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@groundhsid
p3 : [IN] �z��ϐ��@�F�@partarray
p4 : [IN] ���l�܂��́A�ϐ��@�F�@partnum
p5 : [IN] �ϐ��܂��́A���l�@�F�@dist
p6 : [OUT] �ϐ��@�F�@result
p7 : [OUT] �ϐ��@�F�@adjustx
p8 : [OUT] �ϐ��@�F�@adjusty
p9 : [OUT] �ϐ��@�F�@adjustz
p10 : [OUT] �ϐ��@�F�@nx
p11 : [OUT] �ϐ��@�F�@ny
p12 : [OUT] �ϐ��@�F�@nz

%inst
E3DSetMovableArea, �܂��́AE3DLoadMQOFileAsMovableArea�ō쐬�����ǃf�[�^�ƁA�L�����N�^�[�̂����蔻����s���܂��B

���肵�����ǃf�[�^�̃p�[�c�ԍ����w��ł���_�ȊO�́A
E3DChkConfWall�Ɠ����ł��B
�ڂ����́AE3DChkConfWall�̐��������ǂ݂��������B

�ǃ��f���̃p�[�c�ԍ��R�ƃp�[�c�ԍ��S�ɂ��Ă̂݁A
������s�������ꍇ�́A
partnum = 2
dim partarray, partnum
partarray( 0 ) = 3
partarray( 1 ) = 4
�̗p�ɒl���Z�b�g���āAE3DConfWall3���Ăяo���Ă��������B






������
1. [IN] �ϐ��܂��́A���l�@�F�@charahsid
�@�@�ړ�����`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@groundhsid
�@�@E3DSetMovableArea�A
�@�@�܂��́AE3DLoadMQOFileAsMovableArea��
�@�@�쐬�����`��f�[�^��
�@�@���ʂ���id

3. [IN] �z��ϐ��@�F�@partarray
�@�@���肵�����ǂ̃p�[�c�ԍ����w�肵�܂��B
�@�@dim partarray, partnum�ō쐬���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@partnum
�@�@partarray�z��̗v�f��

5. [IN] �ϐ��܂��́A���l�@�F�@dist
�@�@���˕Ԃ鋗���B
�@�@dist�ɑ傫�Ȓl������ƁA
�@�@�Ԃ������ۂɑ傫�����˕Ԃ�悤�ɂȂ�܂��B
�@�@�����B

6. [OUT] �ϐ��@�F�@result
�@�@�����蔻��̌��ʂ��������܂��B
�@�@�ǂƂԂ������ꍇ�͂P���A
�@�@�Ԃ���Ȃ������ꍇ�́A�O���A�������܂��B

7. [OUT] �ϐ��@�F�@adjustx
8. [OUT] �ϐ��@�F�@adjusty
9. [OUT] �ϐ��@�F�@adjustz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�C����̍��W���A
�@�@(adjustx, adjusty, adjustz)�ɑ������܂��B
�@�@�����^�̕ϐ��B

10. [OUT] �ϐ��@�F�@nx
11. [OUT] �ϐ��@�F�@ny
12. [OUT] �ϐ��@�F�@nz
�@�@result != 0 �̂Ƃ��ɁA
�@�@�Ԃ������ʂ̖@���x�N�g���̒l���A
�@�@�������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver3.0.2.0�Œǉ�

%index
E3DGetMotionIDByName
���[�V�����̖��O���烂�[�V������ID���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@motname
p3 : [OUT] �ϐ��@�F�@motid

%inst
���[�V�����̖��O���烂�[�V������ID���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ������܂��́A������ϐ��@�F�@motname
�@�@RokDeBone2�Őݒ肵�����[�V�����̖��O�B

3. [OUT] �ϐ��@�F�@motid
�@�@���O��motname�ł��郂�[�V������ID���������܂��B



�o�[�W���� : ver3.0.2.0�Œǉ�

%index
E3DGetMotionNum
�ǂݍ���ł��郂�[�V�����̑������擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@motnum

%inst
�ǂݍ���ł��郂�[�V�����̑������擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [OUT] �ϐ��@�F�@motnum
�@�@���[�V�����̑������������܂��B


�o�[�W���� : ver3.0.2.0�Œǉ�

%index
E3DDot2
���ς��v�Z���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@vecx1
p2 : [IN] �ϐ��܂��́A���l�@�F�@vecy1 
p3 : [IN] �ϐ��܂��́A���l�@�F�@vecz1
p4 : [IN] �ϐ��܂��́A���l�@�F�@vecx2
p5 : [IN] �ϐ��܂��́A���l�@�F�@vecy2 
p6 : [IN] �ϐ��܂��́A���l�@�F�@vecz2
p7 : [OUT] �ϐ��@�F�@ret

%inst
���ς��v�Z���܂��B
E3DDot�ƈ���āAE3DDot2�́A�^�����x�N�g���𐳋K�����܂���B





������
1. [IN] �ϐ��܂��́A���l�@�F�@vecx1
2. [IN] �ϐ��܂��́A���l�@�F�@vecy1 
3. [IN] �ϐ��܂��́A���l�@�F�@vecz1
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@vecx2
5. [IN] �ϐ��܂��́A���l�@�F�@vecy2 
6. [IN] �ϐ��܂��́A���l�@�F�@vecz2
�@�@�����B

7. [OUT] �ϐ��@�F�@ret
�@�@���ς̌��ʂ���������B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver3.0.2.0�Œǉ�

%index
E3DChkConfParticle
�p�[�e�B�N���ƃ��f���f�[�^�̂����蔻������܂��B
%group
Easy3D For HSP3 : �����蔻��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@ptclid
p2 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@rate
p4 : [OUT] �ϐ��@�F�@confflag

%inst
�p�[�e�B�N���ƃ��f���f�[�^�̂����蔻������܂��B

���E�����g�p����������s���܂��B

���f���f�[�^���̋��E���̔��a���傫������Ƃ��́A
rate�����ɂP��菬�����l���w�肵�Ē������Ă��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@ptclid
�@�@�p�[�e�B�N�������ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@rate
�@�@���f���f�[�^�̋��E���̔��a�Ɋ|���Z����
�@�@���肵�܂��B
�@�@�P��菬�����l���w�肷��΁A
�@�@����̊��x�������܂��B
�@�@�����B

4. [OUT] �ϐ��@�F�@confflag
�@�@�p�[�e�B�N���ƃ��f���f�[�^��
�@�@�Ԃ����Ă���Ƃ��͂P��
�@�@�Ԃ����Ă��Ȃ��Ƃ��͂O���������܂��B





�o�[�W���� : ver3.0.2.3�Œǉ�

%index
E3DLoadSigFileAsGround
sig�t�@�C����n�ʂƂ��ēǂݍ���ŁAhsid�𓾂�B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p2 : [OUT] �ϐ��@�F�@hsid
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@mult

%inst
sig�t�@�C����n�ʂƂ��ēǂݍ���ŁAhsid�𓾂�B

sig�t�@�C���̓ǂݍ��ݑ��x�́Amqo�t�@�C���̓ǂݍ��݂����A
�����ԑ����Ȃ�܂��B




������
1. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.sig �̃p�X������B

2. [OUT] �ϐ��@�F�@hsid
�@�@�ǂݍ��񂾌`��f�[�^�����ʂ���hsid

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


4. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@���{�͂P�D�O�B
�@�@�����B



�o�[�W���� : ver3.0.2.5�Œǉ�<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DLoadSigFileAsGroundFromBuf
����������n�ʃf�[�^�̃��[�h���s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ������܂��́A������̕ϐ��@�F�@resdir
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p4 : [OUT] �ϐ��@�F�@hsid
p5 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p6 : [IN] �ϐ��܂��́A���l�@�F�@mult

%inst
����������n�ʃf�[�^�̃��[�h���s���܂��B
���������ɂ́Asig�t�@�C���Ɠ����t�H�[�}�b�g��
�����Ă���Ƃ݂Ȃ��āA�������܂��B

�e�N�X�`���t�@�C���́A�ʏ�Ǎ��Ɠ��l�ɁA
�t�@�C������s���܂��B

resdir�ɂ́A�e�N�X�`���̑��݂���t�H���_�̃p�X���w�肵�Ă��������B
html{
<strong>�Ō�ɁA&quot;\\&quot;��t����̂�Y��Ȃ��ł��������B</strong>
}html

�Ⴆ�΁A
resdir = &quot;C:\\hsp\\Meida\\&quot;
��
resdir = dir_cur+ &quot;\\&quot;
�Ȃǂ̂悤�Ɏw�肵�Ă��������B





������
1. [IN] ������܂��́A������̕ϐ��@�F�@resdir
�@�@�e�N�X�`���[�̂���t�H���_ �̃p�X������B
�@�@�Ō�ɁA&quot;\\&quot;���K�v�B

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

3. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

4. [OUT] �ϐ��@�F�@hsid
�@�@�ǂݍ��񂾌`��f�[�^�����ʂ���hsid

5. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


6. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@���{�͂P�D�O�B
�@�@�����B



�o�[�W���� : ver3.0.2.5�Œǉ�<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DGetCenterPos
�p�[�c�̒��S�̃O���[�o�����W���擾���܂��B
%group
Easy3D For HSP3 : ���f���ʒu

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [OUT] �ϐ��@�F�@posx
p4 : [OUT] �ϐ��@�F�@posy 
p5 : [OUT] �ϐ��@�F�@posz

%inst
�p�[�c�̒��S�̃O���[�o�����W���擾���܂��B
�p�[�c�̒��S�̍��W�́AE3DChkInView�Ōv�Z����܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

�@�@-1���w�肷��ƁA���f���S�̂̒��S���W��
�@�@�擾�ł��܂��B

3. [OUT] �ϐ��@�F�@posx
4. [OUT] �ϐ��@�F�@posy 
5. [OUT] �ϐ��@�F�@posz
�@�@�����^�̕ϐ��B
�@�@���S�̍��W���������܂��B



�o�[�W���� : ver3.0.2.7�Œǉ�

%index
E3DGetFaceNum
�w�肵���\���I�u�W�F�N�g�̖ʂ̑������擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [OUT] �ϐ��@�F�@facenum

%inst
�w�肵���\���I�u�W�F�N�g�̖ʂ̑������擾���܂��B






������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

3. [OUT] �ϐ��@�F�@facenum
�@�@�ʂ̑������������܂��B



�o�[�W���� : ver3.0.3.0�Œǉ�

%index
E3DGetFaceNormal
�w�肵���\���I�u�W�F�N�g�̖ʂ̖@�����擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@faceno
p4 : [OUT] �ϐ��@�F�@nx
p5 : [OUT] �ϐ��@�F�@ny 
p6 : [OUT] �ϐ��@�F�@nz

%inst
�w�肵���\���I�u�W�F�N�g�̖ʂ̖@�����擾���܂��B

E3DGetFaceNum�Ŏ擾�����ʂ̑�����facenum�Ƃ����Ƃ��A
faceno�����ɂ́A�O����facenum - 1�܂ł̒l��
�w�肵�Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�擾�������p�[�c�̔ԍ����w�肵�܂��B
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���
�@�@�n���Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@faceno
�@�@�ʂ̔ԍ����w�肵�܂��B

4. [OUT] �ϐ��@�F�@nx
5. [OUT] �ϐ��@�F�@ny 
6. [OUT] �ϐ��@�F�@nz
�@�@�����^�̕ϐ��B
�@�@�@���̃x�N�g�����������܂��B



�o�[�W���� : ver3.0.3.0�Œǉ�

%index
E3DCreateEmptyMotion
�p�����̓����Ă��Ȃ���̃��[�V�������쐬���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@motname
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameleng
p4 : [OUT] �ϐ��@�F�@mk

%inst
�p�����̓����Ă��Ȃ���̃��[�V�������쐬���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ������܂��́A������̕ϐ��@�F�@motname
�@�@���[�V�����̖��O�̕�����B

3. [IN] �ϐ��܂��́A���l�@�F�@frameleng
�@�@�쐬���郂�[�V�����̒����B�t���[�����B

4. [OUT] �ϐ��@�F�@mk
�@�@�쐬�������[�V���������ʂ���ԍ�




�o�[�W���� : ver3.0.3.5�Œǉ�

%index
E3DSetTextureMinMagFilter
�e�N�X�`���[���g��k���\������ۂ̃t�B���^�[���w�肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@minfilter
p4 : [IN] �ϐ��܂��́A���l�@�F�@magfilter
p5 : [IN] �ϐ��܂��́A���l�@�F�@scid

%inst
�e�N�X�`���[���g��k���\������ۂ̃t�B���^�[���w�肵�܂��B

�RD���f���A�w�i�A�X�v���C�g�A�r���{�[�h�Ɏw��ł��܂��B

minfilter�����ɂ͏k������ۂ̃t�B���^�[���w�肵�A
magfilter�����ɂ͊g�傷��ۂ̃t�B���^�[���w�肵�܂��B

�t�B���^�[�̎w��ɂ�e3dhsp3.as�Œ�`����Ă���ȉ��̂Q�̒萔���g���܂��B

D3DTEXF_POINT
�ŋߓ_�t�B���^�B
�ړI�̃s�N�Z���l�ɍł��߂����W�̃e�N�Z�����g���܂��B
�e�N�X�`�����ڂ₯��̂����ȏꍇ�ȂǂɎg���܂��B

D3DTEXF_LINEAR
�o���`��ԃt�B���^�B
�ړI�̃s�N�Z�������͂� 2 x 2 �̈�̃e�N�Z���̏d�ݕt���������ς��g���܂��B
�Ȃ߂炩�ȕ\�����������Ƃ��Ɏg���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

�@�@E3DCreateBG�ō쐬�����w�i�ɑ΂��ď������s�������ꍇ�͂O���w�肵�܂��B

�@�@�r���{�[�h�ɑ΂��ď������s�������ꍇ��-1���w�肵�܂��B

�@�@�X�v���C�g�ɑ΂��ď������s�������ꍇ��-2���w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�`��f�[�^�����ʂ���id���w�肵�܂��B

�@�@�w�i�̏ꍇ�͂O���w�肵�܂��B

�@�@�r���{�[�h�̏ꍇ�̓r���{�[�hID���w�肵�܂��B

�@�@�X�v���C�g�̏ꍇ�̓X�v���C�gID���w�肵�܂��B


3. [IN] �ϐ��܂��́A���l�@�F�@minfilter
�@�@�k���t�B���^�[

4. [IN] �ϐ��܂��́A���l�@�F�@magfilter
�@�@�g��t�B���^�[

5. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C��ID�B
�@�@���̈����́A�w�i�̎w��̏ꍇ�݈̂Ӗ��������܂��B




�o�[�W���� : ver3.0.3.7�Œǉ�

%index
E3DGetMotionName
�ǂݍ��ݍς݂̃��[�V�����̖��O���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [OUT] ������^�̕ϐ��@�F�@motname

%inst
�ǂݍ��ݍς݂̃��[�V�����̖��O���擾���܂��B

motname�����ɂ�
sdim motname, 256
�Ŋm�ۂ������������w�肵�Ă��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���id

3. [OUT] ������^�̕ϐ��@�F�@motname
�@�@���[�V�����̖��O���������܂��B
�@�@sdim motname, 256
�@�@�Ŋm�ۂ������������w�肵�Ă��������B




�o�[�W���� : ver3.0.3.8�Œǉ�

%index
E3DSetMotionName
���[�V�����ɖ��O��ݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] ������܂��́A������ϐ��@�F�@motname

%inst
���[�V�����ɖ��O��ݒ肵�܂��B

�Q�T�T�����ȉ��i�Q�T�T�o�C�g�ȉ��j�̖��O��ݒ肵�Ă��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���id

3. [IN] ������܂��́A������ϐ��@�F�@motname
�@�@���[�V�����̖��O���w�肵�܂��B
�@�@���O�̒����͂Q�T�T�����i�Q�T�T�o�C�g�j�܂łł��B



�o�[�W���� : ver3.0.3.8�Œǉ�

%index
E3DGetMaterialNoByName
�}�e���A��������}�e���A���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@motname
p3 : [OUT] �ϐ��@�F�@matno

%inst
�}�e���A��������}�e���A���ԍ����擾���܂��B

�}�e���A������RokDeBone2�̃��C�����j���[��
�u�ʃ}�e���A���v���j���[���������Ƃ��Ɍ����_�C�A���O��
�m�F�ł��܂��B

ver4.0.0.1�ȍ~��RokDeBone2��mqo����f�[�^��ǂݍ���ł���ꍇ�ɂ́A�}�e���A�����̓��^�Z�R�C�A�̍ގ����Ɠ����ł��B

���݂��Ȃ��}�e���A������n�����ꍇ�́A
�}�e���A���ԍ��ɂ�-3���Ԃ���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ������܂��́A������ϐ��@�F�@motname
�@�@�}�e���A���̖��O���w�肵�܂��B
�@�@���O�̒����͂Q�T�T�����i�Q�T�T�o�C�g�j�܂łł��B

3. [OUT] �ϐ��@�F�@matno
�@�@�}�e���A���̔ԍ����������܂��B
�@�@���݂��Ȃ����O��n�����ꍇ��-3���������܂��B




�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialAlpha
�}�e���A���̓����x���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@alpha

%inst
�}�e���A���̓����x���擾���܂��B

�����x��0.0����1.0�܂ł̎����ł��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@alpha
�@�@�����x���������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialDiffuse
�}�e���A���̊g�U���idiffuse�j���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@R
p4 : [OUT] �ϐ��@�F�@G
p5 : [OUT] �ϐ��@�F�@B

%inst
�}�e���A���̊g�U���idiffuse�j���擾���܂��B

R, G, B�͂��ꂼ��ԁA�΁A�̋������O����Q�T�T�ŕ\�������̂ł��B






������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@R
4. [OUT] �ϐ��@�F�@G
5. [OUT] �ϐ��@�F�@B
�@�@diffuse��RGB���������܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialSpecular
�}�e���A���̔��ˌ��ispecular�j���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@R
p4 : [OUT] �ϐ��@�F�@G
p5 : [OUT] �ϐ��@�F�@B

%inst
�}�e���A���̔��ˌ��ispecular�j���擾���܂��B
R, G, B�͂��ꂼ��ԁA�΁A�̋������O����Q�T�T�ŕ\�������̂ł�



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@R
4. [OUT] �ϐ��@�F�@G
5. [OUT] �ϐ��@�F�@B
�@�@specular��RGB���������܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialAmbient
�}�e���A���̎��͌��iambient�j���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@R
p4 : [OUT] �ϐ��@�F�@G
p5 : [OUT] �ϐ��@�F�@B

%inst
�}�e���A���̎��͌��iambient�j���擾���܂��B
R, G, B�͂��ꂼ��ԁA�΁A�̋������O����Q�T�T�ŕ\�������̂ł�



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@R
4. [OUT] �ϐ��@�F�@G
5. [OUT] �ϐ��@�F�@B
�@�@ambient��RGB���������܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialEmissive
�}�e���A���̎��ȏƖ��iemissiver�j���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@R
p4 : [OUT] �ϐ��@�F�@G
p5 : [OUT] �ϐ��@�F�@B

%inst
�}�e���A���̎��ȏƖ��iemissiver�j���擾���܂��B

R, G, B�͂��ꂼ��ԁA�΁A�̋������O����Q�T�T�ŕ\�������̂ł�



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@R
4. [OUT] �ϐ��@�F�@G
5. [OUT] �ϐ��@�F�@B
�@�@emissive��RGB���������܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialPower
�}�e���A���̔��˂̋���(power)���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@power

%inst
�}�e���A���̔��˂̋���(power)���擾���܂��B

power�͎����ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@power
�@�@power���������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialBlendingMode
�}�e���A���̔��������[�h���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@mode

%inst
�}�e���A���̔��������[�h���擾���܂��B

mode�̒l�̈Ӗ���
�O�̂Ƃ�
���_�A���t�@�l�ɂ�锼�������[�h�ł��B

�P�̂Ƃ��@
�A�b�h���[�h�ł��B

�Q�̂Ƃ�
���_�A���t�@���l�������A�b�h���[�h�ł��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@mode
�@�@���������[�h���������܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetMaterialAlpha
�}�e���A���̓����x��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] �ϐ��܂��́A���l�@�F�@alpha

%inst
�}�e���A���̓����x��ݒ肵�܂��B

�����x��0.0����1.0�̎����Ŏw�肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B






������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] �ϐ��܂��́A���l�@�F�@alpha
�@�@�����x�B
�@�@�����B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetMaterialDiffuse
�}�e���A���̊g�U��(diffuse)��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p4 : [IN] ���l�܂��́A�ϐ��@�F�@R
p5 : [IN] ���l�܂��́A�ϐ��@�F�@G
p6 : [IN] ���l�܂��́A�ϐ��@�F�@B

%inst
�}�e���A���̊g�U��(diffuse)��ݒ肵�܂��B

RGB�͂O����Q�T�T�̒l�Ŏw�肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B


4. [IN] ���l�܂��́A�ϐ��@�F�@R
5. [IN] ���l�܂��́A�ϐ��@�F�@G
6. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B




�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetMaterialSpecular
�}�e���A���̔��ˌ�(specular)��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p4 : [IN] ���l�܂��́A�ϐ��@�F�@R
p5 : [IN] ���l�܂��́A�ϐ��@�F�@G
p6 : [IN] ���l�܂��́A�ϐ��@�F�@B

%inst
�}�e���A���̔��ˌ�(specular)��ݒ肵�܂��B

RGB�͂O����Q�T�T�̒l�Ŏw�肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B


4. [IN] ���l�܂��́A�ϐ��@�F�@R
5. [IN] ���l�܂��́A�ϐ��@�F�@G
6. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetMaterialAmbient
�}�e���A���̎��͌�(ambient)��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p4 : [IN] ���l�܂��́A�ϐ��@�F�@R
p5 : [IN] ���l�܂��́A�ϐ��@�F�@G
p6 : [IN] ���l�܂��́A�ϐ��@�F�@B

%inst
�}�e���A���̎��͌�(ambient)��ݒ肵�܂��B

RGB�͂O����Q�T�T�̒l�Ŏw�肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B


4. [IN] ���l�܂��́A�ϐ��@�F�@R
5. [IN] ���l�܂��́A�ϐ��@�F�@G
6. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetMaterialEmissive
�}�e���A���̎��ȏƖ�(emissive)��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p4 : [IN] ���l�܂��́A�ϐ��@�F�@R
p5 : [IN] ���l�܂��́A�ϐ��@�F�@G
p6 : [IN] ���l�܂��́A�ϐ��@�F�@B

%inst
�}�e���A���̎��ȏƖ�(emissive)��ݒ肵�܂��B

RGB�͂O����Q�T�T�̒l�Ŏw�肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@�p�[�c�̐F���i�q�C�f�C�a�j�ɃZ�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@�p�[�c�̐F�ɁiR/255, G/255, B/255�j����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@�p�[�c�̐F�Ɂi�q�C�f�C�a�j�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@�p�[�c�̐F����i�q�C�f�C�a�j�����Z���܂��B


4. [IN] ���l�܂��́A�ϐ��@�F�@R
5. [IN] ���l�܂��́A�ϐ��@�F�@G
6. [IN] ���l�܂��́A�ϐ��@�F�@B
�@�@�w�肵�����F���i�q�C�f�C�a�j�Ŏw�肵�܂��B
�@�@�O����Q�T�T�܂ł̒l���w�肵�Ă��������B

�@�@setflag�ɏ�Z���w�肵���ꍇ�́A
�@�@�e�����ɁAR/255, G/255, B/255����Z���܂��B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetMaterialPower
�}�e���A���̔��˂̋���(power)��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@setflag
p4 : [IN] ���l�܂��́A�ϐ��@�F�@power

%inst
�}�e���A���̔��˂̋���(power)��ݒ肵�܂��B

�����Ŏw�肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@setflag
�@�@setflag���O�̂Ƃ��́A
�@�@power�����̂܂܃Z�b�g���܂��B

�@�@setflag���P�̂Ƃ��́A
�@�@���݂̃}�e���A����power����Z���܂��B

�@�@setflag���Q�̂Ƃ��́A
�@�@���݂̃}�e���A����power�𑫂��Z���܂��B

�@�@setflag���R�̂Ƃ��́A
�@�@���݂̃}�e���A������power�����Z���܂��B


4. [IN] ���l�܂��́A�ϐ��@�F�@power
�@�@���˂̋������w�肵�܂��B
�@�@�����B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetMaterialBlendingMode
�}�e���A���̔��������[�h��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@blendmode

%inst
�}�e���A���̔��������[�h��ݒ肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B

blendmode 0, 1, 2�̓A���t�@�e�X�g�̐ݒ���ύX���܂��B
�A���t�@�e�X�g�̐ݒ��ύX�������Ȃ��ꍇ��
blendmode 100, 101, 102�����g�����������B

ver5.0.5.0�Ń��[�h���S�����܂����B

ver5.1.0.1�Ń��[�h���Q�����܂����B

�A���t�@�e�X�g��ݒ肵�����ꍇ��
E3DSetMaterialAlphaTest�����g�p���������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@blendmode
�@�@�O���w�肷���
�@�@���_�A���t�@�l�ɂ�锼�������[�h�ɂȂ�܂��B
�@�@�A���t�@�e�X�g�̓I�t�ɂȂ�܂��B

�@�@�P���w�肷��Ɓ@
�@�@�A�b�h���[�h�ɂȂ�܂��B
�@�@�A���t�@�e�X�g�̓I���ɂȂ�W��菬�����A���t�@�̂Ƃ��ɕ`�悳��Ȃ��Ȃ�܂��iZ�o�b�t�@�ɂ��j�B

�@�@�Q���w�肷��ƁA
�@�@���_�A���t�@���l�������A�b�h���[�h�ɂȂ�܂��B
�@�@�A���t�@�e�X�g�̓I�t�ɂȂ�܂��B


�@�@�P�O�O���w�肷���
�@�@���_�A���t�@�l�ɂ�锼�������[�h�ɂȂ�܂��B
�@�@�A���t�@�e�X�g�͕ύX���܂���B

�@�@�P�O�P���w�肷��Ɓ@
�@�@�A�b�h���[�h�ɂȂ�܂��B
�@�@�A���t�@�e�X�g�͕ύX���܂���B

�@�@�P�O�Q���w�肷��ƁA
�@�@���_�A���t�@���l�������A�b�h���[�h�ɂȂ�܂��B
�@�@�A���t�@�e�X�g�͕ύX���܂���B


�@�@�P�O�R���w�肷��Ə�Z���[�h
�@�@�P�O�S���w�肷��ƌ��Z���[�h
�@�@�P�O�T���w�肷��ƃX�N���[�����[�h
�@�@�P�O�U���w�肷��ƃl�K���]���[�h�ɂȂ�܂��B

�@�@�P�O�V���w�肷��ƃI�[�o�[���C���������[�h�B
�@�@�P�O�W���w�肷��ƕ����Ă������[�h�ɂȂ�܂��B





�o�[�W���� : ver4.0.0.1�Œǉ�<BR>
      ver5.0.2.9�Ŋg��<BR>
      ver5.0.5.0�Ŋg��<BR>
      ver5.1.0.1�Ŋg��

%index
E3DGetTextureFromMaterial
�}�e���A���ɐݒ肳��Ă���e�N�X�`�����擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] ���l�@�F�@texid

%inst
�}�e���A���ɐݒ肳��Ă���e�N�X�`�����擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] ���l�@�F�@texid
�@�@�e�N�X�`����ID���������܂��B
�@�@�G���[�̂Ƃ���-1���������܂��B




�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DSetTextureToMaterial
�}�e���A���Ƀe�N�X�`����ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@texid

%inst
�}�e���A���Ƀe�N�X�`����ݒ肵�܂��B

�}�e���A���̕ύX�ɂ��
�\���I�u�W�F�N�g�̑Ή����镔���̕\�����ʒP�ʂŕω����܂��B


�e�N�X�`�����Z�b�g���Ă��A
�t�u���W�͎����I�ɐ�������܂���B
���I�Ƀe�N�X�`����ݒ肷��ꍇ�́A
�t�u���W��E3DSetUV�Őݒ肷�邩�A
�������́A
���炩���߁A���f���ɉ��̃e�N�X�`����\���Ă����Ăt�u�ݒ肵�Ă����K�v������܂��B


��̓I�Ȏg�p��́A
html{
<strong>e3dhsp3_TextureChange.hsp</strong>
}html
�ɏ����܂����̂ŁA�������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@texid
�@�@�e�N�X�`����ID���w�肵�Ă��������B



�o�[�W���� : ver4.0.0.1�Œǉ�

%index
E3DGetMaterialNo
�ʂ̃}�e���A���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@faceno
p4 : [OUT] �ϐ��@�F�@matno

%inst
�ʂ̃}�e���A���ԍ����擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@faceno
�@�@�ʂ����ʂ���ԍ����w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@matno
�@�@�}�e���A���̔ԍ����������܂��B



�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DSetMotionKindML
�{�[�����ƂɍĐ����郂�[�V�����̔ԍ���ݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �z��ϐ��@�F�@list
p4 : [IN] �z��ϐ��@�F�@notlist

%inst
�{�[�����ƂɍĐ����郂�[�V�����̔ԍ���ݒ肵�܂��B

list, notlist�̓{�[���̔ԍ����Z�b�g�����z��
list�Ɏw�肵���ԍ��Ƃ��̎q���S���ɑ΂��čċA�I�ɏ������s���B
notlist�ɂ͏��O�������{�[���̓��A��Ԑe�̔ԍ����L�q����B
notlist�ɋL�q�����ԍ��́Alist�ɋL�q�����ԍ������D�悳���B
list, notlist�ɂ͕����̔ԍ����w��ł��邪�A��ԍŌ�̗v�f�ɂ͂O���Z�b�g���Ȃ���΂Ȃ�Ȃ��B
list�̐擪�v�f�Ɍ���-1���w��ł���B
-1�w��͂��ׂẴ{�[���ɑ΂��鏈����\���B

�����̃{�[���ԍ����Q�A���Ђ��̔ԍ����R�A����̔ԍ����S�A
�E���̃{�[���ԍ����P�Q�A�E�Ђ��̔ԍ����P�R�A�E��̔ԍ����P�S�A
��Ɏ����Ă��镐��̃{�[���ԍ����Q�Q�Ƃ���
�����������̕����Ƀ��[�V������ݒ肵�����ꍇ�́A

list(0) = 2
list(1) = 12
list(2) = 0

notlist(0) = 22
notlist(1) = 0

�̂悤��list, notlist�̔z��ɒl���Z�b�g���Ė��߂��Ăяo���B
�Q���w�肷��΂Q�̎q���S���ɏ������s����̂łR�C�S���w�肷��K�v�͂Ȃ��B
���l�ɂP�Q���w�肷��΂P�Q�̎q���S���ɏ������s����̂łP�R�C�P�S���w�肷��K�v�͂Ȃ��B
���X�g�̍Ō�ɂ͕K��0���w�肷��B

��̓I�Ȏg�p���
html{
<strong>e3dhsp3_MultiLayerMotion.hsp�ɏ����܂����̂ł������������B</strong>
}html




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���id

3. [IN] �z��ϐ��@�F�@list
4. [IN] �z��ϐ��@�F�@notlist
�@�@�ݒ肵�����{�[���ԍ���
�@�@�ݒ肵�����Ȃ��{�[���ԍ����Z�b�g�����z��B
�@�@�ڂ����͑O�L���������������B


�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DSetMotionFrameNoML
�{�[�����ƂɍĐ����郂�[�V�����̔ԍ��ƃt���[���ԍ���ݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �z��ϐ��@�F�@list
p5 : [IN] �z��ϐ��@�F�@notlist

%inst
�{�[�����ƂɍĐ����郂�[�V�����̔ԍ��ƃt���[���ԍ���ݒ肵�܂��B


list, notlist�̓{�[���̔ԍ����Z�b�g�����z��
list�Ɏw�肵���ԍ��Ƃ��̎q���S���ɑ΂��čċA�I�ɏ������s���B
notlist�ɂ͏��O�������{�[���̓��A��Ԑe�̔ԍ����L�q����B
notlist�ɋL�q�����ԍ��́Alist�ɋL�q�����ԍ������D�悳���B
list, notlist�ɂ͕����̔ԍ����w��ł��邪�A��ԍŌ�̗v�f�ɂ͂O���Z�b�g���Ȃ���΂Ȃ�Ȃ��B
list�̐擪�v�f�Ɍ���-1���w��ł���B
-1�w��͂��ׂẴ{�[���ɑ΂��鏈����\���B

�����̃{�[���ԍ����Q�A���Ђ��̔ԍ����R�A����̔ԍ����S�A
�E���̃{�[���ԍ����P�Q�A�E�Ђ��̔ԍ����P�R�A�E��̔ԍ����P�S�A
��Ɏ����Ă��镐��̃{�[���ԍ����Q�Q�Ƃ���
�����������̕����Ƀ��[�V������ݒ肵�����ꍇ�́A

list(0) = 2
list(1) = 12
list(2) = 0

notlist(0) = 22
notlist(1) = 0

�̂悤��list, notlist�̔z��ɒl���Z�b�g���Ė��߂��Ăяo���B
�Q���w�肷��΂Q�̎q���S���ɏ������s����̂łR�C�S���w�肷��K�v�͂Ȃ��B
���l�ɂP�Q���w�肷��΂P�Q�̎q���S���ɏ������s����̂łP�R�C�P�S���w�肷��K�v�͂Ȃ��B
���X�g�̍Ō�ɂ͕K��0���w�肷��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ��B


4. [IN] �z��ϐ��@�F�@list
5. [IN] �z��ϐ��@�F�@notlist
�@�@�ݒ肵�����{�[���ԍ���
�@�@�ݒ肵�����Ȃ��{�[���ԍ����Z�b�g�����z��B
�@�@�ڂ����͑O�L���������������B


�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DSetNextMotionFrameNoML
���ݍĐ����Ă��郂�[�V�����̌�ɂÂ��čĐ����郂�[�V�������{�[�����Ƃɐݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@srcmotid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@nextmotid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@nextframeno
p5 : [IN] ���l�܂��́A�ϐ��@�F�@befframeno
p6 : [IN] �z��ϐ��@�F�@list
p7 : [IN] �z��ϐ��@�F�@notlist

%inst
���ݍĐ����Ă��郂�[�V�����̌�ɂÂ��čĐ����郂�[�V�������{�[�����Ƃɐݒ肵�܂��B


list, notlist�̓{�[���̔ԍ����Z�b�g�����z��
list�Ɏw�肵���ԍ��Ƃ��̎q���S���ɑ΂��čċA�I�ɏ������s���B
notlist�ɂ͏��O�������{�[���̓��A��Ԑe�̔ԍ����L�q����B
notlist�ɋL�q�����ԍ��́Alist�ɋL�q�����ԍ������D�悳���B
list, notlist�ɂ͕����̔ԍ����w��ł��邪�A��ԍŌ�̗v�f�ɂ͂O���Z�b�g���Ȃ���΂Ȃ�Ȃ��B
list�̐擪�v�f�Ɍ���-1���w��ł���B
-1�w��͂��ׂẴ{�[���ɑ΂��鏈����\���B

�����̃{�[���ԍ����Q�A���Ђ��̔ԍ����R�A����̔ԍ����S�A
�E���̃{�[���ԍ����P�Q�A�E�Ђ��̔ԍ����P�R�A�E��̔ԍ����P�S�A
��Ɏ����Ă��镐��̃{�[���ԍ����Q�Q�Ƃ���
�����������̕����Ƀ��[�V������ݒ肵�����ꍇ�́A

list(0) = 2
list(1) = 12
list(2) = 0

notlist(0) = 22
notlist(1) = 0

�̂悤��list, notlist�̔z��ɒl���Z�b�g���Ė��߂��Ăяo���B
�Q���w�肷��΂Q�̎q���S���ɏ������s����̂łR�C�S���w�肷��K�v�͂Ȃ��B
���l�ɂP�Q���w�肷��΂P�Q�̎q���S���ɏ������s����̂łP�R�C�P�S���w�肷��K�v�͂Ȃ��B
���X�g�̍Ō�ɂ͕K��0���w�肷��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@srcmotid
3. [IN] ���l�܂��́A�ϐ��@�F�@nextmotid
4. [IN] ���l�܂��́A�ϐ��@�F�@nextframeno
5. [IN] ���l�܂��́A�ϐ��@�F�@befframeno
�@�@srcmotid�̃��[�V�������Abefframe�t���[���ԍ��ɒB������Anextmotid�̃��[�V�����́Anextframeno�̃t���[���ԍ��ɁA�W�����v����悤�ɐݒ肳��܂��B
befframe��-1���Z�b�g�����ꍇ�́Asrcmotid���ŏI�t���[���ɒB������ɃW�����v���܂��B


6. [IN] �z��ϐ��@�F�@list
7. [IN] �z��ϐ��@�F�@notlist
�@�@�ݒ肵�����{�[���ԍ���
�@�@�ݒ肵�����Ȃ��{�[���ԍ����Z�b�g�����z��B
�@�@�ڂ����͑O�L���������������B




�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DSetMOAEventNoML
���[�V�����A�N�Z�����[�^�̃C�x���g�ԍ����{�[�����Ƃɐݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@eventno
p3 : [IN] �z��ϐ��@�F�@list
p4 : [IN] �z��ϐ��@�F�@notlist

%inst
���[�V�����A�N�Z�����[�^�̃C�x���g�ԍ����{�[�����Ƃɐݒ肵�܂��B

���̖��߂�K�v�ȕ������Ă񂾌�ɂP��E3DSetNewPoseML���ĂԕK�v������܂��B
list, notlist�̓{�[���̔ԍ����Z�b�g�����z��
list�Ɏw�肵���ԍ��Ƃ��̎q���S���ɑ΂��čċA�I�ɏ������s���B
notlist�ɂ͏��O�������{�[���̓��A��Ԑe�̔ԍ����L�q����B
notlist�ɋL�q�����ԍ��́Alist�ɋL�q�����ԍ������D�悳���B
list, notlist�ɂ͕����̔ԍ����w��ł��邪�A��ԍŌ�̗v�f�ɂ͂O���Z�b�g���Ȃ���΂Ȃ�Ȃ��B
list�̐擪�v�f�Ɍ���-1���w��ł���B
-1�w��͂��ׂẴ{�[���ɑ΂��鏈����\���B

�����̃{�[���ԍ����Q�A���Ђ��̔ԍ����R�A����̔ԍ����S�A
�E���̃{�[���ԍ����P�Q�A�E�Ђ��̔ԍ����P�R�A�E��̔ԍ����P�S�A
��Ɏ����Ă��镐��̃{�[���ԍ����Q�Q�Ƃ���
�����������̕����Ƀ��[�V������ݒ肵�����ꍇ�́A

list(0) = 2
list(1) = 12
list(2) = 0

notlist(0) = 22
notlist(1) = 0

�̂悤��list, notlist�̔z��ɒl���Z�b�g���Ė��߂��Ăяo���B
�Q���w�肷��΂Q�̎q���S���ɏ������s����̂łR�C�S���w�肷��K�v�͂Ȃ��B
���l�ɂP�Q���w�肷��΂P�Q�̎q���S���ɏ������s����̂łP�R�C�P�S���w�肷��K�v�͂Ȃ��B
���X�g�̍Ō�ɂ͕K��0���w�肷��B


��̓I�Ȏg�p���
html{
<strong>e3dhsp3_MultiLayerMotion_MOA.hsp</strong>
}html
�ɏ����܂����̂ł������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@eventno
�@�@���[�V�����̕ω��̃g���K�[�ƂȂ�C�x���g�ԍ��B

3. [IN] �z��ϐ��@�F�@list
4. [IN] �z��ϐ��@�F�@notlist
�@�@�ݒ肵�����{�[���ԍ���
�@�@�ݒ肵�����Ȃ��{�[���ԍ����Z�b�g�����z��B
�@�@�ڂ����͑O�L���������������B



�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DGetMotionFrameNoML
�w�肵���{�[���̃��[�V�����ԍ��ƃt���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [OUT] �ϐ��@�F�@motid
p4 : [OUT] �ϐ��@�F�@frameno

%inst
�w�肵���{�[���̃��[�V�����ԍ��ƃt���[���ԍ����擾���܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c

3. [OUT] �ϐ��@�F�@motid
�@�@���[�V�����ԍ����������܂��B

4. [OUT] �ϐ��@�F�@frameno
�@�@�t���[���ԍ����������܂��B




�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DGetNextMotionFrameNoML
E3DSetNextMotionFrameNoML�Őݒ肵�������{�[�����ƂɎ擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p4 : [OUT] �ϐ��@�F�@nextmotid
p5 : [OUT] �ϐ��@�F�@nextframeno

%inst
E3DSetNextMotionFrameNoML�Őݒ肵�������{�[�����ƂɎ擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c

4. [OUT] �ϐ��@�F�@nextmotid
�@�@�W�����v��̃��[�V�����ԍ����������܂��B

5. [OUT] �ϐ��@�F�@nextframeno
�@�@�W�����v��̃t���[���ԍ����������܂��B



�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DSetNewPoseML
�}���`���C���[���[�V�����̎d�l�ɏ]���āA�V�����p���������ꂼ��̃{�[���ɃZ�b�g���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid

%inst
�}���`���C���[���[�V�����̎d�l�ɏ]���āA�V�����p���������ꂼ��̃{�[���ɃZ�b�g���܂��B

��̓I�Ȏg�p���
html{
<strong>e3dhsp3_MultiLayerMotion.hsp</strong>
}html��
html{
<strong>e3dhsp3_MultiLayerMotion_MOA.hsp</strong>
}html
�ɏ����܂����̂ł������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c



�o�[�W���� : ver4.0.0.6�Œǉ�

%index
E3DGetCurrentBonePos
���݂̃{�[���̈ʒu���擾���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@poskind
p4 : [OUT] �ϐ��@�F�@posx
p5 : [OUT] �ϐ��@�F�@posy
p6 : [OUT] �ϐ��@�F�@posz

%inst
���݂̃{�[���̈ʒu���擾���܂��B
E3DSetNewPose, E3DSetNewPoseML�̌��ʂ��g�p���܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@poskind
�@�@poskind = 0 ---&gt; ���[�J�����W�i�{�[���ό`�Ȃ��j
�@�@poskind = 1 ---&gt; �O���[�o�����W�i�{�[���ό`����j
�@�@poskind = 2 ---&gt; ���[�J�����W�i�{�[���ό`����j

4. [OUT] �ϐ��@�F�@posx
5. [OUT] �ϐ��@�F�@posy
6. [OUT] �ϐ��@�F�@posz
�@�@�{�[���̈ʒu���������܂��B
�@�@�����^�̕ϐ��B




�o�[�W���� : ver4.0.0.8�Œǉ�

%index
E3DGetCurrentBoneQ
���݂̃{�[���̎p�������擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@kind
p4 : [IN][OUT] ���l�܂��́A�ϐ��@�F�@qid

%inst
���݂̃{�[���̎p�������擾���܂��B
E3DSetNewPose, E3DSetNewPoseML�̌��ʂ��g�p���܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetBoneNoByName�܂��́A
�@�@E3DGetPartNoByName�Ŏ擾�����ԍ����w�肵�Ă��������B

3. [IN] ���l�܂��́A�ϐ��@�F�@kind
�@�@�e�̉e�����󂯂��N�H�[�^�j�I����
�@�@�擾����ꍇ�́A�P���w�肵�Ă��������B

�@�@�e�̉e�����󂯂Ă��Ȃ��N�H�[�^�j�I����
�@�@�擾����ꍇ�́A�O���w�肵�Ă��������B

�@�@�e�̉e�����󂯁A
�@�@�X�ɁA���f���S�̂̌����̉e�����󂯂��N�H�[�^�j�I�����擾
�@�@����ɂ́A�Q���w�肵�Ă��������B


4. [IN][OUT] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���ԍ��B
�@�@E3DCreateQ�Ŏ擾�����ԍ����w�肵�Ă��������B

�@�@qid�Ŏ��ʂ����N�H�[�^�j�I���̓��e�ɁA
�@�@�w�肵���{�[���̃N�H�[�^�j�I���̓��e���A
�@�@������܂��B



�o�[�W���� : ver4.0.0.8�Œǉ�

%index
E3DChkBumpMapEnable
�n�[�h�E�F�A���o���v�}�b�v��\���\���ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [OUT]�ϐ��@�F�@flag

%inst
�n�[�h�E�F�A���o���v�}�b�v��\���\���ǂ����𒲂ׂ܂��B


������
1. [OUT]�ϐ��@�F�@flag
�@�@�o���v�}�b�v�\���\�̏ꍇ�͂O�ȊO���A
�@�@�\���s�\�̂Ƃ��͂O���������܂��B



�o�[�W���� : ver4.0.1.4�Œǉ�

%index
E3DEnableBumpMap
�o���v�}�b�v�\�����g�p���邩�ǂ�����ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�o���v�}�b�v�\�����g�p���邩�ǂ�����ݒ肵�܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@�O���w�肷��ƃo���v�}�b�v��\�����܂���B
�@�@�P���w�肷��ƃn�[�h�E�F�A�ɔ\�͂�����ꍇ�Ɍ���A�o���v�}�b�v��\���\�ɂ��܂��B



�o�[�W���� : ver4.0.1.4�Œǉ�

%index
E3DConvHeight2NormalMap
�����̍����}�b�v�̉摜�f�[�^���AE3D�Ŏg�p�\�Ȗ@���}�b�v�ɕϊ����܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3
p1 : [IN] ������܂��́A������ϐ��@�F�@hmapname
p2 : [IN] ������܂��́A������ϐ��@�F�@nmapname
p3 : [IN] ���l�܂��́A�ϐ��@�F�@hparam

%inst
�����̍����}�b�v�̉摜�f�[�^���AE3D�Ŏg�p�\�Ȗ@���}�b�v�ɕϊ����܂��B


������
1. [IN] ������܂��́A������ϐ��@�F�@hmapname
�@�@�����摜�̃t�@�C���̃p�X�B

2. [IN] ������܂��́A������ϐ��@�F�@nmapname
�@�@�@���}�b�v�̃t�@�C���̃p�X�B
�@�@�o�̓t�@�C�����BBMP�̂ݗL���B

3. [IN] ���l�܂��́A�ϐ��@�F�@hparam
�@�@�o���v�}�b�v�̍����̃p�����[�^�B
�@�@�l���傫���قǒi���������Ȃ�܂��B
�@�@�����B



�o�[�W���� : ver4.0.1.4�Œǉ�

%index
E3DSetBumpMapToMaterial
E3DCreateTexture�ō쐬�����e�N�X�`�����o���v�}�b�v�ɐݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@texid

%inst
E3DCreateTexture�ō쐬�����e�N�X�`�����o���v�}�b�v�ɐݒ肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ���l�܂��́A�ϐ��@�F�@texid
�@�@�e�N�X�`����ID���w�肵�Ă��������B

�@�@-1���w�肷��ƃo���v�}�b�v�������ɂȂ�܂��B




�o�[�W���� : ver4.0.1.4�Œǉ�

%index
E3DGetMOATrunkInfo
MOA�̕��򌳃��[�V�����̏����擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [OUT] �z��ϐ��@�F�@trunkinfo

%inst
MOA�̕��򌳃��[�V�����̏����擾���܂��B

trunkinfo�����ɂ�
dim trunkinfo, MOAT_MAX
�ō쐬�����z����w�肵�Ă��������B

�擾����trunkinfo���ɂ�e3dhsp3.as�Œ�`���Ă���
MOAT_�Ŏn�܂�萔�ŃA�N�Z�X���܂��B

���ꂼ��̒萔�̖����͈ȉ��̂Ƃ���ł��B
MOAT_IDLING�@�A�C�h�����O���[�V�������ǂ����̃f�[�^
MOAT_EV0IDLE�@�C�x���g�ԍ��O�ŃA�C�h�����O�ɖ߂����ǂ����̃f�[�^
MOAT_COMID�@���ʕ���C�x���g�ԍ�
MOAT_NOTCOMID�@���ʕ���֎~�C�x���g�ԍ�
MOAT_BRANCHNUM�@����惂�[�V�������������邩

�Ⴆ�΋��ʕ���ԍ��̏��ɃA�N�Z�X����ꍇ��
trunkinfo( MOAT_COMID ) �̂悤�ɋL�q���܂��B

���̖��߂ɓn��motid��E3DGetMOAInfo�Ŏ擾����ID���g�p���Ă��������B

motid 0 (��ԃ��[�V����)���w�肷���
trunkinfo�ɂ͂��ׂĂO���������܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c

3. [OUT] �z��ϐ��@�F�@trunkinfo
�@�@���򌳃��[�V�����̏�񂪑������܂��B
�@�@�O�q�̕��@��dim�����z����w�肵�Ă��������B



�o�[�W���� : 

%index
E3DGetMOABranchInfo
MOA�̕���惂�[�V�����̏����擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p3 : [OUT] �z��ϐ��@�F�@branchinfo
p4 : [IN] ���l�܂��́A�ϐ��@�F�@branchnum
p5 : [OUT] �ϐ��@�F�@getnum

%inst
MOA�̕���惂�[�V�����̏����擾���܂��B

branchinfo�����ɂ�
dim branchinfo, MOAB_MAX, branchnum
�ō쐬�����z����w�肵�Ă��������B
branchnum�ɂ�E3DGetMOATrunkInfo�Ŏ擾����
trunkinfo( MOAT_BRANCHNUM ) ���w�肵�Ă��������B

�擾����branchinfo���ɂ�e3dhsp3.as�Œ�`���Ă���
MOAB_�Ŏn�܂�萔�ŃA�N�Z�X���܂��B

���ꂼ��̒萔�̖����͈ȉ��̂Ƃ���ł��B
MOAB_MOTID�@����惂�[�V�����̃��[�V����ID
MOAB_EVENTID�@�C�x���g�ԍ�
MOAB_FRAME1�@���򌳃t���[���ԍ�
MOAB_FRAME2�@�����t���[���ԍ�
MOAB_NOTFU�@��ԂȂ��ŕω������邩�ǂ���

branchinfo�̂P�Ԗڂ̃C���f�b�N�X�ɂ�MOAB_�Ŏn�܂�萔���w�肵�A�Q�Ԗڂ̃C���f�b�N�X�ɂ͂O����(getnum - 1) �̒l�i�����̔ԍ��j���w�肵�܂��B

�Ⴆ�΁A�ŏ��̕���̃C�x���g�ԍ��ɃA�N�Z�X����ꍇ��
branchinfo( MOAB_EVENTID, 0 ) �̂悤�ɋL�q���܂��B

���̖��߂ɓn��motid��E3DGetMOAInfo�Ŏ擾����ID���g�p���Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c

3. [OUT] �z��ϐ��@�F�@branchinfo
�@�@����惂�[�V�����̏�񂪑������܂��B
�@�@�O�q�̕��@��dim�����z����w�肵�Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@branchnum
�@�@branchinfo��dim�����Ƃ���branchnum���w�肵�Ă��������B

5. [OUT] �ϐ��@�F�@getnum
�@�@����惂�[�V�������������擾���������������܂��B




�o�[�W���� : 

%index
E3DSetMOABranchFrame1
MOA�̕���̕��򌳃t���[���ԍ�����ݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@tmotid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@bmotid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@frame1

%inst
MOA�̕���̕��򌳃t���[���ԍ�����ݒ肵�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@tmotid
�@�@���򌳃��[�V���������ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@bmotid
�@�@����惂�[�V���������ʂ���h�c

4. [IN] ���l�܂��́A�ϐ��@�F�@frame1
�@�@����̕��򌳃t���[���ԍ�
�@�@-1�w��́A���ł����򂷂邱�Ƃ�\���܂��B





�o�[�W���� : 

%index
E3DSetMOABranchFrame2
MOA�̕���̕����t���[���ԍ�����ݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@tmotid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@bmotid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@frame2

%inst
MOA�̕���̕����t���[���ԍ�����ݒ肵�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@tmotid
�@�@���򌳃��[�V���������ʂ���h�c

3. [IN] ���l�܂��́A�ϐ��@�F�@bmotid
�@�@����惂�[�V���������ʂ���h�c

4. [IN] ���l�܂��́A�ϐ��@�F�@frame2
�@�@����̕����t���[���ԍ�



�o�[�W���� : 

%index
E3DSetDispSwitch2
�f�B�X�v���C�X�C�b�`�̃A�j���[�V�����̐ݒ�����܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@boneno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@motid
p4 : [IN] ���l�܂��́A�ϐ��@�F�@switchid
p5 : [IN] ���l�܂��́A�ϐ��@�F�@frameno
p6 : [IN] ���l�܂��́A�ϐ��@�F�@switchflag

%inst
�f�B�X�v���C�X�C�b�`�̃A�j���[�V�����̐ݒ�����܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@boneno
�@�@�{�[�������ʂ���p�[�c�̔ԍ�

3. [IN] ���l�܂��́A�ϐ��@�F�@motid
�@�@���[�V���������ʂ���h�c

4. [IN] ���l�܂��́A�ϐ��@�F�@switchid
�@�@�X�C�b�`�̔ԍ��B�O����X�X

5. [IN] ���l�܂��́A�ϐ��@�F�@frameno
�@�@���[�V�����̃t���[���ԍ�

6. [IN] ���l�܂��́A�ϐ��@�F�@switchflag
�@�@�X�C�b�`�̏�ԁB
�@�@�O���I�t�B�P���I���B




�o�[�W���� : ver5.0.0.1�Œǉ�

%index
E3DQtoEuler
�N�H�[�^�j�I���̎p�����I�C���[�p�ɕϊ����܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@qid
p2 : [OUT] ���l�܂��́A�ϐ��@�F�@newx
p3 : [OUT] ���l�܂��́A�ϐ��@�F�@newy
p4 : [OUT] ���l�܂��́A�ϐ��@�F�@newz
p5 : [IN] ���l�܂��́A�ϐ��@�F�@oldx
p6 : [IN] ���l�܂��́A�ϐ��@�F�@oldy
p7 : [IN] ���l�܂��́A�ϐ��@�F�@oldz

%inst
�N�H�[�^�j�I���̎p�����I�C���[�p�ɕϊ����܂��B
��]�̏��Ԃ�Z���AX���AY���ł��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@qid
�@�@�N�H�[�^�j�I�������ʂ���h�c

2. [OUT] ���l�܂��́A�ϐ��@�F�@newx
3. [OUT] ���l�܂��́A�ϐ��@�F�@newy
4. [OUT] ���l�܂��́A�ϐ��@�F�@newz
�@�@�I�C���[�p���������܂��B
�@�@�����^�̕ϐ��B

5. [IN] ���l�܂��́A�ϐ��@�F�@oldx
6. [IN] ���l�܂��́A�ϐ��@�F�@oldy
7. [IN] ���l�܂��́A�ϐ��@�F�@oldz
�@�@�O��E3DQtoEuler�������ʂ��w�肵�܂��B
�@�@�v�Z����old�Ɉ�ԋ߂��p�x��new�ɑ�����܂��B
�@�@���񎞂ɂ͂O���w�肵�Ă��������B




�o�[�W���� : ver5.0.0.1�Œǉ�

%index
E3DEnablePhongEdge
�FP���ɗ֊s����\�����邩���w�肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�FP���ɗ֊s����\�����邩���w�肵�܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@�֊s����\������Ƃ��P�A���Ȃ��Ƃ��O




�o�[�W���� : ver5.0.0.1�Œǉ�

%index
E3DSetPhongEdge0Params
�FP���̗֊s���̐F�ƕ��Ɣ��������[�h��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@r
p3 : [IN] ���l�܂��́A�ϐ��@�F�@g
p4 : [IN] ���l�܂��́A�ϐ��@�F�@b
p5 : [IN] ���l�܂��́A�ϐ��@�F�@width
p6 : [IN] ���l�܂��́A�ϐ��@�F�@blendmode
p7 : [IN] ���l�܂��́A�ϐ��@�F�@alpha

%inst
�FP���̗֊s���̐F�ƕ��Ɣ��������[�h��ݒ肵�܂��B

�������̗֊s����E3DRender��withalpha�����ɂP���w�肵���Ƃ��ɕ\������܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@r
3. [IN] ���l�܂��́A�ϐ��@�F�@g
4. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�֊s���̐F��RGB�Ŏw�肵�܂��B
�@�@���ꂼ��O����Q�T�T�܂ł̒l�B

5. [IN] ���l�܂��́A�ϐ��@�F�@width
�@�@�֊s���̕��������Ŏw�肵�܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@blendmode
�@�@�֊s���̔��������[�h���w�肵�܂��B
�@�@�O���w�肷��ƒ��_�A���t�@�ɂ�锼����
�@�@�P���w�肷��ƃA�b�h���[�h
�@�@�Q���w�肷��ƒ��_�A���t�@���l�������A�b�h���[�h
�@�@�R���w�肷��ƕs����
�@�@�ɂȂ�܂��B
�@�@�f�t�H���g�l�͂R�ł��B

7. [IN] ���l�܂��́A�ϐ��@�F�@alpha
�@�@�֊s���̒��_�A���t�@���w�肵�܂��B
�@�@blendmode�łO�܂��͂Q���w�肵���Ƃ���
�@�@�Ӗ��������܂��B
�@�@0.0����1.0�̊Ԃ̎������w�肵�Ă��������B




�o�[�W���� : ver5.0.0.1�Œǉ�<BR>
      ver5.0.0.3�Ŋg��

%index
E3DGetDispSwitch2
�f�B�X�v���C�X�C�b�`���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [OUT] �z��ϐ��@�F�@dispswitch
p3 : [IN] ���l�܂��́A�ϐ��@�F�@leng

%inst
�f�B�X�v���C�X�C�b�`���擾���܂��B
E3DSetNewPose, E3DSetNewPoseML�̌��ʂ𗘗p���܂��B

dispswitch�ϐ���
dim dispswitch, DISPSWITCHNUM
�Ŋm�ۂ��Ă��炱�̖��߂ɓn���Ă��������B

DISPSWITCHNUM��e3dhsp3.as�Œ�`����Ă��܂��B
�i�X�C�b�`�̑����ł��j

�X�C�b�`���I�t�̂Ƃ��O���I���̂Ƃ��͂O�ȊO���������܂��B

�Ⴆ�΃X�C�b�`�R���I���̂Ƃ���
dispswitch( 3 ) �ɂO�ȊO���������܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [OUT] �z��ϐ��@�F�@dispswitch
�@�@�X�C�b�`�̏�Ԃ��������܂��B
�@�@�ڂ����͑O�L���������������B

3. [IN] ���l�܂��́A�ϐ��@�F�@leng
�@�@dispswitch�z����쐬�����Ƃ���
�@�@�v�f�����w�肵�܂��B




�o�[�W���� : ver5.0.0.6�Œǉ�

%index
E3DFreeThread
�X���b�h�̃��\�[�X��������܂��B
%group
Easy3D For HSP3 : �X���b�h�Ǘ�

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@threadid

%inst
�X���b�h�̃��\�[�X��������܂��B
���̖��߂����s���I������X���b�h�ɑ΂��ČĂԂ��Ƃ�
4098��̌Ăяo���񐔐������ɘa���邱�Ƃ��o���܂��B
���������̖��߂��g�p���Ă���x�ɃA�N�e�B�u�ɂł���
�X���b�h���߂�4098�̂܂܂ł��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@threadid
�@�@�X���b�h�����ʂ���h�c



�o�[�W���� : ver5.0.0.7�Œǉ�

%index
E3DLoadSigFileAsGroundThread
�X���b�h���쐬���āAE3DLoadSigFileAsGround�����s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@fname
p2 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p3 : [IN] �ϐ��܂��́A���l�@�F�@mult
p4 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadSigFileAsGround�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B


E3DLoadSigFileAsGround�̐������A���ǂ݂��������B



������
1. [IN] ������܂��́A������̕ϐ��@�F�@fname
�@�@*.sig �̃p�X������B

2. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


3. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@���{�͂P�D�O�B
�@�@�����B

4. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���ID�B



�o�[�W���� : ver5.0.0.7�Œǉ�<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DLoadSigFileAsGroundFromBufThread
�X���b�h���쐬���āAE3DLoadSigFileAsGroundFromBuf�����s���܂��B
%group
Easy3D For HSP3 : �n��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ������܂��́A������̕ϐ��@�F�@resdir
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p4 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p5 : [IN] �ϐ��܂��́A���l�@�F�@mult
p6 : [OUT] �ϐ��@�F�@threadid

%inst
�X���b�h���쐬���āAE3DLoadSigFileAsGroundFromBuf�����s���܂��B

�쐬�����X���b�h�����ʂ��邽�߂̂h�c��
threadid�ɑ������܂��B

�X���b�h�̍쐬�Ɏ��s�����ꍇ�ɂ́A
threadid�Ƀ}�C�i�X�̒l���A�������܂��B

threadid�́A
E3DChkThreadWorking�Ɏg�p���邱�Ƃ�
�o���܂��B

�X���b�h�쐬�֐��́A�S���ŁA4098��܂ŁA
�ĂԂ��Ƃ��o���܂��B
�iE3DChkThreadWorking�������j
E3DFreeThread�̐������������������B


�X���b�h���I������ƁA
E3DChkThreadWorking�Ŏ擾�����
returnval1�ɁA
���f���f�[�^�����ʂ���hsid���������܂��B


E3DLoadSigFileAsGroundFromBuf�̐������A���ǂ݂��������B



������
1. [IN] ������܂��́A������̕ϐ��@�F�@resdir
�@�@�e�N�X�`���[�̂���t�H���_ �̃p�X������B
�@�@�Ō�ɁA&quot;\\&quot;���K�v�B

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�

3. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���

4. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@�t�u�l�𐳋K�����邩�ǂ����̃t���O�B
�@�@���K������ꍇ�͂P���w��B
�@�@���Ȃ��ꍇ�͂O���w��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


5. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�ǂݍ��ݔ{�����w�肵�Ă��������B
�@�@���{�͂P�D�O�B
�@�@�����B

6. [OUT] �ϐ��@�F�@threadid
�@�@�쐬�����X���b�h�����ʂ���ID�B



�o�[�W���� : ver5.0.0.7�Œǉ�<BR>
      ver5.0.5.4�Ŋg��<BR>
      <BR>


%index
E3DSetLightIdOfBumpMap
�o���v�}�b�v���Ƃ炷�������P�����I�����܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lid

%inst
�o���v�}�b�v���Ƃ炷�������P�����I�����܂��B

���s�����ł��_�����ł�OK�ł��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@lid
�@�@���C�g�����ʂ���h�c



�o�[�W���� : ver5.0.0.8�Œǉ�

%index
E3DSetSpriteUV
�X�v���C�g��UV��ݒ肵�܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@spid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@startu
p3 : [IN] ���l�܂��́A�ϐ��@�F�@endu
p4 : [IN] ���l�܂��́A�ϐ��@�F�@startv
p5 : [IN] ���l�܂��́A�ϐ��@�F�@endv

%inst
�X�v���C�g��UV��ݒ肵�܂��B

��̓I�Ȏg�p���
e3dhsp3_SpriteUV.hsp���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@spid
�@�@�X�v���C�g�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@startu
�@�@U�����̕\���J�n�_���O����P�Ŏw�肵�܂��B
�@�@�����B

3. [IN] ���l�܂��́A�ϐ��@�F�@endu
�@�@U�����̕\���I���_���O����P�Ŏw�肵�܂��B
�@�@�����B

4. [IN] ���l�܂��́A�ϐ��@�F�@startv
�@�@V�����̕\���J�n�_���O����P�Ŏw�肵�܂��B
�@�@�����B

5. [IN] ���l�܂��́A�ϐ��@�F�@endv
�@�@V�����̕\���I���_���O����P�Ŏw�肵�܂��B
�@�@�����B




�o�[�W���� : ver5.0.0.8�Œǉ�

%index
E3DCreateRenderTargetTexture
�����_�����O�\�ȃe�N�X�`�����쐬���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@sizex
p2 : [IN] ���l�܂��́A�ϐ��@�F�@sizey
p3 : [OUT] �ϐ��@�F�@scid
p4 : [OUT] �ϐ��@�F�@texid
p5 : [OUT] �ϐ��@�F�@okflag
p6 : [IN] ���l�܂��́A�ϐ��@�F�@fmt

%inst
�����_�����O�\�ȃe�N�X�`�����쐬���܂��B

���̖��߂���������ƃX���b�v�`�F�C��ID�ƃe�N�X�`��ID���擾�ł��܂��B

�e�N�X�`���̃T�C�Y�͂Q�̏搔�ɂ��Ă��������B

�����r�f�I�������ʂ�
sizex * sizey * ( 4 + 2 ) �o�C�g�ł��B


�������s���Ȃǂł��̖��߂����s�����ꍇ�ɂ�
�G���[�ɂȂ炸��okflag�ɂO���������܂��B
���s�����ꍇ�̓e�N�X�`���T�C�Y������������Ȃǂ���
�Ď��s���Ă݂Ă��������B

��̓I�Ȏg�p���
e3dhsp3_RenderTargetTexture.hsp���������������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@sizex
2. [IN] ���l�܂��́A�ϐ��@�F�@sizey
�@�@�쐬����e�N�X�`���̃T�C�Y
�@�@�Q�̏搔�𐄏��B

3. [OUT] �ϐ��@�F�@scid
�@�@�X���b�v�`�F�C��ID���������܂��B

4. [OUT] �ϐ��@�F�@texid
�@�@�e�N�X�`��ID���������܂��B

5. [OUT] �ϐ��@�F�@okflag
�@�@���������ꍇ�͂P��
�@�@���s�����ꍇ�͂O���������܂��B

6. [IN] ���l�܂��́A�ϐ��@�F�@fmt
�@�@�쐬�������e�N�X�`���̃t�H�[�}�b�g���w�肵�܂��B
�@�@e3dhsp3.as�Œ�`����Ă���D3DFMT_�Ŏn�܂�
�@�@�萔���g�p���Ă��������B
�@�@���̈������ȗ������ꍇ��
�@�@D3DFMT_A8R8G8B8�ō쐬����܂��B




�o�[�W���� : ver5.0.0.9�Œǉ�<BR>
      ver5.0.1.6�ň����ǉ�<BR>
      

%index
E3DDestroyRenderTargetTexture
�����_�[�^�[�Q�b�g�e�N�X�`����j�����܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@texid      �@�@E3DCreateRednerTargetTexture��

%inst
�����_�[�^�[�Q�b�g�e�N�X�`����j�����܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@scid
�@�@E3DCreateRednerTargetTexture��
�@�@�擾�����X���b�v�`�F�C��ID���w�肵�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@texid      �@�@E3DCreateRednerTargetTexture��
�@�@�擾�����e�N�X�`��ID���w�肵�܂��B



�o�[�W���� : ver5.0.0.9�Œǉ�

%index
E3DSetDSFillUpMode
��Ԏ��ɕ�ԑO�̃��[�V�����̃X�C�b�`��Ԃ�\�����邩�A�������͕�Ԍ�̃��[�V�����̃X�C�b�`��Ԃ�\�����邩��I�т܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mode

%inst
��Ԏ��ɕ�ԑO�̃��[�V�����̃X�C�b�`��Ԃ�\�����邩�A�������͕�Ԍ�̃��[�V�����̃X�C�b�`��Ԃ�\�����邩��I�т܂��B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@mode
�@�@�O���w�肷��ƕ�ԑO�̃��[�V������
�@�@�X�C�b�`��Ԃ�\�����܂��B
�@�@�P���w�肷��ƕ�Ԍ�̃��[�V������
�@�@�X�C�b�`��Ԃ�\�����܂��B





�o�[�W���� : ver5.0.1.2�Œǉ�

%index
E3DSetTexFillUpMode
��Ԏ��ɕ�ԑO�̃��[�V�����̃e�N�X�`���A�j���̏�Ԃ�\�����邩�A�������͕�Ԍ�̃��[�V�����̃e�N�X�`���A�j���̏�Ԃ�\�����邩��I�т܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@mode

%inst
��Ԏ��ɕ�ԑO�̃��[�V�����̃e�N�X�`���A�j���̏�Ԃ�\�����邩�A�������͕�Ԍ�̃��[�V�����̃e�N�X�`���A�j���̏�Ԃ�\�����邩��I�т܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@mode
�@�@�O���w�肷��ƕ�ԑO�̃��[�V������
�@�@�e�N�X�`����\�����܂��B
�@�@�P���w�肷��ƕ�Ԍ�̃��[�V������
�@�@�e�N�X�`����\�����܂��B



�o�[�W���� : 

%index
E3DSetShadowBias
�e�������_�����O����ۂ�Z�o�b�t�@�̃o�C�A�X��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@bias

%inst
�e�������_�����O����ۂ�Z�o�b�t�@�̃o�C�A�X��ݒ肵�܂��B
��ʂɑ傫���l��ݒ肷��΃}�b�n�o���h�i�Ȗ͗l�j�������܂��B

��̓I�Ȏg�p���e3dhsp3_shadow2.hsp���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@bias
�@�@Z�o�b�t�@�̌덷���ɘa���邽�߂̃o�C�A�X���w�肵�܂��B
�@�@�f�t�H���g�l��0.005�ł��B


�o�[�W���� : ver5.0.1.6�Œǉ�

%index
E3DRenderWithShadow
�e�t���̃V�[�����ꊇ�����_�����O���܂��B
%group
Easy3D For HSP3 : �`��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@rtscid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@rttexid
p4 : [IN] �z��ϐ��@�F�@hsidarray
p5 : [IN] ���l�܂��́A�ϐ��@�F�@num
p6 : [IN] ���l�܂��́A�ϐ��@�F�@skipflag

%inst
�e�t���̃V�[�����ꊇ�����_�����O���܂��B
������E3DChkInView�AE3DBeginScene�AE3DEndScene��
�Ă΂�܂��B
�S�Ă̕s������`���A���������`�悳��܂��B

hsidarray�i�z��j�Ƀ����_�����O������hsid���i�[���Ă���Ăяo���܂��B

��̓I�Ȏg�p���e3dhsp3_shadow2.hsp���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@scid
�@�@�e�t���̃V�[���������_�����O���邽�߂�
�@�@�X���b�v�`�F�C��ID���w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@rtscid
3. [IN] ���l�܂��́A�ϐ��@�F�@rttexid
�@�@�V���h�E�}�b�v�p��E3DCreateRenderTargetTexture
�@�@�Ŏ擾����scid��texid���w�肵�Ă��������B

4. [IN] �z��ϐ��@�F�@hsidarray
�@�@�`�悵����hsid��z��Ɋi�[���Ă��������B
�@�@�r���{�[�h��`�悵�����Ƃ���hsid��-1��
�@�@�i�[���Ă��������B


5. [IN] ���l�܂��́A�ϐ��@�F�@num
�@�@hsidarray�ɉ���hsid���i�[���������w�肵�Ă��������B

6. [IN] ���l�܂��́A�ϐ��@�F�@skipflag
�@�@skipflag�ɂP���w�肷���
�@�@��ʂ̃o�b�t�@�̃N���A�Ɣw�i�̕`���
�@�@�X�L�b�v���܂��B

�@�@�f�t�H���g�l�͂O�D
�@�@BeginScene��EndScene�̓X�L�b�v���܂���B

�@�@E3DBeginScene scid1
�@�@�@�@�O�ɕ`�悵�������̂������_�[
�@�@E3DEndScene
�@�@E3DRenderWithShadow (skipflag = 1)
�@�@E3DBeginScene scid1, 1
�@�@�@�@��ɕ`�悵�������̂������_�[
�@�@E3DEndScene
�@�@�̂悤�ɕ`�悵�Ă��������B





�o�[�W���� : ver5.0.1.6�Œǉ�<BR>
      ver5.0.1.7�ň����ǉ�<BR>
      

%index
E3DChkShadowEnable
�n�[�h�E�F�A�ŉe�̕`�悪�o���邩�ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [OUT] �ϐ��@�F�@flag

%inst
�n�[�h�E�F�A�ŉe�̕`�悪�o���邩�ǂ����𒲂ׂ܂��B


������
1. [OUT] �ϐ��@�F�@flag
�@�@�e�̕`�悪�o���鎞�͂O�ȊO��
�@�@�o���Ȃ��Ƃ��͂O���������܂��B


�o�[�W���� : ver5.0.1.6�Œǉ�

%index
E3DEnableShadow
�e�̕`����I���܂��̓I�t�ɂ��܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�e�̕`����I���܂��̓I�t�ɂ��܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@�P���Z�b�g����Ɖe�̕`�悪�\�Ȏ��͕`�悷��悤�ɂ��܂��B
�@�@�O���Z�b�g����Ɖe�̕`��͍s��Ȃ��悤�ɂ��܂��B



�o�[�W���� : ver5.0.1.6�Œǉ�

%index
E3DCheckRTFormat
E3DCreateRenderTargetTexture�ō쐬�ł���t�H�[�}�b�g�𒲂ׂ܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@fmt
p2 : [OUT] �ϐ��@�F�@okflag

%inst
E3DCreateRenderTargetTexture�ō쐬�ł���t�H�[�}�b�g�𒲂ׂ܂��B
��̓I�Ȏg�p���e3dhsp3_shadow.hsp���������������B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@fmt
�@�@���ׂ����t�H�[�}�b�g���w�肵�܂��B
�@�@e3dhsp3.as�Œ�`����Ă���D3DFMT_�Ŏn�܂�
�@�@�萔���g�p���Ă��������B

2. [OUT] �ϐ��@�F�@okflag
�@�@�w�肵���t�H�[�}�b�g���g�p�\�Ȏ��͂O�ȊO��
�@�@�g�p�s�Ȏ��͂O���������܂��B




�o�[�W���� : ver5.0.1.6�Œǉ�

%index
E3DSetShadowDarkness
�e�̈Â���ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@darkness

%inst
�e�̈Â���ݒ肵�܂��B

darkness�Ɏw�肵���W����Ambient���|�������̂�
�e�̐F�ƂȂ�܂��B

�f�t�H���g�l�͂P�D�O�ł��B
�O�ɋ߂Â��قǈÂ��Ȃ�܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@darkness
�@�@�O�ȏ�̎����B
�@�@�A���r�G���g�Ɋ|���Z���ĉe�̐F�Ƃ���B



�o�[�W���� : ver5.0.1.7�Œǉ�

%index
E3DRenderBatch
E3DRender�̃o�b�`�ŁB
%group
Easy3D For HSP3 : �`��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@scid
p2 : [IN] �z��ϐ��@�F�@hsidarray
p3 : [IN] ���l�܂��́A�ϐ��@�F�@num
p4 : [IN] ���l�܂��́A�ϐ��@�F�@needchkinview
p5 : [IN] ���l�܂��́A�ϐ��@�F�@skipflag

%inst
E3DRender�̃o�b�`�ŁBhsid���܂Ƃ߂ĕ`�悷�邱�Ƃɂ�荂�����B

������E3DChkInView�AE3DBeginScene�AE3DEndScene��
�Ă΂�܂��B

�S�Ă̕s������`���A���������`�悳��܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@scid
�@�@�X���b�v�`�F�C��ID���w�肵�Ă��������B

2. [IN] �z��ϐ��@�F�@hsidarray
�@�@�`�悵����hsid���i�[�����z��B

3. [IN] ���l�܂��́A�ϐ��@�F�@num
�@�@hsidarray�ɉ���hsid���Z�b�g�������B

4. [IN] ���l�܂��́A�ϐ��@�F�@needchkinview
�@�@������ChkInView���ĂԂ��ǂ����̃t���O�B

5. [IN] ���l�܂��́A�ϐ��@�F�@skipflag
�@�@�O�ȊO���Z�b�g�����
�@�@��ʃo�b�t�@�̃N���A�Ɣw�i�̕`����X�L�b�v���܂��B
�@�@
�@�@BeginScene��EndScene�̓X�L�b�v���܂���B
�@�@�f�t�H���g�l�͂O�B



�o�[�W���� : ver5.0.1.7�Œǉ�

%index
E3DSetVertPosBatch
E3DSetVertPos�̃o�b�`�ŁB
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] �z��ϐ��@�F�@vertnoarray
p4 : [IN] ���l�܂��́A�ϐ��@�F�@vnum
p5 : [IN] �z��ϐ��@�F�@vertarray

%inst
E3DSetVertPos�̃o�b�`�ŁB�܂Ƃ߂č������B

�����蔻��f�[�^�̍X�V�͂���܂���B


vertarray�ɂ́A
html{
<strong>ddim vertarray, vnum, 3</strong>
}html
�Ŋm�ۂ����f�[�^��n���Ă��������B

dim�ł͂Ȃ��āAddim�Ŋm�ۂ��Ă��������B

vnum�ɂ́A�_�̐������Ă��������B

vertarray(�_�̔ԍ�,0) �ɂw���W�A
vertarray(�_�̔ԍ�,�P) �ɂx���W�A 
vertarray(�_�̔ԍ�,�Q) �ɂy���W
�����āA���������Ă����Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ID�B

3. [IN] �z��ϐ��@�F�@vertnoarray
�@�@�ʒu��ݒ肵�������_�̔ԍ���z��ɃZ�b�g���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@vnum
�@�@���̒��_�̈ʒu��ݒ肷�邩���Z�b�g���Ă��������B

5. [IN] �z��ϐ��@�F�@vertarray
�@�@���_�̍��W�������^�̔z��ɃZ�b�g���Ă��������B
�@�@�ڂ����͑O�L���������������B







�o�[�W���� : ver5.0.1.7�Œǉ�

%index
E3DSetShadowMapLightDir
�e�p�̕��s�����̌�����ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@dirx
p2 : [IN] ���l�܂��́A�ϐ��@�F�@diry
p3 : [IN] ���l�܂��́A�ϐ��@�F�@dirz

%inst
�e�p�̕��s�����̌�����ݒ肵�܂��B


������
1. [IN] ���l�܂��́A�ϐ��@�F�@dirx
2. [IN] ���l�܂��́A�ϐ��@�F�@diry
3. [IN] ���l�܂��́A�ϐ��@�F�@dirz
�@�@���s�����̌������x�N�g���idirx, diry, dirz�j��
�@�@�w�肵�܂��B
�@�@�����ł��B




�o�[�W���� : ver5.0.2.0�Œǉ�

%index
E3DRenderBatchMode
E3DRenderBatch�̊g���ŁB
%group
Easy3D For HSP3 : �`��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@scid
p2 : [IN] �z��ϐ��@�F�@hsidarray
p3 : [IN] ���l�܂��́A�ϐ��@�F�@num
p4 : [IN] ���l�܂��́A�ϐ��@�F�@needchkinview
p5 : [IN] ���l�܂��́A�ϐ��@�F�@skipflag
p6 : [IN] �z��ϐ��@�F�@modearray

%inst
E3DRenderBatch�̊g���ŁB
hsid���Ƃɕs�����݂̂�`�悷�邩
�������݂̂�`�悷�邩
�s�����Ɣ������̗�����`�悷�邩���w��ł��܂��B

�K�؂ɐݒ肷�邱�Ƃŕ`�摬�x�������Ȃ�܂��B


hsidarray�ɂ̓p�[�e�B�N����ID���w�肷�邱�Ƃ��ł��܂��B
�p�[�e�B�N����mode 2�̂ݗL���ł��B
�p�[�e�B�N����hsidarray�Ɋ܂߂�ꍇ�͂��̖��߂��ĂԑO��
onlyupdate�������P�ɂ���E3DRenderParticle���Ă�ł����K�v������܂��B






������
1. [IN] ���l�܂��́A�ϐ��@�F�@scid
�@�@�X���b�v�`�F�C��ID���w�肵�Ă��������B

2. [IN] �z��ϐ��@�F�@hsidarray
�@�@�`�悵����hsid���i�[�����z��B

3. [IN] ���l�܂��́A�ϐ��@�F�@num
�@�@hsidarray�ɉ���hsid���Z�b�g�������B

4. [IN] ���l�܂��́A�ϐ��@�F�@needchkinview
�@�@������ChkInView���ĂԂ��ǂ����̃t���O�B

5. [IN] ���l�܂��́A�ϐ��@�F�@skipflag
�@�@�O�ȊO���Z�b�g�����
�@�@��ʃo�b�t�@�̃N���A�Ɣw�i�̕`����X�L�b�v���܂��B
�@�@
�@�@BeginScene��EndScene�̓X�L�b�v���܂���B
�@�@�f�t�H���g�l�͂O�B

6. [IN] �z��ϐ��@�F�@modearray
�@�@�`�惂�[�h���i�[�����z��B
�@�@hsidarray�Ɠ��������̔z��B
�@�@�z��̗v�f�ɂP���w�肷��ƕs�����̂�
�@�@�Q���w�肷��Ɣ������̂�
�@�@�R���w�肷��Ɨ�����`�悵�܂��B




�o�[�W���� : ver5.0.2.1�Œǉ�

%index
E3DGlobalToLocal
�O���[�o�����W�n����L�����N�^�[�̃��[�J�����W�n�ւ̕ϊ��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@srcx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@srcy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@srcz
p5 : [OUT] �ϐ��@�F�@dstx
p6 : [OUT] �ϐ��@�F�@dsty
p7 : [OUT] �ϐ��@�F�@dstz

%inst
�O���[�o�����W�n����L�����N�^�[�̃��[�J�����W�n�ւ̕ϊ��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@srcx
3. [IN] ���l�܂��́A�ϐ��@�F�@srcy
4. [IN] ���l�܂��́A�ϐ��@�F�@srcz
�@�@�ϊ��O�̍��W���w�肵�܂��B
�@�@�����B

5. [OUT] �ϐ��@�F�@dstx
6. [OUT] �ϐ��@�F�@dsty
7. [OUT] �ϐ��@�F�@dstz
�@�@�ϊ���̍��W���������܂��B
�@�@�����^�̕ϐ��B




�o�[�W���� : ver5.0.2.1�Œǉ�

%index
E3DLocalToGlobal
�L�����N�^�[�̃��[�J�����W�n����O���[�o�����W�n�ւ̕ϊ��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@srcx
p3 : [IN] ���l�܂��́A�ϐ��@�F�@srcy
p4 : [IN] ���l�܂��́A�ϐ��@�F�@srcz
p5 : [OUT] �ϐ��@�F�@dstx
p6 : [OUT] �ϐ��@�F�@dsty
p7 : [OUT] �ϐ��@�F�@dstz

%inst
�L�����N�^�[�̃��[�J�����W�n����O���[�o�����W�n�ւ̕ϊ��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] ���l�܂��́A�ϐ��@�F�@srcx
3. [IN] ���l�܂��́A�ϐ��@�F�@srcy
4. [IN] ���l�܂��́A�ϐ��@�F�@srcz
�@�@�ϊ��O�̍��W���w�肵�܂��B
�@�@�����B

5. [OUT] �ϐ��@�F�@dstx
6. [OUT] �ϐ��@�F�@dsty
7. [OUT] �ϐ��@�F�@dstz
�@�@�ϊ���̍��W���������܂��B
�@�@�����^�̕ϐ��B



�o�[�W���� : ver5.0.2.1�Œǉ�

%index
E3DSetShadowMapMode
�V���h�E�}�b�v�̃��[�h��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@mode

%inst
�V���h�E�}�b�v�̃��[�h��ݒ肵�܂��B

���[�h�O���w�肷���LiSPSM�̕��@��
E3DSetShadowMapLightDir���Ăяo�������Ŏ����I��
�K�؂ȃV���h�E�}�b�v���쐬���܂��B

���[�h�P���w�肷���E3DSetShadowMapCamera��
E3DSetShadowMapProjOrtho���g�p����
�}�j���A���ݒ�̃��[�h�ɂȂ�܂��B

���̖��߂��Ăяo���Ȃ������ꍇ��
���[�h�O���K�p����܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@mode
�@�@���[�h�i�O�܂��͂P�j���w�肵�܂��B
�@�@�ڂ����͑O�L���������������B



�o�[�W���� : ver5.0.2.2�Œǉ�

%index
E3DSetShadowMapCamera
�V���h�E�}�b�v���쐬����ۂ̃J�����̈ʒu��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] �����^�z��ϐ��@�F�@pos
p2 : [IN] �����^�z��ϐ��@�F�@target
p3 : [IN] �����^�z��ϐ��@�F�@upvec

%inst
�V���h�E�}�b�v���쐬����ۂ̃J�����̈ʒu��ݒ肵�܂��B
�e�𗎂Ƃ��ۂ̃��C�g�̈ʒu�Ɠ����Ӗ��ł��B



������
1. [IN] �����^�z��ϐ��@�F�@pos
�@�@�J�����̈ʒu�������^�̔z��Ŏw�肵�܂��B
�@�@ddim pos, 3�ō쐬��
�@�@pos(0)��X���W�Apos(1)��Y���W�Apos(2)��Z���W��
�@�@�w�肵�܂��B

2. [IN] �����^�z��ϐ��@�F�@target
�@�@�J�����̒����_�������^�̔z��Ŏw�肵�܂��B
�@�@ddim target, 3�ō쐬��
�@�@pos(0)��X���W�Apos(1)��Y���W�Apos(2)��Z���W��
�@�@�w�肵�܂��B

3. [IN] �����^�z��ϐ��@�F�@upvec
�@�@�J�����̏�����x�N�g����
�@�@�����^�̔z��Ŏw�肵�܂��B
�@�@ddim upvec, 3�ō쐬��
�@�@pos(0)��X���W�Apos(1)��Y���W�Apos(2)��Z���W��
�@�@�w�肵�܂��B
�@�@�ʏ��( 0.0, 1.0, 0.0 )���w�肵�܂��B


�o�[�W���� : ver5.0.2.2�Œǉ�

%index
E3DSetShadowMapProjOrtho
�V���h�E�}�b�v���쐬����ۂ̃v���W�F�N�V������ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@rttexid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@near
p3 : [IN] ���l�܂��́A�ϐ��@�F�@far
p4 : [IN] ���l�܂��́A�ϐ��@�F�@viewsize

%inst
�V���h�E�}�b�v���쐬����ۂ̃v���W�F�N�V������ݒ肵�܂��B
�ǂ̂��炢�͈̔͂̃V�[�����V���h�E�}�b�v�ɂ��邩�����肳��܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@rttexid
�@�@E3DCreateRenderTargetTexture�ō쐬�����V���h�E�}�b�v�p�̃e�N�X�`��ID��n���܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@near
�@�@������̃J���������ԋ߂��������w�肵�܂��B
�@�@���܂菬������Z�o�b�t�@�̐��x�������Ȃ�܂��B
�@�@�����B

3. [IN] ���l�܂��́A�ϐ��@�F�@far
�@�@������̃J���������ԉ����������w�肵�܂��B
�@�@���܂�傫����Z�o�b�t�@�̐��x�������Ȃ�܂��B
�@�@�����B

4. [IN] ���l�܂��́A�ϐ��@�F�@viewsize
�@�@���ˉe�̃r���[�̃{�����[���T�C�Y���w�肵�܂��B
�@�@�����B


�o�[�W���� : ver5.0.2.2�Œǉ�

%index
E3DSetVertPosBatchAOrder
E3DSetVertPos�̃o�b�`�ŁB
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] �z��ϐ��@�F�@vertnoarray
p4 : [IN] ���l�܂��́A�ϐ��@�F�@vnum
p5 : [IN] �z��ϐ��@�F�@vertarray

%inst
E3DSetVertPos�̃o�b�`�ŁB�܂Ƃ߂č������B

�����蔻��f�[�^�̍X�V�͂���܂���B

E3DSetVertPosBatch�Ƃ�vertarray�̂Q�����z��̏��Ԃ�
�قȂ�܂��B

vertarray�ɂ́A
html{
<strong>ddim vertarray, 3, vnum</strong>
}html
�Ŋm�ۂ����f�[�^��n���Ă��������B

dim�ł͂Ȃ��āAddim�Ŋm�ۂ��Ă��������B

vnum�ɂ́A�_�̐������Ă��������B

vertarray(0, �_�̔ԍ�) �ɂw���W�A
vertarray(1, �_�̔ԍ�) �ɂx���W�A 
vertarray(2, �_�̔ԍ�) �ɂy���W
�����āA���������Ă����Ă��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ID�B

3. [IN] �z��ϐ��@�F�@vertnoarray
�@�@�ʒu��ݒ肵�������_�̔ԍ���z��ɃZ�b�g���Ă��������B

4. [IN] ���l�܂��́A�ϐ��@�F�@vnum
�@�@���̒��_�̈ʒu��ݒ肷�邩���Z�b�g���Ă��������B

5. [IN] �z��ϐ��@�F�@vertarray
�@�@���_�̍��W�������^�̔z��ɃZ�b�g���Ă��������B
�@�@�ڂ����͑O�L���������������B



�o�[�W���� : ver5.0.2.2�Œǉ�

%index
E3DLoadTextureFromBuf
�쐬�ς݂̃e�N�X�`���Ƀo�b�t�@����摜�t�@�C����ǂݍ��݂܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@texid
p2 : [IN] �ϐ��@�F�@buf
p3 : [IN] �ϐ��܂��́A���l�@�F�@bufleng
p4 : [IN] �ϐ��܂��́A���l�@�F�@transparent

%inst
�쐬�ς݂̃e�N�X�`���Ƀo�b�t�@����摜�t�@�C����ǂݍ��݂܂��B

�e�N�X�`���̓��e��p�ɂɍX�V�������Ƃ���
���̖��߂��g���΃e�N�X�`���̍쐬�Ɣj�����J��Ԃ��Ȃ��Ă�
���݂܂��B

���[�v�̊O�łP��E3DCreateTexture�ȂǂŃe�N�X�`��������Ă���
���[�v���ł���E3DLoadTextureFromBuf���Ăяo�����Ƃ�z�肵�Ă��܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@texid
�@�@�쐬�ς݂̃e�N�X�`�������ʂ���ID

2. [IN] �ϐ��@�F�@buf
�@�@�o�b�t�@�̕ϐ�
�@�@�t�@�C���̃C���[�W���o�b�t�@�ɓ����Ă����
�@�@�z�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@bufleng
�@�@�o�b�t�@�̒��̃f�[�^�̒���(�o�C�g)

4. [IN] �ϐ��܂��́A���l�@�F�@transparent
�@�@���ߏ����w�肵�܂��B

�@�@texid���擾����Ƃ��̃e�N�X�`���쐬���߂�
�@�@�w�肵���̂Ɠ���transparent���w�肵�Ă��������B




�o�[�W���� : ver5.0.2.5�Œǉ�

%index
E3DLoadSpriteFromBMSCR
�쐬�ς݂̃X�v���C�g��HSP�̉摜�o�b�t�@����摜��ǂݍ��݂܂��B
%group
Easy3D For HSP3 : �X�v���C�g

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@spriteid
p2 : [IN] �ϐ��܂��́A���l�@�F�@wid
p3 : [IN] �ϐ��܂��́A���l�@�F�@transparentflag
p4 : [IN] �ϐ��܂��́A���l�@�F�@tpR
p5 : [IN] �ϐ��܂��́A���l�@�F�@tpG
p6 : [IN] �ϐ��܂��́A���l�@�F�@tpB

%inst
�쐬�ς݂̃X�v���C�g��HSP�̉摜�o�b�t�@����摜��ǂݍ��݂܂��B

�X�v���C�g�̓��e��p�ɂɍX�V�������Ƃ���
���̖��߂��g���΃X�v���C�g�̍쐬�Ɣj�����J��Ԃ��Ȃ��Ă�
���݂܂��B

���̖��߂ɓn��spriteid��
E3DCreateSpriteFromBMSCR�ō쐬�����X�v���C�g�łȂ���΂Ȃ�܂���B
���̖��߂ō쐬�����X�v���C�gID��n���ƃG���[�ɂȂ�܂��B

���[�v�̊O�łP��E3DCreateSpriteFromBMSCR�ŃX�v���C�g������Ă���
���[�v���ł���E3DLoadSpriteFromBMSCR���Ăяo�����Ƃ�z�肵�Ă��܂��B






������
1. [IN] �ϐ��܂��́A���l�@�F�@spriteid
�@�@E3DCreateSpriteFromBMSCR�ō쐬����
�@�@�X�v���C�gID�B

2. [IN] �ϐ��܂��́A���l�@�F�@wid
�@�@�E�C���h�EID

3. [IN] �ϐ��܂��́A���l�@�F�@transparentflag
�@�@���߃t���O�B

�@�@E3DCreateSpriteFromBMSCR
�@�@�Ɏw�肵���̂Ɠ����l���w�肵�Ă��������B
�@�@�i�قȂ���̂�n���ƃG���[�ɂȂ�܂��B�j

4. [IN] �ϐ��܂��́A���l�@�F�@tpR
5. [IN] �ϐ��܂��́A���l�@�F�@tpG
6. [IN] �ϐ��܂��́A���l�@�F�@tpB
�@�@���ߐF�B





�o�[�W���� : ver5.0.2.5�Œǉ�

%index
E3DSetShadowMapInterFlag
�V���h�E�}�b�v�Ƀp�[�c���܂߂邩�ǂ����̃t���O��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@flag

%inst
�V���h�E�}�b�v�Ƀp�[�c���܂߂邩�ǂ����̃t���O��ݒ肵�܂��B

�V���h�E�}�b�v���[�h�O�p�ł��B

�t���O�ɂ�
e3dhsp3.as�Œ�`����Ă���SHADOWIN_*���w�肵�܂��B

SHADOWIN_PROJ�̂Ƃ���
�p�[�c�̈ꕔ���ł�������ɓ����Ă���ꍇ�ɂ�
�p�[�c�S�̂��V���h�E�}�b�v�Ɋ܂܂��悤�ɂ��܂��B
�L�����N�^�[�f�[�^�̃f�t�H���g�l�ł��B

SHADOWIN_ALWAYS�̂Ƃ���
������ɓ����Ă��邩�ǂ����ɂ�����炸
�K���V���h�E�}�b�v�Ƀp�[�c�S�̂��܂܂��悤�ɂ��܂��B
�V���h�E�}�b�v�ɓ���p�[�c���L���͈͂ɎU��΂�ΎU��΂�ق�
�e�̕i���͈����Ȃ�܂��B
�ł��̂ŃV���h�E�}�b�v�ɓ���邩�ǂ����𓮓I�ɔ��肵�A
�K�v���Ȃ��Ȃ�����
SHADOWIN_PROJ��SHADOWIN_NOT�ɖ߂����Ƃ𐄏����܂��B

SHADOWIN_NOT�̂Ƃ���
�V���h�E�}�b�v�ɓ���邩�ǂ�����E3D���Ő��䂵�܂���B
�n�ʂȂǂ̑傫���I�u�W�F�N�g�p�̃��[�h�ł��B
�n�ʃf�[�^�̃f�t�H���g�l�ł��B


ver5.2.2.6���SHADOWIN_EXCLUDE���ǉ�����܂����B
SHADOWIN_EXCLUDE���w�肵���ꍇ��
�V���h�E�}�b�v����w��p�[�c�����O���܂��B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ID�B
�@�@-1���w�肷��ƑS�Ẵp�[�c�ɑ΂��ď������s���܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@flag
�@�@SHADOWIN_�ł͂��܂�萔���w�肵�܂��B
�@�@�ڂ����͑O�L���������������B




�o�[�W���� : ver5.0.2.7�Œǉ�<BR>
      ver5.2.2.6�Ŋg��

%index
E3DSetMaterialAlphaTest
�}�e���A�����ƂɃA���t�@�e�X�g�̃I���I�t��ݒ�ł��܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] �ϐ��܂��́A���l�@�F�@alphatest0
p4 : [IN] �ϐ��܂��́A���l�@�F�@alphaval0
p5 : [IN] �ϐ��܂��́A���l�@�F�@alphatest1
p6 : [IN] �ϐ��܂��́A���l�@�F�@alphaval1

%inst
�}�e���A�����ƂɃA���t�@�e�X�g�̃I���I�t��ݒ�ł��܂��B

E3DSetMaterialBlendingMode�łO�A�P�A�Q�̒l���Z�b�g���Ă���ꍇ�̓A���t�@�e�X�g�������I�ɐݒ肳���悤�ɂȂ��Ă��܂��B
�����ݒ肳�������Ȃ��ꍇ��blendmode �P�O�O�A�P�O�P�A�P�O�Q���g�p���邩�A��������E3DSetMaterialBlendingMode�̌��
E3DSetMaterialAlphaTest���Ăяo���Ă��������B

�A���t�@�e�X�g���I���ɂ����ꍇ��
�A���t�@�̒l��臒l�����������ꍇ�ɕ`�悳��Ȃ��Ȃ�܂��B
�iZ�o�b�t�@�ɂ��`�悳��Ȃ��Ȃ�܂��B�j





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] �ϐ��܂��́A���l�@�F�@alphatest0
�@�@�s������`�掞�ɃA���t�@�e�X�g����ꍇ�͂P��
�@�@���Ȃ��ꍇ�͂O���w�肵�܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@alphaval0
�@�@�s�������̃A���t�@�e�X�g�̃A���t�@��臒l�B
�@�@�i�O����Q�T�T�j

5. [IN] �ϐ��܂��́A���l�@�F�@alphatest1
�@�@��������`�掞�ɃA���t�@�e�X�g����ꍇ�͂P��
�@�@���Ȃ��ꍇ�͂O���w�肵�܂��B

6. [IN] �ϐ��܂��́A���l�@�F�@alphaval1
�@�@���������̃A���t�@�e�X�g�̃A���t�@��臒l�B
�@�@�i�O����Q�T�T�j




�o�[�W���� : ver5.0.2.9�Œǉ�

%index
E3DTransformBillboard
�r���{�[�h�̎��������ƈʒu�v�Z�ƃ\�[�g���s���܂��B
%group
Easy3D For HSP3 : �`�揀��

%prm
�Ȃ�

%inst
�r���{�[�h�̎��������ƈʒu�v�Z�ƃ\�[�g���s���܂��B

�f�t�H���g��Ԃ�E3DRenderBillboard�ł�
�����̕`�揀���̌v�Z�ƕ`��̏����������؂�ɍs���Ă��܂����B
���̂��߂����蔻��͕`��̌�ɂ��Ȃ��Ă͂Ȃ炸�A
���ۂ̕`��Ɣ��肪�P�t���[�������Ƃ�����肪����܂����B

���̖����������邽�߂ɂ��̖��߂�ǉ����܂����B
���̖��߂��Ăяo�������ƃr���{�[�h�̈ʒu�ȂǂɕύX���Ȃ��ꍇ�́AE3DRenderBillboard��transskip�����ɂP��ݒ肵�܂��B
�������邱�ƂłQ�x�����`�揀���̌v�Z���s�����Ƃ�h���܂��B


E3DTransformBillboard
�����蔻��
E3DRenderBillboard (transskip = 1)

�̂悤�Ɏg���Ă��������B





������
�����Ȃ�

�o�[�W���� : ver5.0.2.9�Œǉ�

%index
E3DCalcMLMotion
�}���`���C���[���[�V�����̎p�������v�Z���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
�}���`���C���[���[�V�����̎p�������v�Z���܂��B���[�J���̎p������e�q�֌W�𔽉f�����p�����v�Z���܂��B

E3DSetNewPoseML�����E3DSetBoneQ�����ꍇ�Ȃǂ�
�Ă�ł��������B

�iE3DSetNewPoseML����������Ă΂�Ă��܂��j

�g�p��Ƃ��Ă�E3DSetMotionKindML
E3DSetNewPoseML
E3DGetMotionFrameNo
E3DSetBoneQ
E3DCalcMLMotion
�̂悤�ȏ����ŌĂяo���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id



�o�[�W���� : ver5.0.3.4�Œǉ�

%index
E3DCreateSkinMat
�e���x�̕ҏW���ʂ�\���p�f�[�^�ɔ��f�����܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno

%inst
�e���x�̕ҏW���ʂ�\���p�f�[�^�ɔ��f�����܂��B

E3DSetInfElem, E3DDeleteInfElem, E3DNormalizeInfElem, E3DSetSymInfElem�Ȃǂŉe���x��S�ĕҏW���I�������
���̖��߂��Ă�ł��������B





������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ID�B
�@�@-1���w�肷��ƑS�Ẵp�[�c�ɑ΂��ď������s���܂��B



�o�[�W���� : ver5.0.3.7�Œǉ�

%index
E3DSetSymInfElem
CALCMODE_SYM�i�Ώ̃Z�b�g�j�Œ��_�̃{�[���e���x��ݒ肵�܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3,p4,p5
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p4 : [IN] ���l�܂��́A�ϐ��@�F�@symaxis
p5 : [IN] ���l�܂��́A�ϐ��@�F�@symdist

%inst
CALCMODE_SYM�i�Ώ̃Z�b�g�j�Œ��_�̃{�[���e���x��ݒ肵�܂��B

�Ώ̎�symaxis�����ɂ�e3dhsp3.as�Œ�`����Ă���SYMAXIS_�Ŏn�܂�萔���g�p���Ă��������B
SYMAXIS_X��X���Ώ�
SYMAXIS_Y��Y���Ώ�
SYMAXIS_Z��Z���Ώ�

���̖��߂��Ă񂾂����ł͕\���ɂ͔��f����܂���B
html{
<strong>�e���x�̕ҏW�����ׂďI�������AE3DCreateSkinMat���Ă��</strong>
}html�\���ɔ��f�����Ă��������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�p�[�c�����ʂ���ID�B
�@�@-1���w�肷��ƑS�Ẵp�[�c�ɑ΂��ď������s���܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@���_�̔ԍ��B
�@�@-1���w�肷��ƃp�[�c���̂��ׂĂ̒��_�ɑ΂��ď������s���܂��B

4. [IN] ���l�܂��́A�ϐ��@�F�@symaxis
�@�@�Ώ̎���SYMAXIS_�Ŏn�܂�萔�Ŏw�肵�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@symdist
�@�@�Ώ̋����B
�@�@�҂�����Ώ̂Ȉʒu����ǂꂭ�炢����Ă��Ă��Ώ̂Ƃ݂Ȃ������w�肵�܂��B
�@�@�����B





�o�[�W���� : ver5.0.3.7�Œǉ�

%index
E3DUpdateSymInfElem
CALCMODE_SYM�i�Ώ̐ݒ�j�̐ݒ肵�Ă��钸�_�̉e���x���ŐV�̏�ԂɍX�V���܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@excludeflag

%inst
CALCMODE_SYM�i�Ώ̐ݒ�j�̐ݒ肵�Ă��钸�_�̉e���x���ŐV�̏�ԂɍX�V���܂��B

������CreateSkinMat���Ă΂�܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] ���l�܂��́A�ϐ��@�F�@excludeflag
�@�@0���w�肷��ƑS�Ẵp�[�c�ɑ΂��ď������s���܂��B�P���w�肷���E3DSetValidFlag�Ŗ����ɂ��Ă���p�[�c�͏��O���ď������s���܂��B



�o�[�W���� : ver5.0.3.7�Œǉ�

%index
E3DSetJointInitialPos
�W���C���g�i�{�[���j�̏����ʒu�����[�J�����W�n�Őݒ肵�܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@jointno
p3 : [IN] ���l�܂��́A�ϐ��@�F�@posx
p4 : [IN] ���l�܂��́A�ϐ��@�F�@posy
p5 : [IN] ���l�܂��́A�ϐ��@�F�@posz
p6 : [IN] ���l�܂��́A�ϐ��@�F�@calcflag
p7 : [IN] ���l�܂��́A�ϐ��@�F�@excludeflag

%inst
�W���C���g�i�{�[���j�̏����ʒu�����[�J�����W�n�Őݒ肵�܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] ���l�܂��́A�ϐ��@�F�@jointno
�@�@�W���C���g�����ʂ���p�[�c��id

3. [IN] ���l�܂��́A�ϐ��@�F�@posx
4. [IN] ���l�܂��́A�ϐ��@�F�@posy
5. [IN] ���l�܂��́A�ϐ��@�F�@posz
�@�@�W���C���g�̈ʒu�����[�J�����W�n�Ŏw�肵�܂��B
�@�@�����B

6. [IN] ���l�܂��́A�ϐ��@�F�@calcflag
�@�@���_�̉e���x�̍Čv�Z������Ƃ��͂P���A���Ȃ��Ƃ��͂O���w�肵�܂��B

7. [IN] ���l�܂��́A�ϐ��@�F�@excludeflag
�@�@calcflag�ɂP���w�肵���Ƃ��݈̂Ӗ��������܂��B
�@�@�P���w�肷���E3DSetValidFlag�Ŗ����ɂ��Ă���p�[�c�̉e���x�͍Čv�Z���܂���B
�@�@�O���w�肷��Ɩ����ɂ��Ă���p�[�c���S�čČv�Z�̑ΏۂɂȂ�܂��B



�o�[�W���� : 

%index
E3DSetLightId2OfBumpMap
�o���v�}�b�v��ݒ肵�����f�����Ƃ炷�Q�ڂ̃��C�g���w�肵�܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lid

%inst
�o���v�}�b�v��ݒ肵�����f�����Ƃ炷�Q�ڂ̃��C�g���w�肵�܂��B
�e��\�����Ă���ꍇ�͗L���ɂȂ�܂���B�i�e�\�����̓��C�g�P�����L���j




������
1. [IN] ���l�܂��́A�ϐ��@�F�@lid
�@�@���C�g�����ʂ���h�c



�o�[�W���� : ver5.0.4.1�Œǉ�

%index
E3DSetLightId3OfBumpMap
�o���v�}�b�v��ݒ肵�����f�����Ƃ炷�R�ڂ̃��C�g���w�肵�܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1
p1 : [IN] ���l�܂��́A�ϐ��@�F�@lid

%inst
�o���v�}�b�v��ݒ肵�����f�����Ƃ炷�R�ڂ̃��C�g���w�肵�܂��B
�e��\�����Ă���ꍇ�͗L���ɂȂ�܂���B�i�e�\�����̓��C�g�P�����L���j




������
1. [IN] ���l�܂��́A�ϐ��@�F�@lid
�@�@���C�g�����ʂ���h�c



�o�[�W���� : ver5.0.4.1�Œǉ�

%index
E3DGetCharaDir
�L�����N�^�[���猩�ĔC�ӂ̕����̃x�N�g�����擾���܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@degxz
p3 : [IN] ���l�܂��́A�ϐ��@�F�@degy
p4 : [OUT] �ϐ��@�F�@dstx
p5 : [OUT] �ϐ��@�F�@dsty
p6 : [OUT] �ϐ��@�F�@dstz

%inst
�L�����N�^�[���猩�ĔC�ӂ̕����̃x�N�g�����擾���܂��B
degxz�ɂ�XZ���ʏ�̊p�x��degy�ɂ͋��p�x���w�肵�܂��B

�Ⴆ�΃L�����N�^�[�̌����Ă���������擾�������ꍇ��
( degxz, degy ) = ( 0.0, 0.0 )���w�肵�܂��B
�L�����N�^�[����(180.0, 0.0), �E��(-90.0, 0.0)
����(90.0, 0.0)��́i0.0, 90�j����(0.0, -90)
�Ƃ����悤�Ɏw�肵�܂��B



������
1. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���id
2. [IN] ���l�܂��́A�ϐ��@�F�@degxz
�@�@xz���ʏ�ł̊p�x�B
�@�@�����B
3. [IN] ���l�܂��́A�ϐ��@�F�@degy
�@�@���p�x�B
�@�@�����B
4. [OUT] �ϐ��@�F�@dstx
5. [OUT] �ϐ��@�F�@dsty
6. [OUT] �ϐ��@�F�@dstz
�@�@�����̃x�N�g�����������܂��B
�@�@�����^�̕ϐ��B






�o�[�W���� : ver5.0.4.7�Œǉ�

%index
E3DGetStrSizeByFontID
������̕`��ɕK�v�ȕ��ƍ������擾���܂��B
%group
Easy3D For HSP3 : �e�L�X�g

%prm
p1,p2,p3,p4
p1 : [IN] ���l�܂��́A�ϐ��@�F�@fontid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@textstr
p3 : [OUT] �ϐ��@�F�@strwidth
p4 : [OUT] �ϐ��@�F�@strheight

%inst
������̕`��ɕK�v�ȕ��ƍ������擾���܂��B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@fontid
�@�@E3DCreateFont�ō쐬�����A�t�H���g�̔ԍ����w�肵�܂��B

2. [IN] ������܂��́A������̕ϐ��@�F�@textstr
�@�@�傫���𒲂ׂ�����������w�肵�܂��B

3. [OUT] �ϐ��@�F�@strwidth
4. [OUT] �ϐ��@�F�@strheight
�@�@�`��ɕK�v�ȕ��ƍ������������܂��B




�o�[�W���� : ver5.0.5.1�Œǉ�

%index
E3DSetUVBatch
�����̒��_��UV�ݒ���ꊇ�ōs���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �z��ϐ��@�F�@vertnoptr
p4 : [IN] �ϐ��܂��́A���l�@�F�@setnum
p5 : [IN] �z��ϐ��@�F�@uvptr
p6 : [IN] �ϐ��܂��́A���l�@�F�@setflag
p7 : [IN] �ϐ��܂��́A���l�@�F�@clampflag

%inst
�����̒��_��UV�ݒ���ꊇ�ōs���܂��B
�r�f�I�o�b�t�@�̃��b�N�ƃA�����b�N�̉񐔂��ŏ����Ȃ̂�
������E3DSetUV����т������������ł��B


�������������_�̑�����setnum�Ƃ���Ƃ�
vertnoptr(0)����vertnoptr(setnum - 1) �܂ł̐����z���
���_�̔ԍ����i�[���Ă��������B

UV�̎w��̎d���́A�܂�ddim��
ddim uvptr, 2, setnum
�̂悤�ɂQ�����̎w��p�̔z����쐬���Ă��������B

������
uvptr( 0, ���_�̃C���f�b�N�X ) ��U���W���i�[��
uvptr( 1, ���_�̃C���f�b�N�X ) ��V���W���i�[���Ă��������B
���_�̃C���f�b�N�X�Ƃ͒��_�ԍ��ł͂���܂���B
�O����setnum�܂ł̒l�ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id�B
�@�@-1��n���ƃr���{�[�h�̏��������܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ��B
�@�@hsid��-1��n�����ꍇ�̓r���{�[�hID���w�肵�܂��B

3. [IN] �z��ϐ��@�F�@vertnoptr
�@�@���_�̔ԍ����i�[�����z��B

4. [IN] �ϐ��܂��́A���l�@�F�@setnum
�@�@vertnoptr�̗v�f���B
�@�@uvptr�̗v�f���Ɠ����ł��B

5. [IN] �z��ϐ��@�F�@uvptr
�@�@�ݒ肵�����t�u�l�̒l���w�肵�Ă��������B
�@�@�����^�̔z��B

6. [IN] �ϐ��܂��́A���l�@�F�@setflag
�@�@setflag �ɂO���w�肷��ƁA
�@�@�w��t�u�l���A���̂܂܃Z�b�g���܂��B

�@�@setflag�ɂP���w�肷��ƁA
�@�@�w��t�u�l���A�����̂t�u�l�ɁA�����Z���܂��B

7. [IN] �ϐ��܂��́A���l�@�F�@clampflag
�@�@�P���Z�b�g�����UV�̒l���O�D�O����P�D�O�̊ԂɃN�����v���܂��B
�@�@�O���w�肷��ƃN�����v�͍s���܂���B
�@�@�����w�肵�Ȃ������ꍇ�͂O�Ɠ����ł��B


�o�[�W���� : ver5.0.5.5�Œǉ�

%index
E3DSetPresentInterval
E3DPresent�����j�^�̐��������ɍ��킹�ē��삷�邩�ǂ�����ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@flag

%inst
E3DPresent�����j�^�̐��������ɍ��킹�ē��삷�邩�ǂ�����ݒ肵�܂��B
E3DInit�����O�ɌĂяo�����Ƃ�z�肵�Ă��܂��B
E3DInit���Ăяo������r���ŕύX���邱�Ƃ͏o���܂���B
���̖��߂��Ăяo���Ȃ������ꍇ�͐����������܂���B




������
1. [IN] �ϐ��܂��́A���l�@�F�@flag
�@�@�O���w�肷��Ɛ����������܂���B
�@�@�P���w�肷��Ɛ����������܂��B


�o�[�W���� : ver5.0.5.6�Œǉ�

%index
E3DGetScreenPosDouble
�`��f�[�^�̉�ʏ�ł�2D�̍��W���擾����֐��ł��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] ���l�܂��́A�ϐ��@�F�@hsid
p3 : [IN] ���l�܂��́A�ϐ��@�F�@partno
p4 : [OUT] �ϐ��@�F�@scx
p5 : [OUT] �ϐ��@�F�@scy
p6 : [OUT] �ϐ��@�F�@scz
p7 : [IN] ���l�܂��́A�ϐ��@�F�@vertno
p8 : [IN] ���l�܂��́A�ϐ��@�F�@calcmode

%inst
�`��f�[�^�̉�ʏ�ł�2D�̍��W���擾����֐��ł��B
���s�����Z���擾�ł��܂��B

E3DGetScreenPos3�̎����o�[�W�����ł��B

�p�[�c�P�ʁA���f���P�ʁA�r���{�[�h�P�ʂ�
�g�p�ł��܂��B

���_�P�ʂł̂Q�c���W���擾�ł��܂��B

�R�c�L�����N�^�[�̈ʒu�ɁA2D�̃X�v���C�g��\������A�Ȃǂ̗p�r�Ɏg���܂��B

Z���́A�X�v���C�g�`�掞��Z�w��̒l�Ɏg�p�ł��܂��B


html{
<strong>E3DChkInView����ŁA�Ăяo���Ă��������B</strong>
}html





������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C���h�c�B
�@�@E3DInit��E3DCreateSwapChain�Ŏ擾�����h�c��
�@�@�w�肵�Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c
�@�@-1���w�肷��ƁA�r���{�[�h�̂Q�c�ʒu���擾�ł��܂��B

3. [IN] ���l�܂��́A�ϐ��@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ����w�肵�܂��B

�@�@E3DGetPartNoByName�Ŏ擾�����ԍ���n���Ă��������B

�@�@hsid��-1���w�肵���ꍇ�́A
�@�@E3DCreateBillboard�Ŏ擾�����A
�@�@�r���{�[�hid��n���Ă��������B

�@�@partno��-1��n���ƁA
�@�@���f���S�̂̒��S���W�̂Q�c���W��
�@�@�擾�ł��܂��B

4. [OUT] �ϐ��@�F�@scx
5. [OUT] �ϐ��@�F�@scy
�@�@�w�肵���p�[�c��2D�X�N���[�����W���������܂��B      �@�@�����̕ϐ��B

6. [OUT] �ϐ��@�F�@scz
�@�@���s�����Z
�@�@�����̕ϐ��B
�@�@���̒l�ɂO����P�͈̔͊O�̒l������ꂽ�ꍇ�́A
�@�@��ʂɕ`�悳��Ȃ����_�ł��B


7. [IN] ���l�܂��́A�ϐ��@�F�@vertno
�@�@�擾���������_�̔ԍ����w�肵�܂��B
�@�@���̈������ȗ������ꍇ��A-1���w�肵���ꍇ�́A
�@�@�p�[�c�̒��S�̂Q�c���W���擾���܂��B

8. [IN] ���l�܂��́A�ϐ��@�F�@calcmode
�@�@1���w�肵�Ă��������B


�o�[�W���� : ver5.0.5.6�Œǉ�

%index
E3DSetBillboardSize
�r���{�[�h�̑傫����ݒ肵�܂��B
%group
Easy3D For HSP3 : �r���{�[�h

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@bbid
p2 : [IN] �ϐ��܂��́A���l�@�F�@width
p3 : [IN] �ϐ��܂��́A���l�@�F�@height
p4 : [IN] �ϐ��܂��́A���l�@�F�@dirmode
p5 : [IN] �ϐ��܂��́A���l�@�F�@orgflag

%inst
�r���{�[�h�̑傫����ݒ肵�܂��B
�傫����E3DCreateBillboard�ł��ݒ肳���̂�
���̖��߂͑傫����ύX�������Ƃ��݂̂Ɏg�p���܂��B

���̖��߂̓r�f�I�������ɃA�N�Z�X����̂ő��p����Əd���Ȃ�\��������܂��B
�g��k����E3DSetScale�����g�p���������BE3DSetScale�͍����ł��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@bbid
�@�@�r���{�[�h�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@width
�@�@�r���{�[�h�̕��B
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@height
�@�@�r���{�[�h�̍����B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@dirmode
�@�@dirmode�ɂO���w�肷��ƁA
�@�@�r���{�[�h�́A�x���Ɋւ��Ă̂݁A��]���܂��B
�@�@�n�ʂɗ����Ă���؂ȂǂɎg�p���Ă��������B

�@�@dirmode�̂P���w�肷��ƁA
�@�@�r���{�[�h�́A�S�����ɉ�]���܂��B
�@�@�J�����̍����ɂ�����炸�A�J�����̕�������������������
�@�@�Ⴆ�΁A�΂≌�ȂǂɁA�g�p���Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@orgflag
�@�@�r���{�[�h�̌��_�̈ʒu���w�肵�܂��B

�@�@orgflag�ɂO���w�肷��ƁA
�@�@���_�́A�r���{�[�h�̎l�p�`�̉��̕ӂ̒��S�ɂȂ�܂��B
�@�@�n�ʂɐ��₷�؂Ȃǂ̏ꍇ�ɁA�֗��ł��B

�@�@orgflag�ɂP���w�肷��ƁA
�@�@���_�́A�r���{�[�h�̒��S�ɂȂ�܂��B
�@�@�����Ȃǂ́A������ʂɎg���ꍇ�ɁA�֗��ł��B



�o�[�W���� : ver5.1.0.0�Œǉ�

%index
E3DSetHeightFogParams
�����t�H�O�i���`�j��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] ���l�܂��́A�ϐ��@�F�@enable
p2 : [IN] ���l�܂��́A�ϐ��@�F�@r
p3 : [IN] ���l�܂��́A�ϐ��@�F�@g
p4 : [IN] ���l�܂��́A�ϐ��@�F�@b
p5 : [IN] ���l�܂��́A�ϐ��@�F�@start
p6 : [IN] ���l�܂��́A�ϐ��@�F�@end
p7 : [IN] ���l�܂��́A�ϐ��@�F�@hsid

%inst
�����t�H�O�i���`�j��ݒ肵�܂��B
���_�t�H�O�Ȃ̂ŁA�|���S���̂Ȃ������ɂ́A�t�H�O�͂�����܂���B
��ʑS�̂Ƀt�H�O�����������ꍇ�́A
E3DCreateBG�ŁA�w�i���쐬���Ă��������B�i�w�i�̓|���S���ł��B�j

hsid, �r���{�[�h���쐬���Ă���Ăяo���Ă��������B
E3DCreateBG�����O�ŌĂяo���Ă��������B

E3DSetLinearFogParams�Ƃ̍��݂͏o���܂���B

��̓I�Ȏg�p��́A
e3dhsp3_HeightFog.hsp
�ɏ����܂����̂ŁA�������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@enable
�@�@�P���w�肷��ƁA�t�H�O���L���ɁA
�@�@�O���w�肷��ƁA�t�H�O�������ɂȂ�܂��B

2. [IN] ���l�܂��́A�ϐ��@�F�@r
3. [IN] ���l�܂��́A�ϐ��@�F�@g
4. [IN] ���l�܂��́A�ϐ��@�F�@b
�@�@�t�H�O�̐F���A�ir, g, b�j�Ŏw�肵�܂��B

5. [IN] ���l�܂��́A�ϐ��@�F�@start
6. [IN] ���l�܂��́A�ϐ��@�F�@end
�@�@�t�H�O����ԔZ���Ȃ��ԒႢ������start�Ɏw�肵�Ă��������B
�@�@�t�H�O�������Ȃ��ԍ���������end�Ɏw�肵�Ă��������B

7. [IN] ���l�܂��́A�ϐ��@�F�@hsid
�@�@���̈����ɁA���f���f�[�^��hsid��
�@�@�w�肷�邱�Ƃɂ��A
�@�@���f���P�ʂł̃t�H�O�̎w�肪�\�ɂȂ�܂��B
�@�@������ʂȂǂŁA�t�H�O�����������Ȃ��ꍇ�Ȃǂ�
�@�@�\���ɂ��g�����������B
�@�@���̈������A�ȗ������ꍇ�́A
�@�@���ׂẴ��f���f�[�^�ɑ΂��āA�ݒ肵�܂��B




�o�[�W���� : ver5.1.0.0�Œǉ�

%index
E3DSetTextureToBG
E3DCreateBG�ō쐬�����w�i�̃e�N�X�`����ύX���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@stageno
p3 : [IN] �ϐ��܂��́A���l�@�F�@texid

%inst
E3DCreateBG�ō쐬�����w�i�̃e�N�X�`����ύX���܂��B
E3DCreateBG���Ăяo����Ă����ԂŎg�p���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C��ID���w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@stageno
�@�@�w�i�̂P���ڂ̃e�N�X�`���ɃZ�b�g�������ꍇ�͂O���A�Q���ڂ̃e�N�X�`���ɃZ�b�g�������ꍇ�͂P���w�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@texid
�@�@�\��t�������e�N�X�`���̂h�c���w�肵�܂��B


�o�[�W���� : ver5.1.0.0�Œǉ�

%index
E3DGetTextureFromBG
E3DCreateBG�ō쐬�����w�i�̃e�N�X�`��ID���擾���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@stageno
p3 : [OUT] �ϐ��@�F�@texid

%inst
E3DCreateBG�ō쐬�����w�i�̃e�N�X�`��ID���擾���܂��B
E3DCreateBG���Ăяo����Ă����ԂŎg�p���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C��ID���w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@stageno
�@�@�w�i�̂P���ڂ̃e�N�X�`�����擾�������ꍇ�͂O���A�Q���ڂ̃e�N�X�`�����擾�������ꍇ�͂P���w�肵�܂��B

3. [OUT] �ϐ��@�F�@texid
�@�@�e�N�X�`���̂h�c���������܂��B


�o�[�W���� : ver5.1.0.0�Œǉ�

%index
E3DChangeMoaIdling
MOA�i���[�V�����A�N�Z�����[�^�j�̃A�C�h�����O���[�V������ύX���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid

%inst
MOA�i���[�V�����A�N�Z�����[�^�j�̃A�C�h�����O���[�V������ύX���܂��B

����p�Ƃ��Č��ݍĐ����̃��[�V�������V�����i�w�肵���j�A�C�h�����O���[�V�����ɂȂ�܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@�V�����A�C�h�����O���[�V������ID�B



�o�[�W���� : ver5.2.0.1�Œǉ�

%index
E3DSetMotionBlur
���[�V�����u���[�̃I���I�t�Ǝ�ނ�ݒ肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@mode
p3 : [IN] �ϐ��܂��́A���l�@�F�@blurtime

%inst
���[�V�����u���[�̃I���I�t�Ǝ�ނ�ݒ肵�܂��B
��ނɂ̓��[���h�u���[�ƃJ�����u���[������܂��B

���[���h�u���[�̓L�����N�^�[�̃��[���h���W�i�ʒu�j���ω������Ƃ��Ƀu���[�������܂��B

�J�����u���[�̓L�����N�^�[�̃J�������W�i�L�����ʒu�܂ށj���ω������Ƃ��Ƀu���[�������܂��B���̃��[�h�ł͈ʒu�������ł��J���������������ɂ̓u���[�������܂��B

���̖��߂̓I�t�ɂ���Ƃ��ȊO�d�������ł��B
����ĂԕK�v�͂���܂���B
��Ԃ�ω�������Ƃ��̂݌Ă�ł��������B


ver5.2.0.4��blurtime�������ǉ�����܂����B
����͉��t���[���O�̃f�[�^���u���[�쐬�Ɏg�p���邩���w�肷����̂ł��B
blurtime�ɂ͂P����Q�O�܂ł̐������w�肵�Ă��������B


��̓I�Ȏg�p���
e3dhsp3_MotionBlur.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@mode
�@�@BLUR_NONE���w�肷��ƃu���[�������ɂȂ�܂��B
�@�@BLUR_WORLD���w�肷��ƃ��[���h�u���[���I���ɂȂ�܂��B
�@�@BLUR_CAMERA���w�肷��ƃJ�����u���[���I���ɂȂ�܂��B
�@�@BLUR_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@blurtime
�@�@���t���[���O�̃f�[�^���u���[�쐬�Ɏg�p���邩���w�肵�܂��B
�@�@�P����Q�O�܂ł̐����B



�o�[�W���� : ver5.2.0.3�Œǉ�<BR>
      ver5.2.0.4�Ŋg��

%index
E3DSetBeforeBlur
�u���[�쐬�p�̃f�[�^���������܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
�u���[�쐬�p�̃f�[�^���������܂��B
���݂̎p���Ȃǂ�ۑ���E3DSetMotionBlur�Ŏw�肵��blurtime�񕪒~�ς��܂��B

���̖��߂�E3DSetMotionBlur�����Ȃ��Ƃ��P��͌Ăяo������łȂ��ƈӖ��������܂���B

���t���[���Ăяo���Ă��������B

��̓I�Ȏg�p���
e3dhsp3_MotionBlur.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B



�o�[�W���� : ver5.2.0.3�Œǉ�<BR>
      ver5.2.0.4�ŏC��

%index
E3DRenderMotionBlur
���[�V�����u���[��\�����܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3
p1 : [IN] ���l�܂��́A�ϐ��@�F�@scid
p2 : [IN] �z��ϐ��@�F�@hsidarray
p3 : [IN] ���l�܂��́A�ϐ��@�F�@num

%inst
���[�V�����u���[��\�����܂��B

�s�����̕`��A�������̕`��̌�ɌĂяo���Ă��������B
���݂̃L�����N�^�[�̏�Ԃ�E3DSetBeforeBlur���Ăяo�����Ƃ��̃L�����N�^�[�̏�Ԃ���ړ��O�Ճ{�����[�����쐬���������ŕ\�����܂��B

��̓I�Ȏg�p���
e3dhsp3_MotionBlur.hsp���������������B




������
1. [IN] ���l�܂��́A�ϐ��@�F�@scid
�@�@�X���b�v�`�F�C��ID���w�肵�Ă��������B

2. [IN] �z��ϐ��@�F�@hsidarray
�@�@�`�悵����hsid��z��Ɋi�[���Ă��������B
�@�@�r���{�[�h��`�悵�����Ƃ���hsid��-1��
�@�@�i�[���Ă��������B


3. [IN] ���l�܂��́A�ϐ��@�F�@num
�@�@hsidarray�ɉ���hsid���i�[���������w�肵�Ă��������B



�o�[�W���� : ver5.2.0.3�Œǉ�

%index
E3DInitBeforeBlur
�u���[�쐬�p�f�[�^�����������܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid

%inst
�u���[�쐬�p�f�[�^�����������܂��B

E3DSetMotionBlur�Ăяo�����琔���ĂP��ڂ̕`��̑O�ɂ�
�K���Ăяo���Ă��������B
�Ă΂Ȃ������ꍇ�̓S�~�̂悤�ȃu���[���\������܂��B

E3DRender������ŌĂяo���Ă��������B

��̓I�Ȏg�p���
e3dhsp3_MotionBlur.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B



�o�[�W���� : ver5.2.0.4�Œǉ�

%index
E3DSetMotionBlurPart
���[�V�����u���[�̃I���I�t�Ǝ�ނ̕ύX���p�[�c�P�ʂōs���܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@mode
p3 : [IN] �ϐ��܂��́A���l�@�F�@blurtime
p4 : [IN] �z��ϐ��@�F�@partarray
p5 : [IN] ���l�܂��́A�ϐ��@�F�@num

%inst
���[�V�����u���[�̃I���I�t�Ǝ�ނ̕ύX���p�[�c�P�ʂōs���܂��B

E3DSetMotionBlur�̑���ɌĂяo���܂��B

�p�[�c�P�ʂŐݒ�ł��邱�ƈȊO��E3DSetMotionBlur�Ɠ����ł��B
E3DSetMotionBlur�̐��������ǂ݂��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B
�@�@�r���{�[�h�ɃZ�b�g�������Ƃ���-1���w��B

2. [IN] �ϐ��܂��́A���l�@�F�@mode
�@�@BLUR_NONE���w�肷��ƃu���[�������ɂȂ�܂��B
�@�@BLUR_WORLD���w�肷��ƃ��[���h�u���[���I���ɂȂ�܂��B
�@�@BLUR_CAMERA���w�肷��ƃJ�����u���[���I���ɂȂ�܂��B
�@�@BLUR_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@blurtime
�@�@���t���[���O�̃f�[�^���u���[�쐬�Ɏg�p���邩���w�肵�܂��B
�@�@�P����Q�O�܂ł̐����B

4. [IN] �z��ϐ��@�F�@partarray
�@�@�ݒ肵�����p�[�g�̔ԍ���z��Ɋi�[���Ă��������B
�@�@�p�[�g�̔ԍ���RokDeBone2�̊K�w�\���G�f�B�^�Ńp�[�c�����E�N���b�N���V���A���ԍ��𒲂ׂ邩�A�܂���E3DGetPartNoByName���g�p���Ď擾���Ă��������B
�@�@hsid��-1���w�肵���ꍇ�̓r���{�[�hID���i�[���Ă��������B
�@�@

5. [IN] ���l�܂��́A�ϐ��@�F�@num
�@�@partarray�ɉ��̃p�[�g�ԍ����i�[���������w�肵�Ă��������B



�o�[�W���� : ver5.2.0.6�Œǉ�

%index
E3DBlurTexture16Box
�e�N�X�`���ɂP�U�{�b�N�X�u���[�łڂ����������܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@resultscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag

%inst
�e�N�X�`���ɂP�U�{�b�N�X�u���[�łڂ����������܂��B
�P�p�X�����ł��B
ver5.3.0.5�ň����ǉ��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@resultscid
�@�@���ʂ�`�悷�郌���_�[�^�[�Q�b�g�̃X���b�v�`�F�C��ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�ڂ��������e�N�X�`����ID�B

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV�␳������ꍇ�͂P�A���Ȃ��ꍇ�͂O�B
�@�@���Ȃ��ƃ{�P���傫�����E���ɂ���܂��B




�o�[�W���� : ver5.2.0.8�Œǉ�<BR>
      ver5.3.0.5�Ŋg��<BR>
      

%index
E3DBlurTexture9Corn
�e�N�X�`���ɂX�R�[���u���[�łڂ����������܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@resultscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p3 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag

%inst
�e�N�X�`���ɂX�R�[���u���[�łڂ����������܂��B
�P�p�X�����ł��B

ver5.3.0.5�ň����ǉ��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@resultscid
�@�@���ʂ�`�悷�郌���_�[�^�[�Q�b�g�̃X���b�v�`�F�C��ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�ڂ��������e�N�X�`����ID�B

3. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV�␳������ꍇ�͂P�A���Ȃ��ꍇ�͂O�B
�@�@���Ȃ��ƃ{�P���傫�����E���ɂ���܂��B




�o�[�W���� : ver5.2.0.8�Œǉ�<BR>
      ver5.3.0.5�Ŋg��<BR>
      <BR>


%index
E3DBlurTextureGauss5x5
�e�N�X�`���ɃK�E�X�u���[�łڂ����������܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@resultscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p3 : [IN] �ϐ��܂��́A���l�@�F�@dispersion
p4 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag

%inst
�e�N�X�`���ɃK�E�X�u���[�łڂ����������܂��B
�P�p�X�����ł��B

ver5.3.0.5�ň����ǉ��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@resultscid
�@�@���ʂ�`�悷�郌���_�[�^�[�Q�b�g�̃X���b�v�`�F�C��ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�ڂ��������e�N�X�`����ID�B

3. [IN] �ϐ��܂��́A���l�@�F�@dispersion
�@�@�����B
�@�@�ڂ����̋����B�傫���قǂڂ���B
�@�@���̖��߂ł͂ڂ����Ɍ��E������܂��B
�@�@�����Ƃ�������ڂ��������ꍇ��
�@�@E3DBlurTextureGauss���g���Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV�␳������ꍇ�͂P�A���Ȃ��ꍇ�͂O�B
�@�@���Ȃ��ƃ{�P���傫�����E���ɂ���܂��B




�o�[�W���� : ver5.2.0.8�Œǉ�<BR>ver5.3.0.5�Ŋg��<BR>


%index
E3DBlurTextureGauss
�e�N�X�`���ɃK�E�X�u���[�łڂ����������܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@resultscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@workscid
p3 : [IN] �ϐ��܂��́A���l�@�F�@worktexid
p4 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p5 : [IN] �ϐ��܂��́A���l�@�F�@dispersion
p6 : [IN] �ϐ��܂��́A���l�@�F�@colmult
p7 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag

%inst
�e�N�X�`���ɃK�E�X�u���[�łڂ����������܂��B
�c�����̂ڂ����Ɖ������̂ڂ����̂Q�p�X�\���ł��B
E3D�̒��ł͈�Ԍ��ʂ̂���ڂ����ł��B

��̓I�Ȏg�p���
e3dhsp3_BlurTexture.hsp�ɏ����܂����̂ł������������B

ver5.3.0.5�ň����ǉ��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@resultscid
�@�@���ʂ�`�悷�郌���_�[�^�[�Q�b�g�̃X���b�v�`�F�C��ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@workscid
�@�@�r���o�ߊi�[�p�̃����_�[�^�[�Q�b�g�e�N�X�`���̃X���b�v�`�F�C��ID�B

3. [IN] �ϐ��܂��́A���l�@�F�@worktexid
�@�@�r���o�ߊi�[�p�̃����_�[�^�[�Q�b�g�e�N�X�`���̃e�N�X�`��ID�B

4. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�ڂ��������e�N�X�`����ID�B

5. [IN] �ϐ��܂��́A���l�@�F�@dispersion
�@�@�����B
�@�@�ڂ����̋����B�傫���قǂڂ���B

6. [IN] �ϐ��܂��́A���l�@�F�@colmult
�@�@�����B
�@�@�ڂ����F�ɏ�Z����W�����w�肵�܂��B
�@�@�c�����������̂Q��|���Z����܂��B

7. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV�␳������ꍇ�͂P�A���Ȃ��ꍇ�͂O�B
�@�@���Ȃ��ƃ{�P���傫�����E���ɂ���܂��B





�o�[�W���� : ver5.2.0.8�Œǉ�<BR>ver5.3.0.5�Ŋg��<BR>


%index
E3DBlendRTTexture
�Q�̃e�N�X�`�����A���t�@�u�����h���P�̃e�N�X�`���Ƀ����_�[���܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11
p1 : [IN] �ϐ��܂��́A���l�@�F�@resultscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@texid1
p3 : [IN] �z��̕ϐ��@�F�@col1
p4 : [IN] �ϐ��܂��́A���l�@�F�@texf1
p5 : [IN] �ϐ��܂��́A���l�@�F�@texid2
p6 : [IN] �z��̕ϐ��@�F�@col2
p7 : [IN] �ϐ��܂��́A���l�@�F�@texf2
p8 : [IN] �ϐ��܂��́A���l�@�F�@blendop
p9 : [IN] �ϐ��܂��́A���l�@�F�@srcblend
p10 : [IN] �ϐ��܂��́A���l�@�F�@destblend
p11 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag

%inst
�Q�̃e�N�X�`�����A���t�@�u�����h���P�̃e�N�X�`���Ƀ����_�[���܂��B

�Q�ڂ̃e�N�X�`��ID��-1���w�肷��ƂQ�ڂ̃e�N�X�`���͖����ɂȂ�P�̃e�N�X�`�������ŏ������s���܂��B����̓e�N�X�`���̃T�C�Y��ς������ꍇ�Ȃǂɕ֗��ł��B

��̓I�Ȏg�p���
e3dhsp3_BlurTexture.hsp�ɏ����܂����̂ł������������B

ver5.3.0.5�ň����ǉ��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@resultscid
�@�@���ʂ�`�悷�郌���_�[�^�[�Q�b�g�̃X���b�v�`�F�C��ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@texid1
�@�@�P���ڂ̃e�N�X�`����ID�B
�@�@�ŏ��ɕ`�悳���B

3. [IN] �z��̕ϐ��@�F�@col1
�@�@�����^�̔z��̕ϐ��B
�@�@�v�f���͂S�B
�@�@col1(0)�ɂ͐ԐF������col1(1)�ɂ͗ΐF������
�@�@col1(2)�ɂ͐F������col1(3)�ɂ͓����x��
�@�@�ݒ肵�ēn���܂��B
�@�@�e�l��0.0����1.0�ł��B
�@�@���̐F��texid1�̃e�N�X�`���̐F�ɏ�Z����܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@texf1
�@�@texid1�̊g��k���t�B���^�̎�ށB
�@�@D3DTEXF_POINT�͂ڂ��܂���B
�@�@D3DTEXF_LINEAR�͂ڂ��܂��B
�@�@�ǂ��炩���w�肵�Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@texid2
�@�@�Q���ڂ̃e�N�X�`����ID�B
�@�@texid1�̌�ɕ`�悳���B

6. [IN] �z��̕ϐ��@�F�@col2
�@�@�����^�̔z��̕ϐ��B
�@�@�v�f���͂S�B
�@�@col2(0)�ɂ͐ԐF������col2(1)�ɂ͗ΐF������
�@�@col2(2)�ɂ͐F������col2(3)�ɂ͓����x��
�@�@�ݒ肵�ēn���܂��B
�@�@�e�l��0.0����1.0�ł��B
�@�@���̐F��texid2�̃e�N�X�`���̐F�ɏ�Z����܂��B

7. [IN] �ϐ��܂��́A���l�@�F�@texf2
�@�@texid2�̊g��k���t�B���^�̎�ށB
�@�@D3DTEXF_POINT�͂ڂ��܂���B
�@�@D3DTEXF_LINEAR�͂ڂ��܂��B
�@�@�ǂ��炩���w�肵�Ă��������B

8. [IN] �ϐ��܂��́A���l�@�F�@blendop
�@�@�A���t�@�u�����h����̎�ށB
�@�@e3dhsp3.as�Œ�`����Ă���D3DBLENDOP_�Ŏn�܂�萔���w�肵�Ă��������B

9. [IN] �ϐ��܂��́A���l�@�F�@srcblend
�@�@D3DRS_SRCBLEND�̒l�B
�@�@e3dhsp3.as�Œ�`����Ă���D3DBLEND_�Ŏn�܂�萔���w�肵�Ă��������B

10. [IN] �ϐ��܂��́A���l�@�F�@destblend
�@�@D3DRS_DESTBLEND�̒l�B
�@�@e3dhsp3.as�Œ�`����Ă���D3DBLEND_�Ŏn�܂�萔���w�肵�Ă��������B

11. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV�␳������ꍇ�͂P�A���Ȃ��ꍇ�͂O�B
�@�@���Ȃ��ƃ{�P���傫�����E���ɂ���܂��B




�o�[�W���� : ver5.2.0.8�Œǉ�<BR>
      ver5.3.0.5�Ŋg��<BR>
      

%index
E3DSetClearCol
�T�[�t�F�X�̃N���A�F���X���b�v�`�F�C�����Ƃɐݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@scid
p2 : [IN] �ϐ��܂��́A���l�@�F�@A
p3 : [IN] �ϐ��܂��́A���l�@�F�@R
p4 : [IN] �ϐ��܂��́A���l�@�F�@G
p5 : [IN] �ϐ��܂��́A���l�@�F�@B

%inst
�T�[�t�F�X�̃N���A�F���X���b�v�`�F�C�����Ƃɐݒ肵�܂��B
�����_�[�^�[�Q�b�g�e�N�X�`���̃N���A�F���ݒ�ł��܂��B
E3DBeginScene���O�ŌĂ�ł��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@scid
�@�@�X���b�v�`�F�C��ID���w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@A
�@�@�N���A�F�̓����x���w�肵�܂��B
�@�@�O����Q�T�T�܂ł̐����l�ł��B

3. [IN] �ϐ��܂��́A���l�@�F�@R
�@�@�N���A�F�̐Ԑ������w�肵�܂��B
�@�@�O����Q�T�T�܂ł̐����l�ł��B

4. [IN] �ϐ��܂��́A���l�@�F�@G
�@�@�N���A�F�̗ΐ������w�肵�܂��B
�@�@�O����Q�T�T�܂ł̐����l�ł��B

5. [IN] �ϐ��܂��́A���l�@�F�@B
�@�@�N���A�F�̐������w�肵�܂��B
�@�@�O����Q�T�T�܂ł̐����l�ł��B




�o�[�W���� : ver5.2.0.9�Œǉ�

%index
E3DSetMotionBlurMinAlpha
���[�V�����u���[�̃u���[�̏������ݒ肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@minAlpha

%inst
���[�V�����u���[�̃u���[�̏������ݒ肵�܂��B
���[�V�����u���[�͓�������̈ʒu�̓����x���P��
�����O�̈ʒu�̓����x��minAlpha�ƂȂ�܂��B
�u���[�̓����x�͂P����minAlpha�܂ŏ��X�ɔ����Ȃ��Ă������ƂɂȂ�܂��B

����minAlpha�̒l�𒲐����邱�ƂŃu���[�̏������ς��邱�Ƃ��o���܂��B

�����ݒ肵�Ȃ���Ԃł�minAlpha��0.2�ɂȂ��Ă��܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ��B
�@�@-1���w�肷��ƑS�Ẵp�[�c�ɐݒ肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@minAlpha
�@�@0.0����1.0�܂ł̎����B
�@�@�u���[�̍ŏ������x���w�肵�܂��B




�o�[�W���� : ver5.2.0.9�Œǉ�

%index
E3DRenderGlow
�O���[����`�悵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2
p1 : [IN] �z��ϐ��@�F�@hsidarray
p2 : [IN] ���l�܂��́A�ϐ��@�F�@num

%inst
�O���[����`�悵�܂��B
�O���[�̎g�����ɂ��Ă�rdb2_glow.htm���������������B
��̓I�Ȏg�p���
e3dhsp3_glow.hsp���������������B




������
1. [IN] �z��ϐ��@�F�@hsidarray
�@�@�`�悵����hsid��z��Ɋi�[���Ă��������B

2. [IN] ���l�܂��́A�ϐ��@�F�@num
�@�@hsidarray�ɉ���hsid���i�[���������w�肵�Ă��������B



�o�[�W���� : ver5.2.1.0�Œǉ�

%index
E3DSetMaterialGlowParams
�O���[�̗L�������ƐF�{�����w�肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] �ϐ��܂��́A���l�@�F�@glowmode
p4 : [IN] �ϐ��܂��́A���l�@�F�@setcolflag
p5 : [IN] �z��̕ϐ��@�F�@colmult

%inst
�O���[�̗L�������ƐF�{�����w�肵�܂��B

���̖��߂ŃO���[�̃��[�h��I���I�t��ύX�����
�}�e���A���̓��ߕ��@transparent�������I�ɓK�؂Ȃ��̂ɕύX����܂��B
���[�h�ύX�O�̏�Ԃɖ߂������ꍇ��
E3DGetMaterialTransparent��E3DSetMaterialTransparent
���g�p���ĕύX�O�̏�Ԃ�ۑ����Ă����ĕ������Ă��������B

�O���[�̎g�����ɂ��Ă�rdb2_glow.htm���������������B
��̓I�Ȏg�p���
e3dhsp3_glow.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] �ϐ��܂��́A���l�@�F�@glowmode
�@�@�O���[�̃��[�h���w�肵�܂��B
�@�@GLOW_NONE���w�肷��ƃO���[�������ɂȂ�܂��B
�@�@GLOW_NORMAL���w�肷��ƕs�����O���[�ɂȂ�܂��B
�@�@GLOW_ALPHA���w�肷��Ɣ������O���[�ɂȂ�܂��B
�@�@GLOW�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@setcolflag
�@�@colmult�����Ŏw�肵���l��ݒ肵�����Ƃ��͂P���w�肵�A�����������Ƃ��͂O���w�肵�܂��B

5. [IN] �z��̕ϐ��@�F�@colmult
�@�@�����^�̔z��̕ϐ��B
�@�@colmult(0)�ɂ͐Ԃ̔{����colmult(1)�ɂ͗΂̔{����colmult(2)�ɂ͐̔{�����w�肵�Ă��������B




�o�[�W���� : ver5.2.1.0�Œǉ�

%index
E3DGetMaterialGlowParams
�O���[�̗L�������ƐF�{�����擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@glowmode
p4 : [OUT] �z��̕ϐ��@�F�@colmult

%inst
�O���[�̗L�������ƐF�{�����擾���܂��B
�O���[�̎g�����ɂ��Ă�rdb2_glow.htm���������������B
��̓I�Ȏg�p���
e3dhsp3_glow.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@glowmode
�@�@�O���[�̃��[�h���������܂��B
�@�@GLOW_NONE�̓O���[�����B
�@�@GLOW_NORMAL�͕s�����O���[�B
�@�@GLOW_ALPHA�͔������O���[�B
�@�@GLOW�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

4. [OUT] �z��̕ϐ��@�F�@colmult
�@�@�����^�̔z��̕ϐ��B
�@�@���̖��߂��ĂԑO�ɕK��ddim colmult, 3�����s���Ă��������B
�@�@�O���[�̐F�{�����������܂��B
�@�@colmult(0)�ɂ͐Ԃ̔{����colmult(1)�ɂ͗΂̔{����colmult(2)�ɂ͐̔{�����������܂��B




�o�[�W���� : ver5.2.1.0�Œǉ�

%index
E3DSetMaterialTransparent
�e�N�X�`���̓��ߕ��@��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] �ϐ��܂��́A���l�@�F�@transparent

%inst
�e�N�X�`���̓��ߕ��@��ݒ肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] �ϐ��܂��́A���l�@�F�@transparent
�@�@�e�N�X�`���̓��߃��[�h���w�肵�܂��B
�@�@�O���w�肷��Ɠ��߂Ȃ��B
�@�@�P���w�肷��ƍ��F���߁B
�@�@�Q���w�肷��ƃe�N�X�`���̃A���t�@�ɂ�蓧�߁B



�o�[�W���� : ver5.2.1.0�Œǉ�

%index
E3DGetMaterialTransparent
�e�N�X�`���̓��ߕ��@���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] �ϐ��@�F�@transparent

%inst
�e�N�X�`���̓��ߕ��@���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] �ϐ��@�F�@transparent
�@�@�e�N�X�`���̓��߃��[�h���������܂��B
�@�@�O�͓��߂Ȃ��B
�@�@�P�͍��F���߁B
�@�@�Q�̓e�N�X�`���A���t�@�ɂ�铧�߁B
�@


�o�[�W���� : ver5.2.1.0�Œǉ�

%index
E3DChkHDR
HDR�ŕ`��ł��邩�ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2,p3
p1 : [OUT] �ϐ��@�F�@okflag
p2 : [OUT] �ϐ��@�F�@hdrformat
p3 : [OUT] �ϐ��@�F�@toneformat

%inst
HDR�ŕ`��ł��邩�ǂ����𒲂ׂ܂��B
E3DInit������ŌĂяo���܂��B
��ɕ��������t�H�[�}�b�g�̃e�N�X�`�����g���邩�ǂ��������ɂȂ�܂��B



������
1. [OUT] �ϐ��@�F�@okflag
�@�@HDR���g�p�ł���ꍇ�͂P���o���Ȃ��ꍇ�͂O���������܂��B

2. [OUT] �ϐ��@�F�@hdrformat
�@�@HDR�V�[����`�悷��Ƃ��̃e�N�X�`���̃t�H�[�}�b�g���������܂��B

3. [OUT] �ϐ��@�F�@toneformat
�@�@�g�[���}�b�v���쐬����Ƃ��̃e�N�X�`���̃t�H�[�}�b�g���������܂��B



�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DCheckSpec
Easy3D�����s�\���ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : ��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@wid
p2 : [OUT] �ϐ��@�F�@okflag

%inst
Easy3D�����s�\���ǂ����𒲂ׂ܂��B
�s�N�Z���V�F�[�_�[�Q�D�O�����݂��邩�ǂ�����
�X�g���[�����R�ȏ�g���邩�ǂ����Ȃǂ𒲂ׂ܂��B
E3DInit�����O�ŌĂяo���܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@wid
�@�@�E�C���h�E�̂h�c��n���Ă��������B
�@�@screen���߂�bgscr���߂Ɏw�肵���̂Ɠ����ԍ���
�@�@�w�肵�Ă��������B
�@�@E3DInit�ɓn���\���wid���w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@okflag
�@�@Easy3D���g�p�ł���ꍇ�͂P���o���Ȃ��ꍇ�͂O���������܂��B



�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DDisablePostEffect
�f�t�H���g�̓���ł�dll�Ɠ����ꏊ��E3D_HLSL�t�H���_�������ƃG���[�ɂȂ�܂����A�|�X�g�G�t�F�N�g�@�\���g��Ȃ��Ƃ��̖��߂Ő錾����΁AE3D_HLSL�t�H���_���Ȃ��Ă��G���[�ɂȂ�܂���B
%group
Easy3D For HSP3 : ��

%prm
�Ȃ�

%inst
�f�t�H���g�̓���ł�dll�Ɠ����ꏊ��E3D_HLSL�t�H���_�������ƃG���[�ɂȂ�܂����A�|�X�g�G�t�F�N�g�@�\���g��Ȃ��Ƃ��̖��߂Ő錾����΁AE3D_HLSL�t�H���_���Ȃ��Ă��G���[�ɂȂ�܂���B

E3DInit�����O�łP�񂾂��Ăяo���Ă��������B



������
�Ȃ�

�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DSetHDRLightDiffuse
HDR�p�̋������C�g�F�i�g�U���j��ݒ肷�邱�Ƃ��o���܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@lid
p2 : [IN] �ϐ��܂��́A���l�@�F�@R
p3 : [IN] �ϐ��܂��́A���l�@�F�@G
p4 : [IN] �ϐ��܂��́A���l�@�F�@B

%inst
HDR�p�̋������C�g�F�i�g�U���j��ݒ肷�邱�Ƃ��o���܂��B
���������_�Ŏw�肵�܂��B
�P�D�O�͐����w�莞�̂Q�T�T�ɑ������܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@lid
�@�@���C�g�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@R
3. [IN] �ϐ��܂��́A���l�@�F�@G
4. [IN] �ϐ��܂��́A���l�@�F�@B
�@�@���C�g�̊g�U�F���iR,G,B�j�Ŏw�肵�܂��B




�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DSetHDRLightSpecular
HDR�p�̋������C�g�F�i���ˌ��j��ݒ肷�邱�Ƃ��o���܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@lid
p2 : [IN] �ϐ��܂��́A���l�@�F�@R
p3 : [IN] �ϐ��܂��́A���l�@�F�@G
p4 : [IN] �ϐ��܂��́A���l�@�F�@B

%inst
HDR�p�̋������C�g�F�i���ˌ��j��ݒ肷�邱�Ƃ��o���܂��B
���������_�Ŏw�肵�܂��B
�P�D�O�͐����w�莞�̂Q�T�T�ɑ������܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@lid
�@�@���C�g�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@R
3. [IN] �ϐ��܂��́A���l�@�F�@G
4. [IN] �ϐ��܂��́A���l�@�F�@B
�@�@���C�g�̔��ːF���iR,G,B�j�Ŏw�肵�܂��B



�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DDownScaleRTTexture4x4
�c�����ꂼ��S���̂P�̑傫���̃����_�[�^�[�Q�b�g�e�N�X�`���ɃR�s�[���܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@dstscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid

%inst
�c�����ꂼ��S���̂P�̑傫���̃����_�[�^�[�Q�b�g�e�N�X�`���ɃR�s�[���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@dstscid
�@�@�`���̃����_�[�^�[�Q�b�g�e�N�X�`���̃X���b�v�`�F�C��ID�B���������̃e�N�X�`���B

2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�`�挳�̃����_�[�^�[�Q�b�g�e�N�X�`���̃e�N�X�`��ID�B�傫�����̃e�N�X�`���B




�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DDownScaleRTTexture2x2
�c�����ꂼ��Q���̂P�̑傫���̃����_�[�^�[�Q�b�g�e�N�X�`���ɃR�s�[���܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@dstscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid

%inst
�c�����ꂼ��Q���̂P�̑傫���̃����_�[�^�[�Q�b�g�e�N�X�`���ɃR�s�[���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@dstscid
�@�@�`���̃����_�[�^�[�Q�b�g�e�N�X�`���̃X���b�v�`�F�C��ID�B���������̃e�N�X�`���B

2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�`�挳�̃����_�[�^�[�Q�b�g�e�N�X�`���̃e�N�X�`��ID�B�傫�����̃e�N�X�`���B



�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DCreateToneMapTexture
�g�[���}�b�v�e�N�X�`�����쐬���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@tonenum
p2 : [IN] �ϐ��܂��́A���l�@�F�@toneformat
p3 : [OUT] �ϐ��@�F�@tonemapid
p4 : [OUT] �ϐ��@�F�@okflag

%inst
�g�[���}�b�v�e�N�X�`�����쐬���܂��B
�g�[���}�b�v�e�N�X�`���Ƃ̓V�[���̖��邳���v�����邽�߂Ɏg�p���郌���_�[�^�[�Q�b�g�e�N�X�`���ł��B

��x�ɗL���ɂł���g�[���}�b�v�̑g�͂P�O�g�܂łł��B
����ȏ�̃g�[���}�b�v���g�p�������ꍇ��E3DDestroyToneMapTexture���Ă�ŕs�v�Ȃ��̂��폜���Ă���
���̖��߂��Ă�ł��������B

��̓I�Ȏg�p���
e3dhsp3_HDRLighting.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@tonenum
�@�@�g�[���}�b�v�e�N�X�`���̐����w�肵�܂��B
�@�@�R�ȏ�̐����w�肵�Ă��������B
�@�@�g�[���}�b�v�͂PX1�̑傫���̂��̂��珇�ԂɂS�{�������T�C�Y�̃e�N�X�`���ɂȂ�܂��B
�@�@�Ⴆ��tonenum�ɂS���w�肵���ꍇ��
�@�@1X1, 4X4, 16X16, 64X64�̃T�C�Y�̃e�N�X�`���������ō쐬����܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@toneformat
�@�@�g�[���}�b�v�e�N�X�`���̃t�H�[�}�b�g�B
�@�@E3DChkHDR�Ŏ擾����toneformat���w�肵�Ă��������B
�@�@
3. [OUT] �ϐ��@�F�@tonemapid
�@�@�쐬�����g�[���}�b�v�����ʂ���ID���������܂��B

4. [OUT] �ϐ��@�F�@okflag
�@�@���߂����������ꍇ�ɂ͂P�����s�����ꍇ�ɂ͂O���������܂��B




�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DDestroyToneMapTexture
�g�[���}�b�v�e�N�X�`�����폜���܂��B
%group
Easy3D For HSP3 : �e�N�X�`��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@tonemapid

%inst
�g�[���}�b�v�e�N�X�`�����폜���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@tonemapid
�@�@�폜����g�[���}�b�v�����ʂ���ID�B


�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DRenderToneMap
�g�[���}�b�v�ɃV�[���̖��邳�������_�����O�����邳���v�����܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@tonemapid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid

%inst
�g�[���}�b�v�ɃV�[���̖��邳�������_�����O�����邳���v�����܂��B

��̓I�Ȏg�p���
e3dhsp3_HDRLighting.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@tonemapid
�@�@�g�[���}�b�v�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@���邳���v���������e�N�X�`����ID�B



�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DBrightPassRTTextureHDR
HDR�ŕ`�悵���e�N�X�`���̖��邢���������𔲂��o��LDR�ɕϊ����܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@dstscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p3 : [IN] �ϐ��܂��́A���l�@�F�@middlegray
p4 : [IN] �ϐ��܂��́A���l�@�F�@threshold
p5 : [IN] �ϐ��܂��́A���l�@�F�@offset
p6 : [IN] �ϐ��܂��́A���l�@�F�@tonemapid

%inst
HDR�ŕ`�悵���e�N�X�`���̖��邢���������𔲂��o��LDR�ɕϊ����܂��B

��̓I�Ȏg�p���
e3dhsp3_HDRLighting.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@dstscid
�@�@�`���̃X���b�v�`�F�C��ID�B
�@�@
2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@HDR�ŕ`�悳��Ă��錳�摜�̓������e�N�X�`����ID�B
�@�@
3. [IN] �ϐ��܂��́A���l�@�F�@middlegray
�@�@��ʂ̖��邳�����߂�L�[�ɂȂ�l�B
�@�@�����B
�@�@
4. [IN] �ϐ��܂��́A���l�@�F�@threshold
�@�@���̒l���Â������͐F���O�ɂȂ�B
�@�@�����B

5. [IN] �ϐ��܂��́A���l�@�F�@offset
�@�@threshold�ŐF���������������offset�����F�𑫂��܂��B
�@�@
6. [IN] �ϐ��܂��́A���l�@�F�@tonemapid
�@�@�V�[���̖��邳���L�^���Ă���g�[���}�b�v��ID�B




�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DRenderHDRFinal
HDR�V�[���ƃu���[���摜��������LDR�ɕϊ����ĕ`�悵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@dstscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid0
p3 : [IN] �ϐ��܂��́A���l�@�F�@srctexid1
p4 : [IN] �ϐ��܂��́A���l�@�F�@tonemapid
p5 : [IN] �ϐ��܂��́A���l�@�F�@middlegray

%inst
HDR�V�[���ƃu���[���摜��������LDR�ɕϊ����ĕ`�悵�܂��B


��̓I�Ȏg�p���
e3dhsp3_HDRLighting.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@dstscid
�@�@�`���̃X���b�v�`�F�C��ID�B
�@�@
2. [IN] �ϐ��܂��́A���l�@�F�@srctexid0
�@�@HDR�ŕ`�悳��Ă��錳�摜�̓������e�N�X�`����ID�B

3. [IN] �ϐ��܂��́A���l�@�F�@srctexid1
�@�@�u���[���摜�̃e�N�X�`��ID�B

4. [IN] �ϐ��܂��́A���l�@�F�@tonemapid
�@�@�g�[���}�b�v��ID�B

5. [IN] �ϐ��܂��́A���l�@�F�@middlegray
�@�@�V�[���̖��邳�����肷��L�[�̒l�B
�@�@E3DBrightPassRTTextureHDR�Ɏw�肵���̂Ɠ����l���w�肵�܂��B
�@�@�����B




�o�[�W���� : ver5.2.1.6�Œǉ�

%index
E3DMonoRTTexture
�e�N�X�`���̓��e�𔒍��摜�ɕϊ����܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@dstscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid

%inst
�e�N�X�`���̓��e�𔒍��摜�ɕϊ����܂��B

��̓I�Ȏg�p���
e3dhsp3_Mono.hsp���������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@dstscid
�@�@�`���̃X���b�v�`�F�C��ID�B
�@�@
2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@���摜�̓������e�N�X�`����ID�B



�o�[�W���� : ver5.2.1.7�Œǉ�

%index
E3DCbCrRTTexture
�e�N�X�`���̓��e��YCbCr�F��Ԃɕϊ���Y��ۂ����܂�Cb��Cr���w��l�ɐݒ肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@dstscid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid
p3 : [IN] �ϐ��܂��́A���l�@�F�@cb
p4 : [IN] �ϐ��܂��́A���l�@�F�@cr

%inst
�e�N�X�`���̓��e��YCbCr�F��Ԃɕϊ���Y��ۂ����܂�Cb��Cr���w��l�ɐݒ肵�܂��B

YCbCr�̒l�̃Z�b�g���ǂ�ȐF�ɂȂ�̂���PhotoShop�Ȃǂ̃y�C���g�\�t�g�Ŋm�F���Ă��������B

��̓I�Ȏg�p���
e3dhsp3_CbCr.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@dstscid
�@�@�`���̃X���b�v�`�F�C��ID�B
�@�@
2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@���摜�̓������e�N�X�`����ID�B

3. [IN] �ϐ��܂��́A���l�@�F�@cb
�@�@YCbCr��Cb�̒l�B
�@�@�����B

4. [IN] �ϐ��܂��́A���l�@�F�@cr
�@�@YCbCr��Cr�̒l�B
�@�@�����B




�o�[�W���� : ver5.2.1.7�Œǉ�

%index
E3DShaderConstOffset16
posteffect.fx�̃f�[�^float2 avSampleOffsets[16]�ɒl��ݒ肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1
p1 : [IN] �z��̕ϐ��@�F�@offsetarray

%inst
posteffect.fx�̃f�[�^float2 avSampleOffsets[16]�ɒl��ݒ肵�܂��B
���̃f�[�^�͑��̖��߂ł��g���܂��B
�i�g���Ă���ꏊ��posteffect.fx�Ŋm�F���Ă��������B�j
���̖��߂ŏ㏑������邱�Ƃ�����̂ł��̓s�x�ݒ肵�Ă��������B

offsetarray�ɂ�
ddim offsetarray, 2, 16
�Ŋm�ۂ����z����g�p���Ă��������B�idim�łȂ��Ď�����ddim�ł��j
�����Œl���Z�b�g���Ă��疽�߂ɓn���Ă��������B





������
1. [IN] �z��̕ϐ��@�F�@offsetarray
�@�@�Z�b�g�������l���ݒ肵�Ă�������̔z��B
�@�@�ڂ����͑O�L���������������B



�o�[�W���� : ver5.2.1.8�Œǉ�

%index
E3DShaderConstWeight16
posteffect.fx�̃f�[�^float4 avSampleWeights[16]�ɒl��ݒ肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1
p1 : [IN] �z��̕ϐ��@�F�@weightarray

%inst
posteffect.fx�̃f�[�^float4 avSampleWeights[16]�ɒl��ݒ肵�܂��B
���̃f�[�^�͑��̖��߂ł��g���܂��B
�i�g���Ă���ꏊ��posteffect.fx�Ŋm�F���Ă��������B�j
���̖��߂ŏ㏑������邱�Ƃ�����̂ł��̓s�x�ݒ肵�Ă��������B

weightarray�ɂ�
ddim weightarray, 4, 16
�Ŋm�ۂ����z����g�p���Ă��������B�idim�łȂ��Ď�����ddim�ł��j
�����Œl���Z�b�g���Ă��疽�߂ɓn���Ă��������B




������
1. [IN] �z��̕ϐ��@�F�@weightarray
�@�@�Z�b�g�������l���ݒ肵�Ă�������̔z��B
�@�@�ڂ����͑O�L���������������B



�o�[�W���� : ver5.2.1.8�Œǉ�

%index
E3DShaderConstUserFL4
posteffect.fx�̃f�[�^float4 userFL4_0����userFL4_9�̂ǂꂩ�ɒl��ݒ肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@datano
p2 : [IN] �z��̕ϐ��@�F�@flarray

%inst
posteffect.fx�̃f�[�^float4 userFL4_0����userFL4_9�̂ǂꂩ�ɒl��ݒ肵�܂��B

flarray�ɂ�
ddim flarray, 4
�Ŋm�ۂ����z����g�p���Ă��������B�idim�łȂ��Ď�����ddim�ł��j
�����Œl���Z�b�g���Ă��疽�߂ɓn���Ă��������B

��̓I�Ȏg�p���
e3dhsp3_CustomShader.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@datano
�@�@userFL4_0����userFL4_9�܂ł̂ǂ�ɒl���Z�b�g���邩���O����X�̐����Ŏw�肵�܂��B

2. [IN] �z��̕ϐ��@�F�@flarray
�@�@�Z�b�g�������l���ݒ肵�Ă�������̔z��B
�@�@�ڂ����͑O�L���������������B



�o�[�W���� : ver5.2.1.8�Œǉ�

%index
E3DShaderConstUserTex
posteffect.fx�̃f�[�^texture usertex0����usertex4�̂ǂꂩ�ɒl��ݒ肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@datano
p2 : [IN] �ϐ��܂��́A���l�@�F�@srctexid

%inst
posteffect.fx�̃f�[�^texture usertex0����usertex4�̂ǂꂩ�ɒl��ݒ肵�܂��B

��̓I�Ȏg�p���
e3dhsp3_CustomShader.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@datano
�@�@usertex0����usetex4�܂ł̂ǂ�ɒl���Z�b�g���邩���O����S�̐����Ŏw�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@srctexid
�@�@�ݒ肵�����e�N�X�`�������ʂ���ID�B




�o�[�W���� : ver5.2.1.8�Œǉ�

%index
E3DCallUserShader
posteffect.fx��technique PostEffectUser0����PostEffectUser4�̂����̈�����s���܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@shaderno
p2 : [IN] �ϐ��܂��́A���l�@�F�@passno
p3 : [IN] �ϐ��܂��́A���l�@�F�@dstscid

%inst
posteffect.fx��technique PostEffectUser0����PostEffectUser4�̂����̈�����s���܂��B
���s����p�X���P�����I�ׂ܂��B

��̓I�Ȏg�p���
e3dhsp3_CustomShader.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@shaderno
�@�@PostEffectUser0����PostEffectUser4�܂ł̂ǂ�����s���邩���O����S�̐����Ŏw�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@passno
�@�@�e�N�j�b�N�̉��Ԃ̃p�X�����s���邩���w�肵�܂��B
�@�@�Ⴆ��pass P0�����s�������Ƃ��͂O��pass P1�����s�������Ƃ��͂P���w�肵�܂��B
�@�@�L�q���Ă���p�X�̔ԍ��ő�l�����傫���l���w�肷��ƃG���[�ɂȂ�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@dstscid
�@�@�`���̃X���b�v�`�F�C��ID�B



�o�[�W���� : ver5.2.1.8�Œǉ�

%index
E3DCreateBone
�{�[����V�K�ɍ쐬���܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@name
p3 : [IN] �ϐ��܂��́A���l�@�F�@parentid
p4 : [OUT] �ϐ��@�F�@serialid

%inst
�{�[����V�K�ɍ쐬���܂��B

�ǂݍ��ݍς݂̃��[�V�����͑S�Ĕj������܂��B

�e���x�̍Čv�Z�͂��܂���B
�������ꍇ��E3DJointRemake���Ăяo���Ă��������B

�{�[���̈ʒu��E3DSetJointInitialPos�Őݒ肵�Ă��������B

Easy3D�̎d�l��{�[����j������ƃS�~�f�[�^���c��܂��B
�S�~�f�[�^�͂��܂葽���Ȃ�ƕ`�摬�x�ɉe�����܂��B
E3DCreateBone�ɂ̓S�~�f�[�^�����݂���΂�����ė��p����悤�Ȏd�g�݂�����܂��B
�ł��̂ł܂��s�v�ȃ{�[����E3DDestroyBone�������E3DCreateBone����ƃS�~�����Ȃ��čς݂܂��B
�S�~�̑|���̎d����RokDeBone2ver5.2.1.3�̐V�@�\�̃y�[�W�̐������������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ID�B

2. [IN] ������܂��́A������̕ϐ��@�F�@name
�@�@�{�[���̖��O���i�[����������B
�@�@�Q�T�T�o�C�g�܂łł��B

3. [IN] �ϐ��܂��́A���l�@�F�@parentid
�@�@�e�ɂȂ�W���C���g�����ʂ���p�[�c��ID�B
�@�@��Ԑe�̃{�[�����쐬����ꍇ�ȊO�͕K���W���C���g��ID���w�肵�Ă��������B
�@�@��Ԑe�̃{�[�����쐬����Ƃ���-1���w�肵�Ă��������B-1���w�肷��ƃp�[�c���܂Ƃ߂����������p�[�c�̂����ň�ԍŌ�ɍ��ꂽ�p�[�c���e�ɂȂ�܂��B
( �ʏ�́uJoint Part�v�Ƃ������O�̃p�[�c�ɂȂ�܂��B)

4. [OUT] �ϐ��@�F�@serialid
�@�@�V���ɍ쐬���ꂽ�{�[�������ʂ���ID(�p�[�c��ID)���������܂��B
�@�@�G���[���������ꍇ��-1���������܂��B





�o�[�W���� : ver5.2.1.9�Œǉ�

%index
E3DDestroyBone
�{�[����j�����܂��B
%group
Easy3D For HSP3 : ���f�����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@boneno

%inst
�{�[����j�����܂��B

�ǂݍ��ݍς݂̃��[�V�����͑S�Ĕj������܂��B

�e���x�̍Čv�Z�͋����I�ɍs���܂��B

E3DCreateBone�̐��������ǂ݂��������B






������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�폜�������{�[�������ʂ���ID�B




�o�[�W���� : ver5.2.1.9�Œǉ�

%index
E3DGetMorphBaseNum
���[�t�̃x�[�X�̐����擾���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@basenumptr

%inst
���[�t�̃x�[�X�̐����擾���܂��B
���ꂼ��̃��[�t�ɂ̓x�[�X�͂P���������܂܂�Ȃ��̂�
���̐��̓��[�t�̐��ƈ�v���܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@basenumptr
�@�@�x�[�X�̐����������܂��B



�o�[�W���� : ver5.2.2.3�Œǉ�<BR>
      

%index
E3DGetMorphBaseInfo
���[�t�̃x�[�X�̏����ꊇ�Ŏ擾���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng
p3 : [OUT] ������̕ϐ��@�F�@basename
p4 : [OUT] �z��ϐ��@�F�@baseinfo

%inst
���[�t�̃x�[�X�̏����ꊇ�Ŏ擾���܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@basename��baseinfo�̗v�f�����w�肵�Ă��������B
�@�@E3DGetMorphBaseNum�Ŏ擾����basenum����Ȃ��ƃG���[�ɂȂ�܂��B

3. [OUT] ������̕ϐ��@�F�@basename
�@�@�x�[�X�̖��O���������܂��B
�@�@sdim basename, 256, basenum
�@�@�̂悤�ɕ�������쐬���Ďw�肵�Ă��������B
�B
4. [OUT] �z��ϐ��@�F�@baseinfo
�@�@�x�[�X�̏�񂪑������܂��B
�@�@dim baseinfo, MBI_MAX, basenum
�@�@�Ŕz����쐬���Ă��������B
�@�@MBI_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

�@�@basecnt���O����basenum - 1�܂ł̐��Ƃ����
�@�@baseinfo( MBI_DISPNO, basecnt )�ɂ̓x�[�X�̃V���A��ID���������܂��B
�@�@baseinfo( MBI_BONENO, basecnt )�ɂ̓��[�t�̃��[�V�������̊i�[��{�[���ԍ����������܂��B
�@�@baseinfo( MBI_TARGETNUM, basecnt )�ɂ̓x�[�X�ɑΉ��t����ꂽ�^�[�Q�b�g�̐����������܂��B
�@�@



�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DGetMorphTargetInfo
���[�t�̃^�[�Q�b�g�̏������[�t���Ɓi�x�[�X���Ɓj�Ɏ擾���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@baseid
p3 : [IN] int�@�F�@arrayleng
p4 : [OUT] ������̕ϐ��@�F�@targetname
p5 : [OUT] �z��ϐ��@�F�@targetno

%inst
���[�t�̃^�[�Q�b�g�̏������[�t���Ɓi�x�[�X���Ɓj�Ɏ擾���܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@���[�t�̃x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_DISPNO, basecnt )���w�肵�Ă��������B

3. [IN] int�@�F�@arrayleng
�@�@targetname��targetinfo�̗v�f�����w�肵�Ă��������B
�@�@�x�[�X�Ɋ܂܂��^�[�Q�b�g���ƈقȂ�ꍇ�ɂ̓G���[�ɂȂ�܂��B


4. [OUT] ������̕ϐ��@�F�@targetname
�@�@�^�[�Q�b�g�̖��O���������܂��B
�@�@sdim targetname, 256, targetnum
�@�@�̂悤�ɔz����쐬���Ă��������B

5. [OUT] �z��ϐ��@�F�@targetno
�@�@�^�[�Q�b�g�̃V���A��ID���������܂��B
�@�@dim targetno, targetnum
�@�@�̂悤�ɔz����쐬���Ă��������B




�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DGetMorphKeyNum
���[�t���[�V�����̃L�[�̐����擾���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@boneid
p4 : [IN] �ϐ��܂��́A���l�@�F�@baseid
p5 : [IN] �ϐ��܂��́A���l�@�F�@targetid
p6 : [OUT] �ϐ��@�F�@keynum

%inst
���[�t���[�V�����̃L�[�̐����擾���܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@boneid
�@�@���[�t���[�V�������̊i�[��̃{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_BONENO, basecnt )���w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@���[�t�̃x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_DISPNO, basecnt )���w�肵�Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@targetid
�@�@���[�t�̃^�[�Q�b�g�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphTargetInfo�Ŏ擾����targetno( targetcnt )���w�肵�Ă��������B

6. [OUT] �ϐ��@�F�@keynum
�@�@�L�[�̐����������܂��B



�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DGetMorphKey
���[�t���[�V�����̏����L�[�̐����擾���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@boneid
p4 : [IN] �ϐ��܂��́A���l�@�F�@baseid
p5 : [IN] int�@�F�@targetid
p6 : [IN] int�@�F�@arrayleng
p7 : [OUT] �ϐ��@�F�@framenoarray
p8 : [OUT] �ϐ��@�F�@ratearray

%inst
���[�t���[�V�����̏����L�[�̐����擾���܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@boneid
�@�@���[�t���[�V�������̊i�[��̃{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_BONENO, basecnt )���w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@���[�t�̃x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_DISPNO, basecnt )���w�肵�Ă��������B

5. [IN] int�@�F�@targetid
�@�@���[�t�̃^�[�Q�b�g�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphTargetInfo�Ŏ擾����targetno( targetcnt )���w�肵�Ă��������B

6. [IN] int�@�F�@arrayleng
�@�@motioninfoptr�̗v�f�����w�肵�Ă��������B
�@�@E3DGetMorphKeyNum�Ŏ擾����keynum����Ȃ��ƃG���[�ɂȂ�܂��B


7. [OUT] �ϐ��@�F�@framenoarray
�@�@�L�[�t���[���̔ԍ����L�[�̐����������܂��B
�@�@E3DGetMorphKeyNum�Ŏ擾�����L�[�̐���keynum�Ƃ����
�@�@dim framenoarray, keynum
�@�@�̂悤�ɔz����쐬���Ă��������B

8. [OUT] �ϐ��@�F�@ratearray
�@�@�����^�̔z��ϐ��B
�@�@���[�t���[�V�����̃u�����h�����L�[�̐����������܂��B
�@�@E3DGetMorphKeyNum�Ŏ擾�����L�[�̐���keynum�Ƃ����
�@�@ddim ratearray, keynum
�@�@�̂悤�ɔz����쐬���Ă��������B




�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DGetCurMorphInfo
�C�ӂ̃t���[���ԍ��̕�ԍς݂̃��[�t���[�V���������擾���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@boneid
p3 : [IN] �ϐ��܂��́A���l�@�F�@baseid
p4 : [IN] �ϐ��܂��́A���l�@�F�@targetid
p5 : [OUT] �ϐ��@�F�@framenoptr
p6 : [OUT] �ϐ��@�F�@rateptr

%inst
�C�ӂ̃t���[���ԍ��̕�ԍς݂̃��[�t���[�V���������擾���܂��B
���̖��߂ł͌��݂̃��[�V����ID�A�t���[���ԍ��ɂ��Ă̏����擾���܂��B
�C�ӂ̃��[�V�����A�t���[���ԍ��̏����擾�������ꍇ��
E3DSetMotionFrameNo�Ƒg�ݍ��킹�Ďg���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@boneid
�@�@���[�t���[�V�������̊i�[��̃{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_BONENO, basecnt )���w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@���[�t�̃x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_DISPNO, basecnt )���w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@targetid
�@�@���[�t�̃^�[�Q�b�g�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphTargetInfo�Ŏ擾����targetno( targetcnt )���w�肵�Ă��������B

5. [OUT] �ϐ��@�F�@framenoptr
�@�@�t���[���ԍ����������܂��B

6. [OUT] �ϐ��@�F�@rateptr
�@�@�����^�̕ϐ�
�@�@�u�����h�����������܂��B




�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DCreateMorph
���[�t���쐬���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@baseid
p3 : [IN] �ϐ��܂��́A���l�@�F�@boneid

%inst
���[�t���쐬���܂��B
�x�[�X��ID�ƃ{�[����ID���w�肵�܂��B
�����Ŏw�肵���{�[���ɍ쐬�������[�t�̃��[�V������񂪊i�[����܂��B

���̖��߂��ĂԂƓǂݍ��ݍς݂̃��[�V�����͑S�Ĕj������܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo_Create.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@�x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetPartNoByName�Ȃǂ�ID���擾���Ďw�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@boneid
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetPartNoByName�Ȃǂ�ID���擾���Ďw�肵�Ă��������B


�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DAddMorphTarget
E3DCreateMorph�ō쐬�������[�t�Ƀ^�[�Q�b�g��ǉ����܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@baseid
p3 : [IN] �ϐ��܂��́A���l�@�F�@targetid

%inst
E3DCreateMorph�ō쐬�������[�t�Ƀ^�[�Q�b�g��ǉ����܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo_Create.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@�x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetPartNoByName�Ȃǂ�ID���擾���Ďw�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@targetid
�@�@�^�[�Q�b�g�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetPartNoByName�Ȃǂ�ID���擾���Ďw�肵�Ă��������B


�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DSetMorphKey
���[�t���[�V�����̃L�[���쐬���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@boneid
p4 : [IN] �ϐ��܂��́A���l�@�F�@baseid
p5 : [IN] �ϐ��܂��́A���l�@�F�@targetid
p6 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p7 : [IN] �ϐ��܂��́A���l�@�F�@rate

%inst
���[�t���[�V�����̃L�[���쐬���܂��B
�L�[�����łɂ���ꍇ�͊����̃L�[�ɏ㏑�����܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo_Create.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@boneid
�@�@���[�t���[�V�������̊i�[��̃{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_BONENO, basecnt )���w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@���[�t�̃x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_DISPNO, basecnt )���w�肵�Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@targetid
�@�@���[�t�̃^�[�Q�b�g�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphTargetInfo�Ŏ擾����targetno( targetcnt )���w�肵�Ă��������B

6. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�L�[�̃t���[���ԍ����w�肵�܂��B

7. [IN] �ϐ��܂��́A���l�@�F�@rate
�@�@�����B
�@�@�L�[�̃u�����h�����w�肵�܂��B



�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DDestroyMorphKey
���[�t���[�V�����̃L�[���폜���܂��B
%group
Easy3D For HSP3 : ���[�t

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@boneid
p4 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p5 : [IN] �ϐ��܂��́A���l�@�F�@baseid

%inst
���[�t���[�V�����̃L�[���폜���܂��B
���[�t�Ɋ܂܂��S�Ẵ^�[�Q�b�g�̃L�[���폜����܂��B

��̓I�Ȏg�p���
e3dhsp3_MorphInfo_Create.hsp���������������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@boneid
�@�@���[�t���[�V�������̊i�[��̃{�[�������ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_BONENO, basecnt )���w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�폜�������L�[�����݂���t���[���ԍ����w�肵�Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@baseid
�@�@���[�t�̃x�[�X�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetMorphBaseInfo�Ŏ擾����baseinfo( MBI_DISPNO, basecnt )���w�肵�Ă��������B



�o�[�W���� : ver5.2.2.3�Œǉ�

%index
E3DGetToon1MaterialNum
�g�D�[���}�e���A���̐����擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [OUT] �ϐ��@�F�@matnum

%inst
�g�D�[���}�e���A���̐����擾���܂��B
�g�D�[���}�e���A���Ƃ͒ʏ�̃}�e���A���Ƃ͈قȂ�܂��B
RokDeBone2�́u�g�D�v�{�^�����������Ƃ��ɏo�Ă���_�C�A���O�ɕ\������Ă���}�e���A���̂��Ƃł��B
�����g�D�[���\���������Ƃ�������Ԃł��̖��߂��ĂԂƁA�}�e���A�����ɂ͂O���Ԃ��Ă��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@matnum
�@�@�g�D�[���}�e���A���̐����������܂��B



�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DGetToon1Material
�g�D�[���}�e���A���̏����p�[�c���ƂɈꊇ�擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [OUT] ������^�z��̕ϐ��@�F�@matname
p4 : [OUT] �z��̕ϐ��@�F�@dinfo
p5 : [OUT] �z��̕ϐ��@�F�@iinfo
p6 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng

%inst
�g�D�[���}�e���A���̏����p�[�c���ƂɈꊇ�擾���܂��B

E3DGetToon1MaterialNum�Ŏ擾�����}�e���A���̐���matnum�Ƃ���ƁA

matname��
sdim matname, 32, matnum
dinfo�i�����f�[�^�j��
ddim dinfo, TMD_MAX, matnum
iinfo�i�����f�[�^�j��
dim iinfo, TMI_MAX,, matnum
�̂悤�ɍ쐬���܂��B

TMD_�ATMI_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B
TMD_DIFFUSE_R�A
TMD_DIFFUSE_G�A
TMD_DIFFUSE_B�̓g�D�[����diffuse�F��RGB

TMD_SPECULAR_R�A
TMD_SPECULAR_G�A
TMD_SPECULAR_B�̓g�D�[����specular�F��RGB

TMD_AMBIENT_R�A
TMD_AMBIENT_G�A
TMD_AMBIENT_B�̓g�D�[����ambient�F��RGB

TMD_DARKNL
TMD_BRIGHTNL�͉A��n�C���C�g�̑傫����臒l�i�ڂ�����E3DSetToon1NL�̐��������ǂ݂��������j

TMD_EDGECOL0_R�A
TMD_EDGECOL0_G�A
TMD_EDGECOL0_B�͗֊s���̐F��RGB

TMD_EDGEWIDTH0�͗֊s���̕�

TMD_MAX��dinfo�̗v�f��
�ւ̃C���f�b�N�X�ł��B


TMI_VALID0�͗֊s���̗L�������̃t���O

TMI_INV0�͗֊s���̔��]�t���O

TMI_MAX��iinfo�̗v�f��
�ւ̃C���f�b�N�X�ł��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [OUT] ������^�z��̕ϐ��@�F�@matname
�@�@�g�D�[���}�e���A���̖��O���������܂��B
�@�@�ڂ����͑O�L���������������B

4. [OUT] �z��̕ϐ��@�F�@dinfo
�@�@�����^�̔z��̕ϐ��B
�@�@�g�D�[���}�e���A���̎�����񂪑������܂��B
�@�@�ڂ����͑O�L���������������B

5. [OUT] �z��̕ϐ��@�F�@iinfo
�@�@�����^�̔z��̕ϐ��B
�@�@�g�D�[���}�e���A���̐�����񂪑������܂��B
�@�@�ڂ����͑O�L���������������B

6. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@toon1ptr���쐬�����Ƃ��̗v�f�����w�肵�܂��B
�@�@E3DGetToon1MaterialNum�Ŏ擾�ł���matnum�ƈقȂ�ƃG���[�ɂȂ�܂��B



�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DSetToon1Name
�g�D�[���}�e���A���̖��O��ύX���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] ������܂��͕�����̕ϐ��@�F�@oldname
p4 : [IN] ������܂��͕�����̕ϐ��@�F�@newname

%inst
�g�D�[���}�e���A���̖��O��ύX���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [IN] ������܂��͕�����̕ϐ��@�F�@oldname
�@�@���O��ς������g�D�[���}�e���A���̌��̖��O

4. [IN] ������܂��͕�����̕ϐ��@�F�@newname
�@�@�g�D�[���}�e���A���̐V�������O�B
�@�@���O�̒����͂R�P�o�C�g�܂łł��B


�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DSetToon1Diffuse
�g�D�[���}�e���A����Diffuse�F��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] ������܂��͕�����̕ϐ��@�F�@matname
p4 : [IN] �z��̕ϐ��@�F�@col

%inst
�g�D�[���}�e���A����Diffuse�F��ݒ肵�܂��B
���C�g�������������邢�����̐F�ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [IN] ������܂��͕�����̕ϐ��@�F�@matname
�@�@�g�D�[���}�e���A���̖��O

4. [IN] �z��̕ϐ��@�F�@col
�@�@�����^�̔z��ϐ��B
�@�@diffuse�F�B
�@�@ddim col, 3�ō쐬���Ă��������B
�@�@col(0)��R�Acol(1)��G�Acol(2)��B�������Z�b�g���Ă���Ăяo���܂��B
�B


�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DSetToon1Specular
�g�D�[���}�e���A����Specular�F��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] ������܂��͕�����̕ϐ��@�F�@matname
p4 : [IN] �z��̕ϐ��@�F�@col

%inst
�g�D�[���}�e���A����Specular�F��ݒ肵�܂��B
�n�C���C�g�̕����̐F�ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [IN] ������܂��͕�����̕ϐ��@�F�@matname
�@�@�g�D�[���}�e���A���̖��O

4. [IN] �z��̕ϐ��@�F�@col
�@�@�����^�̔z��ϐ��B
�@�@specular�F�B
�@�@ddim col, 3�ō쐬���Ă��������B
�@�@col(0)��R�Acol(1)��G�Acol(2)��B�������Z�b�g���Ă���Ăяo���܂��B
�B


�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DSetToon1Ambient
�g�D�[���}�e���A����Ambient�F��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] ������܂��͕�����̕ϐ��@�F�@matname
p4 : [IN] �z��̕ϐ��@�F�@col

%inst
�g�D�[���}�e���A����Ambient�F��ݒ肵�܂��B
���C�g��������Ȃ��Â������̐F�ł��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [IN] ������܂��͕�����̕ϐ��@�F�@matname
�@�@�g�D�[���}�e���A���̖��O

4. [IN] �z��̕ϐ��@�F�@col
�@�@�����^�̔z��ϐ��B
�@�@ambient�F�B
�@�@ddim col, 3�ō쐬���Ă��������B
�@�@col(0)��R�Acol(1)��G�Acol(2)��B�������Z�b�g���Ă���Ăяo���܂��B



�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DSetToon1NL
�g�D�[���\����diffuse, specular, ambient�̊��������߂邽�߂̌W����ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] ������܂��͕�����̕ϐ��@�F�@matname
p4 : [IN] �ϐ��܂��́A���l�@�F�@darknl
p5 : [IN] �ϐ��܂��́A���l�@�F�@brightnl

%inst
�g�D�[���\����diffuse, specular, ambient�̊��������߂邽�߂̌W����ݒ肵�܂��B

�F�̊����͖ʂ̖@���ƃ��C�g�̔��]�x�N�g���Ƃ̂Ȃ��p�x�ideg�j�Ō��肵�܂��B
�Â��F�̊p�x��臒l��darkdeg, �n�C���C�g�̊p�x��臒l��brightdeg�Ƃ��܂��B
deg��darkdeg���傫���p�x�̕����͈Â��F(ambient)�œh��܂��B
deg��brightdeg��菬�����p�x�̏ꍇ�̓n�C���C�g�ispecular�j�œh��܂��B
����ȊO�̕����͖��邢�F(diffuse)�œh��܂��B
darkdeg &gt;= brightdeg�łȂ��Ƃ����܂���B
�s���Ƃ��Ȃ�����RokDeBone2�Łu�g�D�v�{�^����������darkdeg��brightdeg��ݒ肷��X���C�_�[�𓮂����Ă݂ė������Ă��������B

RokDeBone2�����ł͂�����臒l�͊p�x�ł͂Ȃ���cos�̒l�ŕێ����Ă��܂��B
���̂��߂��̖��߂ɓn���l��cos( darkdeg * DEG2PAI )��cos( brightdeg * DEG2PAI )��n���Ă��������B
DEG2PAI�́u�x�v���u���W�A���v�ɕϊ����邽�߂̒萔�ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [IN] ������܂��͕�����̕ϐ��@�F�@matname
�@�@�g�D�[���}�e���A���̖��O

4. [IN] �ϐ��܂��́A���l�@�F�@darknl
�@�@�����B
�@�@cos( darkdeg * DEG2PAI )���w�肵�Ă��������B
�@�@�ڂ����͑O�L���������������B

5. [IN] �ϐ��܂��́A���l�@�F�@brightnl
�@�@�����B
�@�@cos( brightdeg * DEG2PAI )���w�肵�Ă��������B
�@�@�ڂ����͑O�L���������������B



�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DSetToon1Edge0
�g�D�[���}�e���A���̃G�b�W�i�֊s���j�̃p�����[�^��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] ������܂��͕�����̕ϐ��@�F�@matname
p4 : [IN] �ϐ��@�F�@col
p5 : [IN] �ϐ��܂��́A���l�@�F�@validflag
p6 : [IN] �ϐ��܂��́A���l�@�F�@invflag
p7 : [IN] �ϐ��܂��́A���l�@�F�@width

%inst
�g�D�[���}�e���A���̃G�b�W�i�֊s���j�̃p�����[�^��ݒ肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�p�[�c�����ʂ���ԍ����w�肵�Ă��������B
�@�@E3DGetDispObjInfo�Ŏ擾�����\���I�u�W�F�N�g��ID���w�肵�Ă��������B

3. [IN] ������܂��͕�����̕ϐ��@�F�@matname
�@�@�g�D�[���}�e���A���̖��O

4. [IN] �ϐ��@�F�@col
�@�@�֊s���̐F�B
�@�@�����^�̔z��ϐ��B
�@�@ddim col, 3�ō쐬���Ă��������B
�@�@col(0)��R�Acol(1)��G�Acol(2)��B�������Z�b�g���Ă���Ăяo���܂��B

5. [IN] �ϐ��܂��́A���l�@�F�@validflag
�@�@�֊s����\������Ƃ��͂P�B���Ȃ��Ƃ��͂O�B

6. [IN] �ϐ��܂��́A���l�@�F�@invflag
�@�@�֊s���p�̖ʂ̌����𔽓]����Ƃ��͂P�B���Ȃ��Ƃ��͂O�B�ʏ�͂O�B
�@�@���ʃI�u�W�F�N�g�̒����p�B

7. [IN] �ϐ��܂��́A���l�@�F�@width
�@�@�����B
�@�@�֊s���̕��B


�o�[�W���� : ver5.2.2.5�Œǉ�

%index
E3DLoadCameraFile
RokDeBone2�ō쐬�����J�����t�@�C���i*.cam�j��ǂݍ���
�A�j���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p2 : [OUT] �ϐ��@�F�@animno

%inst
RokDeBone2�ō쐬�����J�����t�@�C���i*.cam�j��ǂݍ���
�A�j���ԍ����擾���܂��B



������
1. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@�J�����t�@�C���̃t�@�C�������t���p�X�Ŏw�肵�Ă��������B

2. [OUT] �ϐ��@�F�@animno
�@�@�ǂݍ��񂾃A�j�������ʂ���A�j���ԍ����������܂��B





�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DDestroyCameraAnim
�J�����A�j����j�����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
�J�����A�j����j�����܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSaveCameraFile
�J�����A�j�����e�L�X�g�t�@�C���ɕۑ����܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
�J�����A�j�����e�L�X�g�t�@�C���ɕۑ����܂��B


������
1. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@�J�����t�@�C���̃t�@�C�������t���p�X�Ŏw�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetCameraAnimNo
�J�����g�̃J�����A�j���ԍ����Z�b�g���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
�J�����g�̃J�����A�j���ԍ����Z�b�g���܂��B
�t���[���ԍ��͂O�ɖ߂�܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraAnimNo
�J�����g�̃J�����A�j���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [OUT] �ϐ��@�F�@animno

%inst
�J�����g�̃J�����A�j���ԍ����擾���܂��B




������
1. [OUT] �ϐ��@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����������܂��B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetCameraFrameNo
�Đ�����J�����A�j���̃A�j���ԍ��ƃJ�����ԍ��ƃt���[���ԍ���ݒ肵�܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@camerano
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@isfirst

%inst
�Đ�����J�����A�j���̃A�j���ԍ��ƃJ�����ԍ��ƃt���[���ԍ���ݒ肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�܂��i�O����Q�j�B
�@�@�J�����ԍ���-1���w�肷��ƃJ�����̃X�C�b�`�L�[�Ɋ�Â��ăJ������؂�ւ��Đ����܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@isfirst
�@�@���̖��߂��Ă񂾌��E3DSetNewCamera���Ăяo���ꍇ�͂P���A�Ăяo���Ȃ��ꍇ�͂O���w�肵�܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraFrameNo
���ݍĐ����̃J�����A�j���̃A�j���ԍ��A�J�����ԍ��A�t���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [OUT] �ϐ��@�F�@animno
p2 : [OUT] �ϐ��@�F�@camerano
p3 : [OUT] �ϐ��@�F�@frameno

%inst
���ݍĐ����̃J�����A�j���̃A�j���ԍ��A�J�����ԍ��A�t���[���ԍ����擾���܂��B


������
1. [OUT] �ϐ��@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����������܂��B

2. [OUT] �ϐ��@�F�@camerano
�@�@�J�����ԍ����������܂��B

3. [OUT] �ϐ��@�F�@frameno
�@�@�t���[���ԍ����������܂��B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetNewCamera
�J�����̃t���[�����A�j���^�C�v�ɏ]���Đi�߁A�V�����J���������Z�b�g���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@camerano

%inst
�J�����̃t���[�����A�j���^�C�v�ɏ]���Đi�߁A�V�����J���������Z�b�g���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�܂��i�O����Q�j�B
�@�@�J�����ԍ���-1���w�肷��ƃJ�����̃X�C�b�`�L�[�Ɋ�Â��ăJ������؂�ւ��Đ����܂��B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetNextCameraAnimFrameNo
animno�Ŏ��ʂ����A�j����befframeno�̃t���[���ԍ��ɒB������nextanimno�Ŏ��ʂ����A�j����nextframeno�ɐ؂�ւ��邱�Ƃ�\�񂵂܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@nextanimno
p3 : [IN] �ϐ��܂��́A���l�@�F�@nextframeno
p4 : [IN] �ϐ��܂��́A���l�@�F�@befframeno

%inst
animno�Ŏ��ʂ����A�j����befframeno�̃t���[���ԍ��ɒB������nextanimno�Ŏ��ʂ����A�j����nextframeno�ɐ؂�ւ��邱�Ƃ�\�񂵂܂��B
�A�j���̐؂�ւ���E3DSetNewCamera�ōs���܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@nextanimno
�@�@�؂�ւ���̃J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@nextframeno
�@�@�؂�ւ���̃J�����A�j���̃t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@befframeno
�@�@�؂�ւ��O�̃J�����A�j����befframeno�t���[���܂ŒB������A�j���̐؂�ւ����N����܂��B
�@�@-1���w�肵���ꍇ�͐؂�ւ��O�̃A�j�����ŏI�t���[���ɒB�����Ƃ��ɃA�j�����؂�ւ��܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetNextCameraAnimFrameNo
E3DSetNextCameraAnimFrameNo�Őݒ肵�������擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] �ϐ��@�F�@nextanimno
p3 : [OUT] �ϐ��@�F�@nextframeno

%inst
E3DSetNextCameraAnimFrameNo�Őݒ肵�������擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@nextanimno
�@�@�؂�ւ���̃J�����A�j�������ʂ���ԍ����������܂��B

3. [OUT] �ϐ��@�F�@nextframeno
�@�@�؂�ւ���̃J�����A�j���̃t���[���ԍ����������܂��B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DCreateNewCameraAnim
�J�����A�j�����쐬���A�j�������ʂ���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4
p1 : [IN] ������܂��́A������̕ϐ��@�F�@animname
p2 : [IN] �ϐ��܂��́A���l�@�F�@animtype
p3 : [IN] �ϐ��܂��́A���l�@�F�@framenum
p4 : [OUT] �ϐ��@�F�@animno

%inst
�J�����A�j�����쐬���A�j�������ʂ���ԍ����擾���܂��B


������
1. [IN] ������܂��́A������̕ϐ��@�F�@animname
�@�@�A�j���̖��O���w�肵�܂��B
�@�@�Q�T�T�o�C�g�܂łł��B

2. [IN] �ϐ��܂��́A���l�@�F�@animtype
�@�@�A�j���̐U�镑�����w�肵�܂��B
�@�@�P���w�肷��ƃt���[���ԍ��͐i�݂܂���B
�@�@�Q���w�肷��ƍŏI�t���[���ԍ��ɒB�����炻�̏�Ԃ��ێ����܂��B
�@�@�R���w�肷��ƃ��[�v���܂��B
�@�@�S���w�肷��ƃs���|���Đ����܂��B
�@�@�T���w�肷��ƍŏI�t���[���ɒB������RokDeBone2�Ŏw�肵���t���[���ɃW�����v���܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@framenum
�@�@�J�����A�j�����̃t���[�������w�肵�܂��B

4. [OUT] �ϐ��@�F�@animno
�@�@�쐬�����A�j�������ʂ���ԍ����������܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetCameraFrameNum
�J�����A�j���̃t���[������ݒ肵�܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@framenum

%inst
�J�����A�j���̃t���[������ݒ肵�܂��B
���݂̃t���[���������������l���w�肵���ꍇ��
�͈͂���͂ݏo���L�[�͍폜����܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@framenum
�@�@�t���[�������w�肵�Ă��������B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraFrameNum
�J�����A�j���̃t���[�������擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] �ϐ��@�F�@framenum

%inst
�J�����A�j���̃t���[�������擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@framenum
�@�@�t���[�������������܂��B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetCameraAnimName
�J�����A�j���̖��O��ݒ肵�܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] ������܂��́A������̕ϐ��@�F�@srcname

%inst
�J�����A�j���̖��O��ݒ肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ������܂��́A������̕ϐ��@�F�@srcname
�@�@�J�����A�j���̖��O���w�肵�܂��B
�@�@�Q�T�T�o�C�g�܂łł��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraAnimName
�J�����A�j���̖��O���擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] ������̕ϐ��@�F�@dstname
p3 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng

%inst
�J�����A�j���̖��O���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] ������̕ϐ��@�F�@dstname
�@�@���O���i�[���镶����̕ϐ����w�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@dstname�̔z�񒷂��w�肵�܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetCameraAnimType
�J�����A�j���̃^�C�v��ݒ肵�܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@type

%inst
�J�����A�j���̃^�C�v��ݒ肵�܂��B
�^�C�v�̏ڍׂ�E3DCreateNewCameraAnim��animtype�����̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@type
�@�@�^�C�v���w�肵�܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraAnimType
�J�����A�j���̃^�C�v���擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] �ϐ��@�F�@type

%inst
�J�����A�j���̃^�C�v���擾���܂��B
�^�C�v�̏ڍׂ�E3DCreateNewCameraAnim��animtype�����̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@type
�@�@�^�C�v���������܂��B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetCameraKey
�J�����A�j���̃L�[��ݒ肵�܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@camerano
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �z��̕ϐ��@�F�@cami
p5 : [IN] �z��̕ϐ��@�F�@camd

%inst
�J�����A�j���̃L�[��ݒ肵�܂��B
�w�肵���t���[���ԍ��ɃL�[�����݂��Ȃ��ꍇ�͎����I�ɍ쐬���Ă���ݒ肵�܂��B

cami��dim cami, CAMI_MAX�ō쐬���܂��B
CAMI_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

CAMI_LOOKTYPE�͒������[�h�ւ̃C���f�b�N�X�ł��B
���ݒ����Ȃ����[�h�����T�|�[�g���Ă��܂���̂�
CAML_NORMAL���w�肵�Ă��������B

CAMI_HSID��CAMI_BONENO�͏����̊g���p�̃C���f�b�N�X�ł��B
-1���w�肵�Ă��������B



CAMI_INTERP�̓L�[�Ԃ̕�ԕ��@�ւ̃C���f�b�N�X�ł��B
�O���w�肷��Ɛ��`�A�P���w�肷��ƃX�v���C����ԂɂȂ�܂��B

���ꂼ��̒l�ɂ�
cami( CAMI_LOOKTYPE ) �Ȃǂ̂悤�ɂ��ăA�N�Z�X���Ă��������B


camd��ddim camd, CAMD_MAX�ō쐬���܂��B
dim�ł͂Ȃ���ddim�i�����j�ł��B

CAMD_POSX
CAMD_POSY
CAMD_POSZ
�̓J�����ʒu��XYZ���W�ւ̃C���f�b�N�X�ł��B

CAMD_TARX
CAMD_TARY
CAMD_TARZ
�̓J�����̒����_��XYZ���W�ւ̃C���f�b�N�X�ł��B

CAMD_UPX
CAMD_UPY
CAMD_UPZ
�̓J�����̏�����x�N�g����XYZ�����ւ̃C���f�b�N�X�ł��B

CAMD_DIST
�̓J�����ƒ����_�̋����ւ̃C���f�b�N�X�ł��B

CAMD_NEARZ
CAMD_FARZ
�̓v���W�F�N�V�����̈�ԋ߂������ƈ�ԉ��������ւ̃C���f�b�N�X�ł��B

CAMD_FOV
�̓v���W�F�N�V�����̎���p�ւ̃C���f�b�N�X�ł��B

CAMD_ORTHOSIZE
�͏����̊g���p�̃C���f�b�N�X�ł��B3000.0�Ȃǂ̐��l�����Ă����Ă��������B

���ꂼ��̒l�ɂ�camd( CAMD_POSX )�Ȃǂ̂悤�ɂ��ăA�N�Z�X���Ă��������B


��̓I�Ȏg�p���
e3dhsp3_CameraAnime.hsp���������������B

ver5.2.2.8�Ő��ˉe�ɑΉ����܂����B
CAMI_ORTHO�̓p�[�X�\���̂Ƃ��O�A���ˉe�\���̂Ƃ��P���w�肵�܂��B

CAMD_ORTHOSIZE�͐��ˉe�̂Ƃ��̃r���[�̃T�C�Y���w�肵�܂��B






������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �z��̕ϐ��@�F�@cami
�@�@�J�����L�[�̐��������o���Z�b�g���܂��B
�@�@�ڂ����͑O�L���������������B

5. [IN] �z��̕ϐ��@�F�@camd
�@�@�����^�̔z��̕ϐ��B
�@�@�J�����L�[�̎��������o���Z�b�g���܂��B
�@�@�ڂ����͑O�L���������������B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraKey
�J�����A�j���̃L�[�̏����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@camerano
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [OUT] �z��̕ϐ��@�F�@cami
p5 : [OUT] �z��̕ϐ��@�F�@camd
p6 : [OUT] �ϐ��@�F�@exsitflag

%inst
�J�����A�j���̃L�[�̏����擾���܂��B
�w�肵���t���[���ԍ��ɃL�[�������ꍇ�͕�Ԍv�Z���ď����擾���܂��B

cami, camd�ɂ��Ă�E3DSetCameraKey�̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

4. [OUT] �z��̕ϐ��@�F�@cami
�@�@�J�����L�[�̐��������o���������܂��B

5. [OUT] �z��̕ϐ��@�F�@camd
�@�@�����^�̔z��̕ϐ��B
�@�@�J�����L�[�̎��������o���������܂��B

6. [OUT] �ϐ��@�F�@exsitflag
�@�@�w�肵���t���[���ԍ��ɃL�[���������ꍇ�͂P��
�@�@���������ꍇ�ɂ͂O���������܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DDeleteCameraKey
�J�����A�j���̃L�[���폜���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@camerano
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno

%inst
�J�����A�j���̃L�[���폜���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraKeyframeNoRange
start��end�Ŏw�肵���t���[���͈͂̃L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@camerano
p3 : [IN] �ϐ��܂��́A���l�@�F�@start
p4 : [IN] �ϐ��܂��́A���l�@�F�@end
p5 : [OUT] �z��̕ϐ��@�F�@framearray
p6 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng
p7 : [OUT] �ϐ��@�F�@getnum

%inst
start��end�Ŏw�肵���t���[���͈͂̃L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B

arrayleng�ɂO���w�肵�ČĂяo����framearray�����ւ̑�����s�킸�ɃL�[�̌��݂̂��擾���܂��B

E3DGetCameraKeyframeNoRange animno, camno, start, end, dummy, 0, keynum

dim framearray, keynum

E3DGetCameraKeyframeNoRange animno, camno, start, end, framearray, keynum,
chknum

�̂悤�ɂ��Ďg���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@start
4. [IN] �ϐ��܂��́A���l�@�F�@end
�@�@�L�[�𒲂ׂ����t���[���ԍ��̍ŏ��ƍŌ�̒l���w�肵�Ă��������B

5. [OUT] �z��̕ϐ��@�F�@framearray
�@�@�t���[���ԍ���getnum�����������܂��B
�@�@arrayleng���O�̏ꍇ�͑������܂���B

6. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@framearray�̔z�񒷁i�v�f���j���w�肵�Ă��������B
�@�@�O���w�肷��ƃL�[�̌������𒲂ׂ܂��B

7. [OUT] �ϐ��@�F�@getnum
�@�@�擾�����L�[�t���[���ԍ��̌����������܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetCameraSWKey
�J�����A�j���̃X�C�b�`�L�[���Z�b�g���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p3 : [IN] �ϐ��܂��́A���l�@�F�@camerano

%inst
�J�����A�j���̃X�C�b�`�L�[���Z�b�g���܂��B
�w�肵���t���[���ԍ��ɃL�[�����݂��Ȃ��ꍇ�͎����I�ɍ쐬���Ă���Z�b�g���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�Ă��������B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraSWKey
�J�����A�j���̃X�C�b�`�L�[�̏����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p3 : [OUT] �ϐ��@�F�@camerano
p4 : [OUT] �ϐ��@�F�@existflag

%inst
�J�����A�j���̃X�C�b�`�L�[�̏����擾���܂��B
�w�肵���t���[���ԍ��ɃL�[�����݂��Ȃ��ꍇ�͕�Ԃ��ď����擾���܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@camerano
�@�@�J�����ԍ����������܂��B

4. [OUT] �ϐ��@�F�@existflag
�@�@�w�肵���t���[���ԍ��ɃL�[���������ꍇ�͂P��
�@�@���������ꍇ�ɂ͂O���������܂��B




�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DDeleteCameraSWKey
�J�����A�j���̃X�C�b�`�L�[���폜���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@frameno

%inst
�J�����A�j���̃X�C�b�`�L�[���폜���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DGetCameraSWKeyframeNoRange
start��end�Ŏw�肵���t���[���͈͂̃X�C�b�`�L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@start
p3 : [IN] �ϐ��܂��́A���l�@�F�@end
p4 : [OUT] �z��̕ϐ��@�F�@framearray
p5 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng
p6 : [OUT] �ϐ��@�F�@getnum

%inst
start��end�Ŏw�肵���t���[���͈͂̃X�C�b�`�L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B

arrayleng�ɂO���w�肵�ČĂяo����framearray�����ւ̑�����s�킸�ɃL�[�̌��݂̂��擾���܂��B

E3DGetCameraSWKeyframeNoRange animno, start, end, dummy, 0, keynum

dim framearray, keynum

E3DGetCameraSWKeyframeNoRange animno, start, end, framearray, keynum, chknum

�̂悤�ɂ��Ďg���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@start
3. [IN] �ϐ��܂��́A���l�@�F�@end
�@�@�L�[�𒲂ׂ����t���[���ԍ��̍ŏ��ƍŌ�̒l���w�肵�Ă��������B

4. [OUT] �z��̕ϐ��@�F�@framearray
�@�@�t���[���ԍ���getnum�����������܂��B
�@�@arrayleng���O�̏ꍇ�͑������܂���B

5. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@framearray�̔z�񒷁i�v�f���j���w�肵�Ă��������B
�@�@�O���w�肷��ƃL�[�̌������𒲂ׂ܂��B

6. [OUT] �ϐ��@�F�@getnum
�@�@�擾�����L�[�t���[���ԍ��̌����������܂��B



�o�[�W���� : ver5.2.2.7�Œǉ�

%index
E3DSetOrtho
���ˉe���I���ɂ��A���ˉe�̃p�����[�^��ݒ肵�܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@proj_near
p2 : [IN] �ϐ��܂��́A���l�@�F�@proj_far
p3 : [IN] �ϐ��܂��́A���l�@�F�@orthosize

%inst
���ˉe���I���ɂ��A���ˉe�̃p�����[�^��ݒ肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@proj_near
�@�@�N���b�s���O�̍ŏ������B
�@�@�����B

2. [IN] �ϐ��܂��́A���l�@�F�@proj_far
�@�@�N���b�s���O�̍ő勗���B
�@�@�����B

3. [IN] �ϐ��܂��́A���l�@�F�@orthosize
�@�@���ˉe�̃r���[�̑傫���B
�@�@�����B





�o�[�W���� : ver5.2.2.8�Œǉ�

%index
E3DLoadGPFile
RokDeBone2�ō쐬����GPA�t�@�C���i*.gpa�j��ǂݍ��݃A�j���ԍ����擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p3 : [OUT] �ϐ��@�F�@animno�@�@�ǂݍ��񂾃A�j�������ʂ���A�j���ԍ����������܂��B

%inst
RokDeBone2�ō쐬����GPA�t�@�C���i*.gpa�j��ǂݍ��݃A�j���ԍ����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@GP�t�@�C���̃t�@�C�������t���p�X�Ŏw�肵�Ă��������B

3. [OUT] �ϐ��@�F�@animno�@�@�ǂݍ��񂾃A�j�������ʂ���A�j���ԍ����������܂��B





�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DDestroyGPAnim
GP�A�j����j�����܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
GP�A�j����j�����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSaveGPFile
GP�A�j�����e�L�X�g�t�@�C���ɕۑ����܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] ������܂��́A������̕ϐ��@�F�@filename
p3 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
GP�A�j�����e�L�X�g�t�@�C���ɕۑ����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ������܂��́A������̕ϐ��@�F�@filename
�@�@GP�t�@�C���̃t�@�C�������t���p�X�Ŏw�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetGPAnimNo
�J�����g��GP�A�j���ԍ����Z�b�g���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
�J�����g��GP�A�j���ԍ����Z�b�g���܂��B�t���[���ԍ��͂O�ɖ߂�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPAnimNo
�J�����g��GP�A�j���ԍ����擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [OUT] �ϐ��@�F�@animno

%inst
�J�����g��GP�A�j���ԍ����擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����������܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetGPFrameNo
�Đ�����GP�A�j���̃A�j���ԍ��ƃt���[���ԍ���ݒ肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
�Đ�����GP�A�j���̃A�j���ԍ��ƃt���[���ԍ���ݒ肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. 
[IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B
4. [IN] 
�ϐ��܂��́A���l�@�F�@isfirst
�@�@���̖��߂��Ă񂾌��E3DSetNewGP���Ăяo���ꍇ�͂P���A�Ăяo���Ȃ��ꍇ�͂O���w�肵�܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPFrameNo
���ݍĐ�����GP�A�j���̃A�j���ԍ��A�t���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [OUT] �ϐ��@�F�@animno
p3 : [OUT] 

%inst
���ݍĐ�����GP�A�j���̃A�j���ԍ��A�t���[���ԍ����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����������܂��B
3. [OUT] 
�ϐ��@�F�@frameno�@�@�t���[���ԍ����������܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetNewGP
�A�j���̃t���[�����A�j���^�C�v�ɏ]���Đi�߁A�V����GP�����Z�b�g���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

%inst
�A�j���̃t���[�����A�j���^�C�v�ɏ]���Đi�߁A�V����GP�����Z�b�g���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetNextGPAnimFrameNo
animno�Ŏ��ʂ����A�j����befframeno�̃t���[���ԍ��ɒB������nextanimno�Ŏ��ʂ����A�j����nextframeno�ɐ؂�ւ��邱�Ƃ�\�񂵂܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] �ϐ��܂��́A���l�@�F�@nextanimno
p4 : [IN] �ϐ��܂��́A���l�@�F�@nextframeno
p5 : [IN] �ϐ��܂��́A���l�@�F�@befframeno

%inst
animno�Ŏ��ʂ����A�j����befframeno�̃t���[���ԍ��ɒB������nextanimno�Ŏ��ʂ����A�j����nextframeno�ɐ؂�ւ��邱�Ƃ�\�񂵂܂��B�A�j���̐؂�ւ���E3DSetNewCamera�ōs���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@nextanimno
�@�@�؂�ւ����GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@nextframeno
�@�@�؂�ւ����GP�A�j���̃t���[���ԍ����w�肵�Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@befframeno
�@�@�؂�ւ��O��GP�A�j����befframeno�t���[���܂ŒB������A�j���̐؂�ւ����N����܂��B�@�@-1���w�肵���ꍇ�͐؂�ւ��O�̃A�j�����ŏI�t���[���ɒB�����Ƃ��ɃA�j�����؂�ւ��܂��B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetNextGPAnimFrameNo
E3DSetNextGPAnimFrameNo�Őݒ肵�������擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [OUT] �ϐ��@�F�@nextanimno
p4 : [OUT] �ϐ��@�F�@nextframeno

%inst
E3DSetNextGPAnimFrameNo�Őݒ肵�������擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@nextanimno
�@�@�؂�ւ����GP�A�j�������ʂ���ԍ����������܂��B

4. [OUT] �ϐ��@�F�@nextframeno
�@�@�؂�ւ����GP�A�j���̃t���[���ԍ����������܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DCreateNewGPAnim
GP�A�j�����쐬���A�j�������ʂ���ԍ����擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] ������܂��́A������̕ϐ��@�F�@animname�@�@�A�j���̖��O���w�肵�܂��B�@�@�Q�T�T�o�C�g�܂łł��B
p3 : [IN] �ϐ��܂��́A���l�@�F�@animtype�@�@�A�j���̐U�镑�����w�肵�܂��B�@�@�P���w�肷��ƃt���[���ԍ��͐i�݂܂���B�@�@�Q���w�肷��ƍŏI�t���[���ԍ��ɒB�����炻�̏�Ԃ��ێ����܂��B�@�@�R���w�肷��ƃ��[�v���܂��B�@�@�S���w�肷��ƃs���|���Đ����܂��B�@�@�T���w�肷��ƍŏI�t���[���ɒB������RokDeBone2�Ŏw�肵���t���[���ɃW�����v���܂��B
p4 : [IN] �ϐ��܂��́A���l�@�F�@framenum�@�@�J�����A�j�����̃t���[�������w�肵�܂��B
p5 : [OUT] �ϐ��@�F�@animno�@�@�쐬�����A�j�������ʂ���ԍ����������܂��B

%inst
GP�A�j�����쐬���A�j�������ʂ���ԍ����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ������܂��́A������̕ϐ��@�F�@animname�@�@�A�j���̖��O���w�肵�܂��B�@�@�Q�T�T�o�C�g�܂łł��B

3. [IN] �ϐ��܂��́A���l�@�F�@animtype�@�@�A�j���̐U�镑�����w�肵�܂��B�@�@�P���w�肷��ƃt���[���ԍ��͐i�݂܂���B�@�@�Q���w�肷��ƍŏI�t���[���ԍ��ɒB�����炻�̏�Ԃ��ێ����܂��B�@�@�R���w�肷��ƃ��[�v���܂��B�@�@�S���w�肷��ƃs���|���Đ����܂��B�@�@�T���w�肷��ƍŏI�t���[���ɒB������RokDeBone2�Ŏw�肵���t���[���ɃW�����v���܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@framenum�@�@�J�����A�j�����̃t���[�������w�肵�܂��B

5. [OUT] �ϐ��@�F�@animno�@�@�쐬�����A�j�������ʂ���ԍ����������܂��B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetGPFrameNum
GP�A�j���̃t���[������ݒ肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] �ϐ��܂��́A���l�@�F�@framenum�@�@�t���[�������w�肵�Ă��������B

%inst
GP�A�j���̃t���[������ݒ肵�܂��B���݂̃t���[���������������l���w�肵���ꍇ�͔͈͂���͂ݏo���L�[�͍폜����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@framenum�@�@�t���[�������w�肵�Ă��������B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPFrameNum
GP�A�j���̃t���[�������擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [OUT] �ϐ��@�F�@framenum�@�@�t���[�������������܂��B

%inst
GP�A�j���̃t���[�������擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@framenum�@�@�t���[�������������܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetGPAnimName
GP�A�j���̖��O��ݒ肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] ������܂��́A������̕ϐ��@�F�@srcname

%inst
GP�A�j���̖��O��ݒ肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] ������܂��́A������̕ϐ��@�F�@srcname
�@�@GP�A�j���̖��O���w�肵�܂��B�@�@�Q�T�T�o�C�g�܂łł��B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPAnimName
GP�A�j���̖��O���擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [OUT] ������̕ϐ��@�F�@dstname�@�@���O���i�[���镶����̕ϐ����w�肵�܂��B
p4 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng�@�@dstname�̔z�񒷂��w�肵�܂��B

%inst
GP�A�j���̖��O���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [OUT] ������̕ϐ��@�F�@dstname�@�@���O���i�[���镶����̕ϐ����w�肵�܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@arrayleng�@�@dstname�̔z�񒷂��w�肵�܂��B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetGPAnimType
GP�A�j���̃^�C�v��ݒ肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] �ϐ��܂��́A���l�@�F�@type�@�@�^�C�v���w�肵�܂��B

%inst
GP�A�j���̃^�C�v��ݒ肵�܂��B
�^�C�v�̏ڍׂ�E3DCreateNewGPAnim��animtype�����̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@type�@�@�^�C�v���w�肵�܂��B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPAnimType
GP�A�j���̃^�C�v���擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [OUT] �ϐ��@�F�@type�@�@�^�C�v���������܂��B

%inst
GP�A�j���̃^�C�v���擾���܂��B
�^�C�v�̏ڍׂ�E3DCreateNewGPAnim��animtype�����̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@type�@�@�^�C�v���������܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetGPKey
GP�A�j���̃L�[��ݒ肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] 
p4 : [IN] �z��̕ϐ��@�F�@gpi
p5 : [IN] �z��̕ϐ��@�F�@gpd�@�@�����^�̔z��̕ϐ��B

%inst
GP�A�j���̃L�[��ݒ肵�܂��B�w�肵���t���[���ԍ��ɃL�[�����݂��Ȃ��ꍇ�͎����I�ɍ쐬���Ă���ݒ肵�܂��B

gpi��dim gpi, GPI_MAX�ō쐬���܂��B
GPI_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

GPI_ONGMODE��
�ڒn���[�h�ł��BGROUND_NONE���w�肵���Ƃ��͐ڒn�Ȃ��BGROUND_ONE���w�肵���Ƃ��̓L�[�̏u�Ԃ����ڒn�BGROUND_ON���w�肵���ꍇ�͎��̃L�[�܂ł̊Ԑڒn���܂��B
GROUND_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

GPI_INTERP�̓L�[�Ԃ̕�ԕ��@�ւ̃C���f�b�N�X�ł��B�O���w�肷��Ɛ��`�A�P���w�肷��ƃX�v���C����ԂɂȂ�܂��B
���ꂼ��̒l�ɂ�
gpi( GPI_ONGMODE ) �Ȃǂ̂悤�ɂ��ăA�N�Z�X���Ă��������B


gpd��ddim gpd, GPD_MAX�ō쐬���܂��B
dim�ł͂Ȃ���ddim�ł��B
GPD_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

GPD_POSX
GPD_POSY
GPD_POSZ
�̓L�����N�^�[�̈ʒu���W�ł��B

GPD_ROTX
GPD_ROTY
GPD_ROTZ
�̓L�����N�^�[�̉�]�p�x�ł��B
Z,X,Y�̏��Ԃɉ�]���܂��B

GPD_RAYY��
�ڒn�p�̃��C�̎n�_��Y���W�ł��B

GPD_RAYLENG��
�ڒn�p�̃��C�̒����ł��B

GPD_OFFSETY��
�ڒn�p�̒n�ʂ���̍����ł��B

���ꂼ��̒l�ɂ�gpd( GPD_POSX )�Ȃǂ̂悤�ɂ��ăA�N�Z�X���Ă��������B


E3DSetGPKey���Ăяo���Ă��Đ��p�̃f�[�^�ɂ͔��f����܂���B�Đ��p�̃f�[�^�ɔ��f�������ꍇ��E3DCalcGPFullFrame���Ăяo���Ă��������B
E3DCalcGPFullFrame�͏d�������ł��̂őS�Ă�E3DSetGPKey���I����Ă���Ō�ɂP�x�����Ăяo���悤�ɂ���Ɨǂ��ł��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �z��̕ϐ��@�F�@gpi
�@�@GP�L�[�̐��������o���Z�b�g���܂��B�@�@�ڂ����͑O�L���������������B

5. [IN] �z��̕ϐ��@�F�@gpd�@�@�����^�̔z��̕ϐ��B
�@�@GP�L�[�̎��������o���Z�b�g���܂��B�@�@�ڂ����͑O�L���������������B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPKey
GP�A�j���̃L�[�̏����擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] 
p4 : [OUT] �z��̕ϐ��@�F�@gpi
p5 : [OUT] �z��̕ϐ��@�F�@gpd�@�@�����^�̔z��̕ϐ��B
p6 : [OUT] 

%inst
GP�A�j���̃L�[�̏����擾���܂��B�w�肵���t���[���ԍ��ɃL�[�������ꍇ�͕�Ԍv�Z���ď����擾���܂��B

gpi, gpd�ɂ��Ă�E3DSetGPKey�̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B

4. [OUT] �z��̕ϐ��@�F�@gpi
�@�@GP�L�[�̐��������o���������܂��B

5. [OUT] �z��̕ϐ��@�F�@gpd�@�@�����^�̔z��̕ϐ��B
�@�@GP�L�[�̎��������o���������܂��B
6. [OUT] 
�ϐ��@�F�@exsitflag�@�@�w�肵���t���[���ԍ��ɃL�[���������ꍇ�͂P���@�@���������ꍇ�ɂ͂O���������܂��B




�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DDeleteGPKey
GP�A�j���̃L�[���폜���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B
p3 : [IN] 

%inst
GP�A�j���̃L�[���폜���܂��B

E3DDeleteGPKey���Ăяo���Ă��Đ��p�̃f�[�^�ɂ͔��f����܂���B�Đ��p�̃f�[�^�ɔ��f�������ꍇ��E3DCalcGPFullFrame���Ăяo���Ă��������B
E3DCalcGPFullFrame�͏d�������ł��̂őS�Ă�E3DDeleteGPKey���I����Ă���Ō�ɂP�x�����Ăяo���悤�ɂ���Ɨǂ��ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno�@�@�J�����A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPKeyframeNoRange
start��end�Ŏw�肵���t���[���͈͂̃L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] �ϐ��܂��́A���l�@�F�@start4. 

%inst
start��end�Ŏw�肵���t���[���͈͂̃L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B
arrayleng�ɂO���w�肵�ČĂяo����framearray�����ւ̑�����s�킸�ɃL�[�̌��݂̂��擾���܂��B

E3DGeGPKeyframeNoRange animno, start, end, dummy, 0, keynum
dim framearray, 
keynum

E3DGetGPKeyframeNoRange animno, start, end, framearray, keynum, chknum
�̂悤�ɂ��Ďg���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] �ϐ��܂��́A���l�@�F�@start4. 
[IN] �ϐ��܂��́A���l�@�F�@end�@�@�L�[�𒲂ׂ����t���[���ԍ��̍ŏ��ƍŌ�̒l���w�肵�Ă��������B
5. [OUT] 
�z��̕ϐ��@�F�@framearray�@�@�t���[���ԍ���getnum�����������܂��B�@�@arrayleng���O�̏ꍇ�͑������܂���B
6. 
[IN] 
�ϐ��܂��́A���l�@�F�@arrayleng�@�@framearray�̔z�񒷁i�v�f���j���w�肵�Ă��������B�@�@�O���w�肷��ƃL�[�̌������𒲂ׂ܂��B
7. 
[OUT] �ϐ��@�F�@getnum�@�@�擾�����L�[�t���[���ԍ��̌����������܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DCalcGPFullFrame
GP�A�j���̃L�[��񂩂�S�Ẵt���[���̎p�������v�Z���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
GP�A�j���̃L�[��񂩂�S�Ẵt���[���̎p�������v�Z���܂��B
���̌��ʂ�GP�A�j���̍Đ���E3DGetGPKey�ȂǂɎg���܂��B

�d�������ł��̂łȂ�ׂ��Ăяo���񐔂͏��Ȃ����Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B


�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DSetGPGroundHSID
GP�A�j���̐ڒn�p�̒n�ʂ�HSID���w�肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] �ϐ��܂��́A���l�@�F�@ghsid

%inst
GP�A�j���̐ڒn�p�̒n�ʂ�HSID���w�肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@ghsid
�@�@�ڒn�p�̒n�ʂ̃��f���f�[�^�����ʂ���ID�B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DGetGPGroundHSID
GP�A�j���̐ڒn�p�̒n�ʂ�HSID���擾���܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [OUT] �ϐ��@�F�@ghsid

%inst
GP�A�j���̐ڒn�p�̒n�ʂ�HSID���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [OUT] �ϐ��@�F�@ghsid
�@�@�ڒn�p�̒n�ʂ̃��f���f�[�^�����ʂ���ID���������܂��B



�o�[�W���� : ver5.2.2.9�Œǉ�

%index
E3DLoadMOEFile
RokDeBone2�ō쐬����MOE�t�@�C���i*.moe�j��ǂݍ��݃A�j���ԍ����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [OUT] 

%inst
RokDeBone2�ō쐬����MOE�t�@�C���i*.moe�j��ǂݍ��݃A�j���ԍ����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
������܂��́A������̕ϐ��@�F�@filename
�@�@MOE�t�@�C���̃t�@�C�������t���p�X�Ŏw�肵�Ă��������B
3. [OUT] 
�ϐ��@�F�@animno�@�@�ǂݍ��񂾃A�j�������ʂ���A�j���ԍ����������܂��B




�o�[�W���� : ver5.2.3.1

%index
E3DDestroyMOEAnim
MOE�A�j����j�����܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 

%inst
MOE�A�j����j�����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.3.1

%index
E3DSaveMOEFile
MOE�A�j�����e�L�X�g�t�@�C���ɕۑ����܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 

%inst
MOE�A�j�����e�L�X�g�t�@�C���ɕۑ����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
������܂��́A������̕ϐ��@�F�@filename
�@�@MOE�t�@�C���̃t�@�C�������t���p�X�Ŏw�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B




�o�[�W���� : ver5.2.3.1

%index
E3DSetMOEAnimNo
�J�����g��MOE�A�j���ԍ����Z�b�g���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 

%inst
�J�����g��MOE�A�j���ԍ����Z�b�g���܂��B�t���[���ԍ��͂O�ɖ߂�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B


�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEAnimNo
�J�����g��GP�A�j���ԍ����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [OUT] 

%inst
�J�����g��GP�A�j���ԍ����擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [OUT] 
�ϐ��@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����������܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DSetMOEFrameNo
�Đ�����MOE�A�j���̃A�j���ԍ��ƃt���[���ԍ���ݒ肵�܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 
p4 : [IN] 

%inst
�Đ�����MOE�A�j���̃A�j���ԍ��ƃt���[���ԍ���ݒ肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B
4. [IN] 
�ϐ��܂��́A���l�@�F�@isfirst
�@�@���̖��߂��Ă񂾌��E3DSetNewMOE���Ăяo���ꍇ�͂P���A�Ăяo���Ȃ��ꍇ�͂O���w�肵�܂��B


�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEFrameNo
���ݍĐ�����MOE�A�j���̃A�j���ԍ��A�t���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [OUT] 
p3 : [OUT] 

%inst
���ݍĐ�����MOE�A�j���̃A�j���ԍ��A�t���[���ԍ����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [OUT] 
�ϐ��@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����������܂��B
3. [OUT] 
�ϐ��@�F�@frameno�@�@�t���[���ԍ����������܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DSetNewMOE
�A�j���̃t���[�����A�j���^�C�v�ɏ]���Đi�߁A�V����MOE�����Z�b�g���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

%inst
�A�j���̃t���[�����A�j���^�C�v�ɏ]���Đi�߁A�V����MOE�����Z�b�g���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

�o�[�W���� : ver5.2.3.1

%index
E3DSetNextMOEAnimFrameNo
animno�Ŏ��ʂ����A�j����befframeno�̃t���[���ԍ��ɒB������nextanimno�Ŏ��ʂ����A�j����nextframeno�ɐ؂�ւ��邱�Ƃ�\�񂵂܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 
p4 : [IN] 
p5 : [IN] 

%inst
animno�Ŏ��ʂ����A�j����befframeno�̃t���[���ԍ��ɒB������nextanimno�Ŏ��ʂ����A�j����nextframeno�ɐ؂�ւ��邱�Ƃ�\�񂵂܂��B
�A�j���̐؂�ւ���E3DSetNewMOE�ōs���܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@nextanimno
�@�@�؂�ւ����MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
4. [IN] 
�ϐ��܂��́A���l�@�F�@nextframeno
�@�@�؂�ւ����MOE�A�j���̃t���[���ԍ����w�肵�Ă��������B
5. [IN] 
�ϐ��܂��́A���l�@�F�@befframeno
�@�@�؂�ւ��O��MOE�A�j����befframeno�t���[���܂ŒB������A�j���̐؂�ւ����N����܂��B�@�@-1���w�肵���ꍇ�͐؂�ւ��O�̃A�j�����ŏI�t���[���ɒB�����Ƃ��ɃA�j�����؂�ւ��܂��B




�o�[�W���� : ver5.2.3.1

%index
E3DGetNextMOEAnimFrameNo
E3DSetNextMOEAnimFrameNo�Őݒ肵�������擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [OUT] 
p4 : [OUT] 

%inst
E3DSetNextMOEAnimFrameNo�Őݒ肵�������擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [OUT] 
�ϐ��@�F�@nextanimno
�@�@�؂�ւ����MOE�A�j�������ʂ���ԍ����������܂��B
4. [OUT] 
�ϐ��@�F�@nextframeno
�@�@�؂�ւ����MOE�A�j���̃t���[���ԍ����������܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DCreateNewMOEAnim
MOE�A�j�����쐬���A�j�������ʂ���ԍ����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 

%inst
MOE�A�j�����쐬���A�j�������ʂ���ԍ����擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
������܂��́A������̕ϐ��@�F�@animname�@�@�A�j���̖��O���w�肵�܂��B�@�@�Q�T�T�o�C�g�܂łł��B
3. [IN] 
�ϐ��܂��́A���l�@�F�@animtype�@�@�A�j���̐U�镑�����w�肵�܂��B�@�@�P���w�肷��ƃt���[���ԍ��͐i�݂܂���B�@�@�Q���w�肷��ƍŏI�t���[���ԍ��ɒB�����炻�̏�Ԃ��ێ����܂��B�@�@�R���w�肷��ƃ��[�v���܂��B�@�@�S���w�肷��ƃs���|���Đ����܂��B�@�@�T���w�肷��ƍŏI�t���[���ɒB������RokDeBone2�Ŏw�肵���t���[���ɃW�����v���܂��B
4. 
[IN] �ϐ��܂��́A���l�@�F�@framenum
�@�@MOE�A�j�����̃t���[�������w�肵�܂��B
5. [OUT] 
�ϐ��@�F�@animno�@�@�쐬�����A�j�������ʂ���ԍ����������܂��B

�o�[�W���� : ver5.2.3.1

%index
E3DSetMOEFrameNum
MOE�A�j���̃t���[������ݒ肵�܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 

%inst
MOE�A�j���̃t���[������ݒ肵�܂��B���݂̃t���[���������������l���w�肵���ꍇ�͔͈͂���͂ݏo���L�[�͍폜����܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno�@�@GP�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@framenum�@�@�t���[�������w�肵�Ă��������B




�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEFrameNum
MOE�A�j���̃t���[�������擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [OUT] 

%inst
MOE�A�j���̃t���[�������擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [OUT] 
�ϐ��@�F�@framenum�@�@�t���[�������������܂��B

�o�[�W���� : ver5.2.3.1

%index
E3DSetMOEAnimName
MOE�A�j���̖��O��ݒ肵�܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 

%inst
MOE�A�j���̖��O��ݒ肵�܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
������܂��́A������̕ϐ��@�F�@srcname
�@�@MOE�A�j���̖��O���w�肵�܂��B�@�@�Q�T�T�o�C�g�܂łł��B




�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEAnimName
MOE�A�j���̖��O���擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [OUT] 
p4 : [IN] 

%inst
MOE�A�j���̖��O���擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [OUT] 
������̕ϐ��@�F�@dstname�@�@���O���i�[���镶����̕ϐ����w�肵�܂��B
4. [IN] 
�ϐ��܂��́A���l�@�F�@arrayleng�@�@dstname�̔z�񒷂��w�肵�܂��B




�o�[�W���� : ver5.2.3.1

%index
E3DSetMOEAnimType
MOE�A�j���̃^�C�v��ݒ肵�܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 

%inst
MOE�A�j���̃^�C�v��ݒ肵�܂��B
�^�C�v�̏ڍׂ�E3DCreateNewMOEAnim��animtype�����̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@type�@�@�^�C�v���w�肵�܂��B




�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEAnimType
MOE�A�j���̃^�C�v���擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [OUT] 

%inst
MOE�A�j���̃^�C�v���擾���܂��B
�^�C�v�̏ڍׂ�E3DCreateNewMOEAnim��animtype�����̐������������������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [OUT] 
�ϐ��@�F�@type�@�@�^�C�v���������܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEKeyframeNoRange
start��end�Ŏw�肵���t���[���͈͂̃L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 
p4 : [IN] 
p5 : [OUT] 

%inst
start��end�Ŏw�肵���t���[���͈͂̃L�[�t���[���̌��ƃt���[���ԍ����擾���܂��B
arrayleng�ɂO���w�肵�ČĂяo����framearray�����ւ̑�����s�킸�ɃL�[�̌��݂̂��擾���܂��B

E3DGeMOEKeyframeNoRange animno, start, end, dummy, 0, keynum
dim framearray, 
keynum

E3DGetMOEKeyframeNoRange animno, start, end, framearray, keynum, chknum
�̂悤�ɂ��Ďg���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@start4. [IN] 
�ϐ��܂��́A���l�@�F�@end�@�@�L�[�𒲂ׂ����t���[���ԍ��̍ŏ��ƍŌ�̒l���w�肵�Ă��������B
5. [OUT] 
�z��̕ϐ��@�F�@framearray�@�@�t���[���ԍ���getnum�����������܂��B�@�@arrayleng���O�̏ꍇ�͑������܂���B
6. 
[IN] 
�ϐ��܂��́A���l�@�F�@arrayleng�@�@framearray�̔z�񒷁i�v�f���j���w�肵�Ă��������B�@�@�O���w�肷��ƃL�[�̌������𒲂ׂ܂��B
7. 
[OUT] �ϐ��@�F�@getnum�@�@�擾�����L�[�t���[���ԍ��̌����������܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEElemNum
MOE�A�j���̃L�[�Ɋ܂܂��MOEELEM�̐����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B
p4 : [OUT] �ϐ��@�F�@moeenumptr�@�@�L�[�Ɋ܂܂��MOEELEM�̐����������܂��B
p5 : [OUT] �ϐ��@�F�@existkeyptr�@�@�w�肵���t���[���ɃL�[�����݂���Ƃ��͂P�A���Ȃ��Ƃ��͂O���������܂��B

%inst
MOE�A�j���̃L�[�Ɋ܂܂��MOEELEM�̐����擾���܂��B
MOEELEM��eventno, listnum, list, notlistnum, notlist���琬��܂��B
�ڂ�����RokDeBone2�̃}�j���A���́umoa�C�x���g�A�j���Ƃ́v�̃y�[�W���������������B
�L�[�ɂ�MOEELEM������MOEELEM�ƃA�C�h�����O���[�V�������܂܂�Ă��܂��BMOEELEM���O�ŃA�C�h�����O���[�V���������̃L�[�����݂���̂Œ��ӂ��Ă��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B

4. [OUT] �ϐ��@�F�@moeenumptr�@�@�L�[�Ɋ܂܂��MOEELEM�̐����������܂��B

5. [OUT] �ϐ��@�F�@existkeyptr�@�@�w�肵���t���[���ɃL�[�����݂���Ƃ��͂P�A���Ȃ��Ƃ��͂O���������܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEElem
�L�[�Ɋ܂܂��MOEELEM�̏����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5,p6,p7
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@moeeindex
p5 : [OUT] �z��ϐ��@�F�@moei
p6 : [OUT] �z��ϐ��@�F�@list
p7 : [OUT] �z��ϐ��@�F�@notlist

%inst
�L�[�Ɋ܂܂��MOEELEM�̏����擾���܂��B
MOEELEM��moei, list, notlist�ŕ\�����܂��B
moei��
dim moei, MOEI_MAX
�ō쐬���܂��B
MOEI_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B
MOEI_EVENTNO�̓C�x���g�ԍ��ւ̃C���f�b�N�X�B
MOEI_LISTNUM��list�ɃZ�b�g���ꂽ�v�f�̐��ւ̃C���f�b�N�X�B
MOEI_NOTLISTNUM��notlist�ɃZ�b�g���ꂽ�v�f�̐��ւ̃C���f�b�N�X�B

list, notlist�͂��ꂼ��
dim list, MOELISTLENG
dim notlist, MOELISTLENG
�ō쐬���܂��B
���ꂼ��̈Ӗ����Ă�RokDeBone2�̃}�j���A���́umoa�C�x���g�A�j���Ƃ́v�̃y�[�W���������������B
moeeindex�ɂ�E3DGetMOEElemNum�Ŏ擾����MOEELEM�̌���moeenum�Ƃ���ƁA�O����(moeenum 
- 
1)�܂ł̐����w�肵�Ă��������BMOELEM�̍\���v�f�̐����ɂ��Ă�
RokDeBone2�̃}�j���A���́umoa�C�x���g�A�j���Ƃ́v�̃y�[�W���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@moeeindex
�@�@MOEELEM�̃C���f�b�N�X���w�肵�܂��B
�@�@�O����moeenum - 1�܂ł̐��l���w�肵�܂��B

5. [OUT] �z��ϐ��@�F�@moei
6. [OUT] �z��ϐ��@�F�@list
7. [OUT] �z��ϐ��@�F�@notlist
�@�@MOEELEM�̏�񂪑������܂��B
�@�@�ڂ����͑O�L���������������B




�o�[�W���� : ver5.2.3.1

%index
E3DAddMOEElem
MOE�A�j���̃L�[��MOEELEM��ǉ����܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] int�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c
p2 : [IN] 
p3 : [IN] 
p4 : [IN] �z��ϐ��@�F�@moei
p5 : [IN] �z��ϐ��@�F�@list
p6 : [IN] �z��ϐ��@�F�@notlist

%inst
MOE�A�j���̃L�[��MOEELEM��ǉ����܂��B�w�肵���t���[���ɃL�[�������ꍇ�̓L�[�������I�ɃL�[���쐬�������MOEELEM��ǉ����܂��B

MOEELEM�̕\���̎d���ɂ��Ă�
E3DGetMOEElem�̐������������������B
MOEELEM��list�̍ŏ��̗v�flist[0]�ɂ̂ݕ��̒l-1���w�肷�邱�Ƃ��o���܂��B-1�́u�S�Ẵ{�[���v���Ӗ����܂��B


���̖��߂��Ăяo���Ă��Đ��p�̃f�[�^�ɂ͔��f����܂���B�Đ��p�̃f�[�^�ɔ��f�������ꍇ��E3DCalcMOEFullFrame���Ăяo���Ă��������B
E3DCalcMOEFullFrame�͏d�������ł��̂őS�Ă̕ҏW���߂��I����Ă���Ō�ɂP�x�����Ăяo���悤�ɂ���Ɨǂ��ł��B




������
1. [IN] int�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c
2. [IN] 
int�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
int�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �z��ϐ��@�F�@moei
5. [IN] �z��ϐ��@�F�@list
6. [IN] �z��ϐ��@�F�@notlist
�@�@MOEELEM�̏����w�肵�܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DDeleteMOEElem
MOE�A�j���̃L�[����MOEELEM���폜���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B
p4 : [IN] �ϐ��܂��́A���l�@�F�@moeeindex

%inst
MOE�A�j���̃L�[����MOEELEM���폜���܂��Bmoeeindex��-1���w�肷��ƃL�[���̑S�Ă�MOEELEM���폜���܂��BMOEELEM���O�ɂȂ��Ă��L�[�͍폜����܂���B


���̖��߂��Ăяo���Ă��Đ��p�̃f�[�^�ɂ͔��f����܂���B�Đ��p�̃f�[�^�ɔ��f�������ꍇ��E3DCalcMOEFullFrame���Ăяo���Ă��������B
E3DCalcMOEFullFrame�͏d�������ł��̂őS�Ă̕ҏW���߂��I����Ă���Ō�ɂP�x�����Ăяo���悤�ɂ���Ɨǂ��ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@moeeindex
�@�@�ʏ�0����moeenum - 1�܂ł̐����w�肵�Ă��������B-1���w�肷��ƑS�Ă�MOEELEM���폜���܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DSetMOEKeyIdling
MOE�A�j���̃L�[�̃A�C�h�����O���[�V��������ݒ肵�܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B
p4 : [IN] �ϐ��܂��́A���l�@�F�@motid�@�@�A�C�h�����O���[�V������ID���w�肵�Ă��������B

%inst
MOE�A�j���̃L�[�̃A�C�h�����O���[�V��������ݒ肵�܂��B

���̖��߂��Ăяo���Ă��Đ��p�̃f�[�^�ɂ͔��f����܂���B�Đ��p�̃f�[�^�ɔ��f�������ꍇ��E3DCalcMOEFullFrame���Ăяo���Ă��������B
E3DCalcMOEFullFrame�͏d�������ł��̂őS�Ă̕ҏW���߂��I����Ă���Ō�ɂP�x�����Ăяo���悤�ɂ���Ɨǂ��ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@motid�@�@�A�C�h�����O���[�V������ID���w�肵�Ă��������B



�o�[�W���� : ver5.2.3.1

%index
E3DGetMOEKeyIdling
MOE�A�j���̃L�[�̃A�C�h�����O���[�V���������擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B
p4 : [IN] �ϐ��@�F�@motidptr

%inst
MOE�A�j���̃L�[�̃A�C�h�����O���[�V���������擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@�`��f�[�^�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@animno�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��@�F�@motidptr
�@�@�A�C�h�����O���[�V������ID���������܂��B



�o�[�W���� : ver5.2.3.1

%index
E3DDeleteMOEKey
MOE�A�j���̃L�[���폜���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 
p3 : [IN] 

%inst
MOE�A�j���̃L�[���폜���܂��B

���̖��߂��Ăяo���Ă��Đ��p�̃f�[�^�ɂ͔��f����܂���B�Đ��p�̃f�[�^�ɔ��f�������ꍇ��E3DCalcMOEFullFrame���Ăяo���Ă��������B
E3DCalcMOEFullFrame�͏d�������ł��̂őS�Ă̕ҏW���߂��I����Ă���Ō�ɂP�x�����Ăяo���悤�ɂ���Ɨǂ��ł��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B
3. [IN] 
�ϐ��܂��́A���l�@�F�@frameno�@�@�t���[���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.2.3.1

%index
E3DCalcMOEFullFrame
MOE�A�j���̃L�[��񂩂�S�Ẵt���[���̎p�������v�Z���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] 

%inst
MOE�A�j���̃L�[��񂩂�S�Ẵt���[���̎p�������v�Z���܂��B
���̌��ʂ�MOE�A�j���̍Đ��Ɏg���܂��B
�d�������ł��̂łȂ�ׂ��Ăяo���񐔂͏��Ȃ����Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
2. [IN] 
�ϐ��܂��́A���l�@�F�@animno
�@�@MOE�A�j�������ʂ���ԍ����w�肵�Ă��������B


�o�[�W���� : ver5.2.3.1

%index
E3DUpdateSound
���̍X�V���������܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
�Ȃ�

%inst
���̍X�V���������܂��B
�������̑��d�Đ��̂��߂̏��X�V��RD�T�E���h�p�����[�^�̔��f�Ȃǂ���ȓ���ł��B

���t���[���Ăяo���Ă��������B




������
�Ȃ�

�o�[�W���� : ver5.3.0.0

%index
E3DGetSoundSamplesPlayed
���̌��݂̍Đ��ʒu���擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@smpptr

%inst
���̌��݂̍Đ��ʒu���擾���܂��B
�T���v���i���g���j�P�ʂ̒l�ł��B

�Đ����X�g�b�v����ƂO�ɖ߂�܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@���f�[�^�����ʂ���h�c

2. [OUT] �ϐ��@�F�@smpptr
�@�@�����^�̕ϐ��B
�@�@�Đ��ʒu���������܂��B



�o�[�W���� : ver5.3.0.0

%index
E3DSet3DSoundEmiDist
�RD�T�E���h�̉��̓͂��������w�肵�܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [IN] �ϐ��܂��́A���l�@�F�@dist

%inst
�RD�T�E���h�̉��̓͂��������w�肵�܂��B
E3DUpdateSound�œK�p����܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@���f�[�^�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@dist
�@�@�����B
�@�@���̓͂��ő勗���B




�o�[�W���� : ver5.3.0.3

%index
E3DFadeSound
�t�F�[�h���������܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [IN] �ϐ��܂��́A���l�@�F�@msc
p3 : [IN] �ϐ��܂��́A���l�@�F�@startgain
p4 : [IN] �ϐ��܂��́A���l�@�F�@endgain

%inst
�t�F�[�h���������܂��B
E3DPlaySound������ŌĂт܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@���f�[�^�����ʂ���h�c

2. [IN] �ϐ��܂��́A���l�@�F�@msc
3. [IN] �ϐ��܂��́A���l�@�F�@startgain
4. [IN] �ϐ��܂��́A���l�@�F�@endgain
�@�@msc�~���Z�J���h�̊Ԃɉ��̃Q�C����startgain����endgain�ɕω������܂��B
�@�@gain�͎����B�P�D�O�����{�B




�o�[�W���� : ver5.3.0.5

%index
E3DGlobalToLocalParBone
�O���[�o�����W�n�̍��W�l�ƃN�H�[�^�j�I����
�w�肵���{�[���̐e�̃{�[���̃��[�J�����W�n�ɕϊ����܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p5 : [IN] �ϐ��܂��́A���l�@�F�@flag
p6 : [IN] �ϐ��܂��́A���l�@�F�@srcqid
p7 : [IN][OUT] �ϐ��܂��́A���l�@�F�@dstqid
p8 : [IN] �ϐ��@�F�@srcvecptr
p9 : [OUT] �ϐ��@�F�@dstvecptr

%inst
�O���[�o�����W�n�̍��W�l�ƃN�H�[�^�j�I����
�w�肵���{�[���̐e�̃{�[���̃��[�J�����W�n�ɕϊ����܂��B

�܂�e�̉e�����������l���擾�ł��܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@flag
�@�@�t���O�ɂP���Z�b�g����ƃN�H�[�^�j�I���݂̂�ϊ����܂��B�Q���Z�b�g����ƍ��W�l�݂̂�ϊ����܂��B�R���Z�b�g����ƃN�H�[�^�j�I���ƍ��W�l�̗�����ϊ����܂��B

6. [IN] �ϐ��܂��́A���l�@�F�@srcqid
�@�@�ϊ��O�̏�񂪓����Ă���N�H�[�^�j�I����ID�B

7. [IN][OUT] �ϐ��܂��́A���l�@�F�@dstqid
�@�@�ϊ���̃N�H�[�^�j�I�������i�[����N�H�[�^�j�I����ID�B

�@�@E3DCreateQ�ō쐬�����N�H�[�^�j�I����ID���w�肵�Ă��������B

8. [IN] �ϐ��@�F�@srcvecptr
�@�@�����^�̕ϐ��B
�@�@ddim srcvec, 3�Ŋm�ۂ��Ă��������B
�@�@�ϊ��O�̍��W�l���w�肵�܂��B

9. [OUT] �ϐ��@�F�@dstvecptr
�@�@�����^�̕ϐ��B
�@�@ddim dstvec, 3�Ŋm�ۂ��Ă��������B
�@�@�ϊ���̍��W�l���������܂��B




�o�[�W���� : ver5.3.0.7

%index
E3DLocalToGlobalParBone
���[�J�����W�n�̍��W�l�ƃN�H�[�^�j�I����
�w�肵���{�[���̐e�̃{�[���̉e�����l�������O���[�o�����W�n�ɕϊ����܂��B
%group
Easy3D For HSP3 : �Z�p

%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p5 : [IN] �ϐ��܂��́A���l�@�F�@flag
p6 : [IN] �ϐ��܂��́A���l�@�F�@srcqid
p7 : [IN][OUT] �ϐ��܂��́A���l�@�F�@dstqid
p8 : [IN] �ϐ��@�F�@srcvecptr
p9 : [OUT] �ϐ��@�F�@dstvecptr

%inst
���[�J�����W�n�̍��W�l�ƃN�H�[�^�j�I����
�w�肵���{�[���̐e�̃{�[���̉e�����l�������O���[�o�����W�n�ɕϊ����܂��B

E3DGlobalToLocalParBone�̋t�ϊ��ł��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

5. [IN] �ϐ��܂��́A���l�@�F�@flag
�@�@�t���O�ɂP���Z�b�g����ƃN�H�[�^�j�I���݂̂�ϊ����܂��B�Q���Z�b�g����ƍ��W�l�݂̂�ϊ����܂��B�R���Z�b�g����ƃN�H�[�^�j�I���ƍ��W�l�̗�����ϊ����܂��B

6. [IN] �ϐ��܂��́A���l�@�F�@srcqid
�@�@�ϊ��O�̏�񂪓����Ă���N�H�[�^�j�I����ID�B

7. [IN][OUT] �ϐ��܂��́A���l�@�F�@dstqid
�@�@�ϊ���̃N�H�[�^�j�I�������i�[����N�H�[�^�j�I����ID�B

�@�@E3DCreateQ�ō쐬�����N�H�[�^�j�I����ID���w�肵�Ă��������B

8. [IN] �ϐ��@�F�@srcvecptr
�@�@�����^�̕ϐ��B
�@�@ddim srcvec, 3�Ŋm�ۂ��Ă��������B
�@�@�ϊ��O�̍��W�l���w�肵�܂��B

9. [OUT] �ϐ��@�F�@dstvecptr
�@�@�����^�̕ϐ��B
�@�@ddim dstvec, 3�Ŋm�ۂ��Ă��������B
�@�@�ϊ���̍��W�l���������܂��B




�o�[�W���� : ver5.3.0.7

%index
E3DGetBoneTra
�{�[���̈ړ��������擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p3 : [IN] �ϐ��܂��́A���l�@�F�@motid
p4 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p5 : [OUT] �z��ϐ��@�F�@vec
p6 : [OUT] �ϐ��@�F�@existptr

%inst
�{�[���̈ړ��������擾���܂��B
���[�V�����|�C���g�����݂��Ȃ��ꍇ�͕�Ԍv�Z���ď����擾���܂��B

vec�ɂ�
ddim vec, 3
�ō쐬�����z����w�肵�Ă��������B
vec(0)��X������vec(1)��Y������vec(2)��Z�������������܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

5. [OUT] �z��ϐ��@�F�@vec
�@�@�����^�̔z��B
�@�@�ړ��������������܂��B

6. [OUT] �ϐ��@�F�@existptr
�@�@�w�肵���t���[���Ƀ��[�V�����|�C���g�����݂���ꍇ�͂P���A���Ȃ��ꍇ�͂O���������܂��B



�o�[�W���� : ver5.3.1.4

%index
E3DGetBoneScale
�{�[���̊g��k���������擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p3 : [IN] �ϐ��܂��́A���l�@�F�@motid
p4 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p5 : [OUT] �z��ϐ��@�F�@vec
p6 : [OUT] �ϐ��@�F�@existptr

%inst
�{�[���̊g��k���������擾���܂��B
���[�V�����|�C���g�����݂��Ȃ��ꍇ�͕�Ԍv�Z���ď����擾���܂��B

vec�ɂ�
ddim vec, 3
�ō쐬�����z����w�肵�Ă��������B
vec(0)��X������vec(1)��Y������vec(2)��Z�������������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

5. [OUT] �z��ϐ��@�F�@vec
�@�@�����^�̔z��B
�@�@�g��k���������������܂��B

6. [OUT] �ϐ��@�F�@existptr
�@�@�w�肵���t���[���Ƀ��[�V�����|�C���g�����݂���ꍇ�͂P���A���Ȃ��ꍇ�͂O���������܂��B



�o�[�W���� : ver5.3.1.4

%index
E3DSetBoneTra
�{�[���̈ړ�������ݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p3 : [IN] �ϐ��܂��́A���l�@�F�@motid
p4 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p5 : [IN] �z��ϐ��@�F�@vec

%inst
�{�[���̈ړ�������ݒ肵�܂��B
���[�V�����|�C���g�����݂��Ȃ��ꍇ�̓G���[�ɂȂ�܂��B

vec�ɂ�
ddim vec, 3
�ō쐬�����z����g�p���Ă��������B
vec(0)��X������vec(1)��Y������vec(2)��Z�������Z�b�g���Ă��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

5. [IN] �z��ϐ��@�F�@vec
�@�@�����^�̔z��B
�@�@�ړ��������w�肵�܂��B



�o�[�W���� : ver5.3.1.4

%index
E3DSetBoneScale
�{�[���̊g��k���������擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p3 : [IN] �ϐ��܂��́A���l�@�F�@motid
p4 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p5 : [IN] �z��ϐ��@�F�@vec

%inst
�{�[���̊g��k���������擾���܂��B
���[�V�����|�C���g�����݂��Ȃ��ꍇ�̓G���[�ɂȂ�܂��B

vec�ɂ�
ddim vec, 3
�ō쐬�����z����g�p���Ă��������B
vec(0)��X������vec(1)��Y������vec(2)��Z�������Z�b�g���Ă��������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B

5. [IN] �z��ϐ��@�F�@vec
�@�@�����^�̔z��B
�@�@�g��k���������w�肵�܂��B



�o�[�W���� : ver5.3.1.4

%index
E3DCreateMotionPoint
���[�V�����|�C���g���쐬���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p3 : [IN] �ϐ��܂��́A���l�@�F�@motid
p4 : [IN] �ϐ��܂��́A���l�@�F�@frameno

%inst
���[�V�����|�C���g���쐬���܂��B
�O��̃��[�V�����|�C���g�𒲂ׂĕ�Ԍv�Z�������[�V���������Z�b�g���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�t���[���ԍ����w�肵�Ă��������B



�o�[�W���� : ver5.3.1.4

%index
E3DSet3DSoundDopplerScaler
�h�b�v���[���ʂ̌W����ݒ肵�܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [IN]�ϐ��܂��́A���l�@�F�@srcdp

%inst
�h�b�v���[���ʂ̌W����ݒ肵�܂��B
�l���傫���قǃh�b�v���[���ʂ��傫���Ȃ�܂��B

�h�b�v���[���ʂ͉����⃊�X�i�[�̑��x�ɂ���Đ����܂��B

�����̑��x��
E3DSet3DSoundMovement�Ŏw�肷�鑬�x�ł��B

���X�i�[�̑��x��
E3DSet3DSoundListenerMovement�Ŏw�肵���L�����N�^�[�܂��̓J�����̌��݂̈ʒu����P��O�̌Ăяo�����̈ʒu�����������̂ƂȂ�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ԍ����A�w�肵�܂��B
�@�@-1���w�肷��Ɠǂݍ��ݍς݂̑S�Ẳ��ɑ΂��ď��������܂��B

2. [IN]�ϐ��܂��́A���l�@�F�@srcdp
�@�@�h�b�v���[���ʂ̌W�����w�肵�܂��B
�@�@�O�ȏ�̐��l���w�肵�܂��B
�@�@�����B



�o�[�W���� : ver5.3.2.2

%index
E3DGet3DSoundDopplerScaler
�h�b�v���[���ʂ̌W�����擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@dpptr

%inst
�h�b�v���[���ʂ̌W�����擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ԍ����A�w�肵�܂��B

2. [OUT] �ϐ��@�F�@dpptr
�@�@�����^�̕ϐ��B
�@�@�h�b�v���[���ʂ̌W�����������܂��B



�o�[�W���� : ver5.3.2.2

%index
E3DLoadMQOFileAsChara
mqo�t�@�C�����L�����N�^�[�Ƃ��ēǂݍ��݂܂��B
%group
Easy3D For HSP3 : ���f���f�[�^

%prm
p1,p2,p3,p4,p5
p1 : [IN] ������܂��́A������ϐ��@�F�@filename
p2 : [IN] �ϐ��܂��́A���l�@�F�@mult
p3 : [OUT] �ϐ��@�F�@hsid
p4 : [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
p5 : [IN] ������܂��́A������ϐ��@�F�@bonetype

%inst
mqo�t�@�C�����L�����N�^�[�Ƃ��ēǂݍ��݂܂��B
�c�[���p�̖��߂ł��B
�Q�[���Ȃǂł�RokDeBone2��mqo��ǂݍ���sig�ŕۑ����āAE3DSigLoad�œǂݍ���ł��������B

sig�̓ǂݍ��݂̂ق��������ł��B




������
1. [IN] ������܂��́A������ϐ��@�F�@filename
�@�@�ǂݍ��ށAmqo �t�@�C�����B

2. [IN] �ϐ��܂��́A���l�@�F�@mult
�@�@�`��f�[�^�̍��W�Ɋ|���鐔�l�B
�@�@���W�l�@���@mult �Ōv�Z����܂��B
�@�@���{�͂P�D�O
�@�@�����B

3. [OUT] �ϐ��@�F�@hsid
�@�@�쐬�����L�����N�^�[�����ʂ���hsid���������܂��B

4. [IN] �ϐ��܂��́A���l�@�F�@adjustuvflag
�@�@UV���W�𐳋K���������Ƃ��͂P���A
�@�@�����łȂ��Ƃ��́A�O���w�肵�Ă��������B
�@�@�����w�肵�Ȃ��Ƃ��́A�O�Ƃ��Ĉ����܂��B
�@�@�Q���w�肷���0.0����1.0�̊ԂɃN�����v���܂��B


5. [IN] ������܂��́A������ϐ��@�F�@bonetype
�@�@mqo�Ƀ{�[�����܂܂�Ă���ꍇ��
�@�@�{�[���̃^�C�v���w�肵�܂��B
�@�@BONETYPE_RDB2���w�肷���RokDeBone2�`����
�@�@�������{�[���ƔF������^�C�v�ɂȂ�܂��B
�@�@BONETYPE_MIKO���w�肷���
�@�@mikoto�`���̃^�C�v�ɂȂ�܂��B
�@�@�ȗ������BONETYPE_RDB2�ɂȂ�܂��B
�@�@�����̒萔��e3dhsp3.as�Œ�`����Ă��܂��B




�o�[�W���� : ver5.3.2.2

%index
E3DLoadSSF
���Z�b�g�t�@�C��*.ssf��ǂݍ��݂܂��B
%group
Easy3D For HSP3 : ���Z�b�g

%prm
p1
p1 : [IN] ������܂��͕�����̕ϐ��@�F�@filename

%inst
���Z�b�g�t�@�C��*.ssf��ǂݍ��݂܂��B




������
1. [IN] ������܂��͕�����̕ϐ��@�F�@filename
�@�@ssf�t�@�C���̃p�X���w�肵�܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DDestroyAllSoundSet
�ǂݍ��ݍς݂̑S�Ẳ��Z�b�g��j�����܂��B
%group
Easy3D For HSP3 : ���Z�b�g

%prm
�Ȃ�

%inst
�ǂݍ��ݍς݂̑S�Ẳ��Z�b�g��j�����܂��B




������
�Ȃ�

�o�[�W���� : ver5.3.2.5

%index
E3DGetSoundSetNum
�ǂݍ��ݍς݂̉��Z�b�g�̐����擾���܂��B
%group
Easy3D For HSP3 : ���Z�b�g

%prm
p1
p1 : [OUT] �ϐ��@�F�@numptr

%inst
�ǂݍ��ݍς݂̉��Z�b�g�̐����擾���܂��B




������
1. [OUT] �ϐ��@�F�@numptr
�@�@���Z�b�g�̐����������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DGetSoundSetInfo
���Z�b�g�̏����擾���܂��B
%group
Easy3D For HSP3 : ���Z�b�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@ssindex
p2 : [OUT] ������̕ϐ��@�F�@name
p3 : [OUT] �ϐ��@�F�@setid

%inst
���Z�b�g�̏����擾���܂��B
���Z�b�g���ƂɌĂяo���܂��B
ssindex�ɂ͂O����E3DGetSoundSetNum�Ŏ擾����num - 1�܂ł̐��l���w�肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@ssindex
�@�@���Z�b�g�̃C���f�b�N�X�B
�@�@���Z�b�g��ID�ł͂���܂���B

2. [OUT] ������̕ϐ��@�F�@name
�@�@���Z�b�g�̖��O���������܂��B
�@�@sdim name, 32�ō쐬����������ϐ���n���Ă��������B

3. [OUT] �ϐ��@�F�@setid
�@�@���Z�b�g��ID���������܂��B




�o�[�W���� : ver5.3.2.5

%index
E3DGetSoundSetBGM
���Z�b�g�Ɋ֘A�t�����Ă���BGM�̃T�E���hID���擾���܂��B
%group
Easy3D For HSP3 : ���Z�b�g

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@setid
p2 : [OUT] �ϐ��@�F�@bgmidptr

%inst
���Z�b�g�Ɋ֘A�t�����Ă���BGM�̃T�E���hID���擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@setid
�@�@���Z�b�g��ID���w�肵�܂��B
�@�@���Z�b�g�̃C���f�b�N�X�ł͂���܂���B

2. [OUT] �ϐ��@�F�@bgmidptr
�@�@BGM�̃T�E���hID���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DLoadSAF
���A�j���t�@�C��*.saf��ǂݍ��݃A�j�������ʂ���ID���擾���܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1,p2
p1 : [IN] ������܂��͕�����ϐ��@�F�@filename
p2 : [OUT] �ϐ��@�F�@animnoptr

%inst
���A�j���t�@�C��*.saf��ǂݍ��݃A�j�������ʂ���ID���擾���܂��B




������
1. [IN] ������܂��͕�����ϐ��@�F�@filename
�@�@saf�t�@�C���̃p�X���w�肵�܂��B

2. [OUT] �ϐ��@�F�@animnoptr
�@�@�ǂݍ��񂾃A�j�������ʂ���ID���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DDestroyAllSndAnim
�ǂݍ��ݍς݂̑S�Ẳ��A�j����j�����܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
�Ȃ�

%inst
�ǂݍ��ݍς݂̑S�Ẳ��A�j����j�����܂��B




������
�Ȃ�



�o�[�W���� : ver5.3.2.5

%index
E3DGetSndAnimFrameNum
���A�j���̃t���[�������擾���܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] �ϐ��@�F�@numptr

%inst
���A�j���̃t���[�������擾���܂��B


������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�A�j�������ʂ���ԍ����w�肵�܂��B

2. [OUT] �ϐ��@�F�@numptr
�@�@�A�j���̃t���[�������������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DGetSndAnimBGM
���A�j���Ɋ֘A�t�����Ă���BGM�̃T�E���hID���擾���܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] �ϐ��@�F�@bgmidptr

%inst
���A�j���Ɋ֘A�t�����Ă���BGM�̃T�E���hID���擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�A�j�������ʂ���ԍ����w�肵�܂��B

2. [OUT] �ϐ��@�F�@bgmidptr
�@�@BGM�̃T�E���hID���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DGetSndAnimFPS
���A�j����FPS���擾���܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] �ϐ��@�F�@fpsptr

%inst
���A�j����FPS���擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�A�j�������ʂ���ԍ����w�肵�܂��B

2. [OUT] �ϐ��@�F�@fpsptr
�@�@FPS���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DGetSndAnimMode
���A�j���̌J��Ԃ����[�h���擾���܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [OUT] �ϐ��@�F�@modeptr

%inst
���A�j���̌J��Ԃ����[�h���擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�A�j�������ʂ���ԍ����w�肵�܂��B

2. [OUT] �ϐ��@�F�@modeptr
�@�@�J��Ԃ��Ȃ��̏ꍇ�͂P���J��Ԃ��Đ��̏ꍇ�͂Q�T�T���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DStartSndAnim
���A�j���̍Đ����J�n���܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@startframe

%inst
���A�j���̍Đ����J�n���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�A�j�������ʂ���ԍ����w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@startframe
�@�@�Đ����J�n����ۂ̃X�^�[�g�t���[���ԍ����w�肵�܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DSetSndAnimFrameNo
�Đ����鉹�A�j���̃t���[���ԍ����w�肵�܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno
p2 : [IN] �ϐ��܂��́A���l�@�F�@frameno

%inst
�Đ����鉹�A�j���̃t���[���ԍ����w�肵�܂��B
���̖��߂͉��A�j���Őݒ肳��Ă�����ʉ��p�̂��̂ł��B
BGM�ɂ͉e����^���܂���B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�A�j�������ʂ���ԍ����w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@�Đ�����t���[���ԍ����w�肵�܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DStopSndAnim
���A�j���̍Đ����~���܂��B
%group
Easy3D For HSP3 : ���A�j��

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@animno

%inst
���A�j���̍Đ����~���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@�A�j�������ʂ���ԍ����w�肵�܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DGetSoundTotalTime
���̃g�[�^���^�C�����擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@timeptr

%inst
���̃g�[�^���^�C�����擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ID���w�肵�܂��B

2. [OUT] �ϐ��@�F�@timeptr
�@�@�����^�̕ϐ��B
�@�@�g�[�^���^�C�����������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DConvSoundSampleToFrame
���̃T���v�������t���[���ԍ��ɕϊ����܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [IN] �ϐ��܂��́A���l�@�F�@srcfps
p3 : [IN] �ϐ��܂��́A���l�@�F�@srcsample
p4 : [OUT] �ϐ��@�F�@frameptr

%inst
���̃T���v�������t���[���ԍ��ɕϊ����܂��B
���ݍĐ����̈ʒu�i�T���v�����j��
E3DGetSoundSamplesPlayed�Ŏ擾�ł��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ID���w�肵�܂��B

2. [IN] �ϐ��܂��́A���l�@�F�@srcfps
�@�@���A�j����FPS���w�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@srcsample
�@�@�����B
�@�@�T���v�������w�肵�܂��B

4. [OUT] �ϐ��@�F�@frameptr
�@�@�t���[���ԍ����������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DGetSoundStartCnt
����startcnt���擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@cntptr

%inst
����startcnt���擾���܂��B
startcnt�͂O����n�܂�A���̍Đ������ۂɊJ�n���ꂽ�Ƃ��ɂP�������܂��B
���̍Đ����߂��Ăяo���Ă����ۂɍĐ������܂łɂ͏������Ԃ�������܂��B
����startcnt�̒l���Ď����邱�Ƃ�
���ۂɍĐ����J�n���ꂽ����c���ł��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ID���w�肵�܂��B

2. [OUT] �ϐ��@�F�@cntptr
�@�@startcnt���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DGetSoundEndCnt
����endcnt���擾���܂��B
%group
Easy3D For HSP3 : �T�E���h

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@soundid
p2 : [OUT] �ϐ��@�F�@cntptr

%inst
����endcnt���擾���܂��B
endcnt�͂O����n�܂�A���̍Đ������ۂɏI�������Ƃ��ɂP�������܂��B
���̒�~���߂��Ă΂Ȃ��ꍇ�ł��Đ����Ō�܂ŒB���I������΃J�E���g��������̂�
���ۂɍĐ����I�������Ƃ���c���ł��܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@soundid
�@�@�������ʂ���ID���w�肵�܂��B

2. [OUT] �ϐ��@�F�@cntptr
�@�@endcnt���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DPCWait
�w�肵��FPS�ɋ߂��Ȃ�悤�ɑҋ@���܂��B
%group
Easy3D For HSP3 : ����

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@srcfps
p2 : [OUT] �ϐ��@�F�@dstfps

%inst
�w�肵��FPS�ɋ߂��Ȃ�悤�ɑҋ@���܂��B
E3DWaitByFPS���������x�ł���CPU������܂��B
���̓����̍ۂɂ͐��m�ȃ^�C�~���O���K�v�ɂȂ�̂ł��̖��߂��g���Ă��������B
�K��await 0�̌�ŌĂ�ŉ������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@srcfps
�@�@�ڕW��FPS���w�肵�܂��B

2. [OUT] �ϐ��@�F�@dstfps
�@�@�����^�̕ϐ��B
�@�@���ۂ�FPS���������܂��B



�o�[�W���� : ver5.3.2.5

%index
E3DSetCameraOffset
�J�����̃I�t�Z�b�g��ݒ肵�܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [IN] �ϐ��@�F�@camoffbef
p2 : [IN] �ϐ��܂��́A���l�@�F�@camqid
p3 : [IN] �ϐ��@�F�@camoffaft

%inst
�J�����̃I�t�Z�b�g��ݒ肵�܂��B
�ڂ����̓}�j���A����e3d_CameraOffset.htm���������������B
��̓I�Ȏg�p���
e3dhsp3_CameraOffset.hsp���������������B




������
1. [IN] �ϐ��@�F�@camoffbef
�@�@��]�O�̕��s�ړ��������w�肵�܂��B
�@�@�����z��̕ϐ������w�肵�Ă��������B
�@�@camoffbef(0)��X���W
�@�@camoffbef(1)��Y���W
�@�@camoffbef(2)��Z���W���w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@camqid
�@�@��]��\���N�H�[�^�j�I����ID���w�肵�Ă��������B

3. [IN] �ϐ��@�F�@camoffaft
�@�@��]��̕��s�ړ��������w�肵�܂��B
�@�@�����z��̕ϐ������w�肵�Ă��������B
�@�@camoffaft(0)��X���W
�@�@camoffaft(1)��Y���W
�@�@camoffaft(2)��Z���W���w�肵�Ă��������B




�o�[�W���� : ver5.3.3.3

%index
E3DAllClearInfElem
�{�[���̉e���x��S�č폜���܂�����ȏ�Ԃɂ��܂��B
%group
Easy3D For HSP3 : �{�[���e��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@vertno

%inst
�{�[���̉e���x��S�č폜���܂�����ȏ�Ԃɂ��܂��B

�{�[���̉e���x���P����`����Ă��Ȃ���Ԃ�
E3DCreateSkinMat��`�施�߂��Ăяo���ƃG���[�ɂȂ�܂��B

���̖��߂��Ăяo�����ꍇ��
�K�����Ȃ��Ƃ��P�̓{�[���̉e���x��ݒ肵
�e���x�̐ݒ肪�S���I�������
E3DCreateSkinMat���Ăяo���Ȃ���΂Ȃ�܂���B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�\���I�u�W�F�N�g�����ʂ���ԍ��B
�@�@-1���w�肷��ƑS�Ẵp�[�c�ɑ΂��ď������܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@vertno
�@�@���_�̔ԍ��B
�@�@-1���w�肷��ƑS�Ă̒��_�ɏ������܂��B
�@�@partno��-1���w�肵���ꍇ��
�@�@�����I�ɓ�����vertno��-1���Z�b�g����܂��B


�o�[�W���� : ver5.3.3.7

%index
E3DSetGPOffset
GPA�̍Đ��J�n�ʒu�ƌ������w�肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��@�F�@tra
p3 : [IN] �ϐ��܂��́A���l�@�F�@qid

%inst
GPA�̍Đ��J�n�ʒu�ƌ������w�肵�܂��B

���̖��߂��ĂԑO��
E3DSetGPGroundHSID���ĂсA
���̖��߂��Ă񂾌��
E3DCalcGPFullFrame���Ă΂Ȃ��ƃI�t�Z�b�g�̓A�j���ɔ��f����܂���B

��̓I�Ȏg�p���
e3dhsp3_GPOffset.hsp���������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ID�B

2. [IN] �ϐ��@�F�@tra
�@�@�����^�̔z��̕ϐ��B
�@�@GPA���J�n����ʒu�B
�@�@ddim tra, 3�Ń��������쐬���Ă��������B
�@�@tra(0)��X���W�Atra(1)��Y���W�Atra(2)��Z���W�������Ă��炱�̖��߂ɓn���Ă��������B

3. [IN] �ϐ��܂��́A���l�@�F�@qid
�@�@GPA���J�n���������\���N�H�[�^�j�I����ID�B



�o�[�W���� : ver5.3.4.5

%index
E3DSelectLightType
���̖��߂�ltype�����ɂP������
html{
<strong>E3DInit���O��</strong>
}html�Ăяo����
���s�����ƃX�|�b�g���C�g�����v�R�܂Ŏg�����Ƃ��o����悤�ɂȂ�܂��B
%group
Easy3D For HSP3 : ���C�g

%prm
p1
p1 : [IN] �ϐ��܂��́A���l�@�F�@ltype

%inst
���̖��߂�ltype�����ɂP������
html{
<strong>E3DInit���O��</strong>
}html�Ăяo����
���s�����ƃX�|�b�g���C�g�����v�R�܂Ŏg�����Ƃ��o����悤�ɂȂ�܂��B

���̖��߂��Ăяo���Ȃ�������ltype�ɂO�����ČĂяo���ƕ��s�����ƃ|�C���g���C�g�����v�R�܂Ŏg�����Ƃ��o���܂��B

�Ăяo���ꍇ�͕K��E3DInit���O�ŌĂяo���܂��B
��xE3DInit���Ăяo������r���ŕύX���邱�Ƃ͏o���܂���B


�|�C���g���C�g��X�|�b�g���C�g��
�V�F�[�_�[�^�C�v�ɂ���Ă��Ȃ茩�h�����ς��܂��B
�f�t�H���g��COL_PHONG���ƒ��_�P�ʂŌv�Z�����̂ł��Ȃ�|���S�����ׂ����Ȃ��Ƃ��ꂢ�Ɍ��ʂ��o�܂���B
COL_PPHONG���ƃs�N�Z���P�ʂŌv�Z����邽��
�e���|���S���ł����ꂢ�Ɍ��ʂ��o�܂��B
��ʂɃ|���S�����ׂ����������COL_PPHONG���g�����ق������s���x�������ł��B

�V�F�[�_�[�^�C�v��E3DSetShaderType�Őݒ肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@ltype
�@�@�P���w�肷��ƕ��s�����ƃX�|�b�g���C�g���g�p�ł��܂��B
�@�@�O���w�肷��ƕ��s�����ƃ|�C���g���C�g���g�p�ł��܂��B



�o�[�W���� : ver5.3.4.6

%index
E3DRenderZandN
���f����Z���Ɩ@�����������o���܂��B
%group
Easy3D For HSP3 : �`��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN][OUT] �ϐ��܂��́A���l�@�F�@outzscid
p2 : [IN][OUT] �ϐ��܂��́A���l�@�F�@outnscid
p3 : [IN] �ϐ��܂��́A���l�@�F�@inzscid
p4 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p5 : [IN] �ϐ��܂��́A���l�@�F�@skipflag
p6 : [IN] �ϐ��܂��́A���l�@�F�@renderflag

%inst
���f����Z���Ɩ@�����������o���܂��B
�ʏ�̃X���b�v�`�F�C���⃌���_�[�^�[�Q�b�g�e�N�X�`���ɑ΂��ď������s���܂��B
Z�o��,�@���o�́AZ���͂̃T�[�t�F�X�̑傫���͓����łȂ���΂Ȃ�Ȃ��B
�I�u�W�F�N�g���Ȃ������̓A���t�@���O�B

Z�o�͂�r, g, b�R�����Ɂ��P�A���Q�T�U�A�Q�T�U���Q�T�U�X�P�[���i�������j��
�����o�͂��Ă��܂��B

�g�p����Ƃ���
depth = r + g / 256.0f + b / (256.0f * 256.0f)
�̂悤�ɂ��Ďg���܂��B





������
1. [IN][OUT] �ϐ��܂��́A���l�@�F�@outzscid
�@�@Z�����o�͂���scid

2. [IN][OUT] �ϐ��܂��́A���l�@�F�@outnscid
�@�@�@�������o�͂���scid

3. [IN] �ϐ��܂��́A���l�@�F�@inzscid
�@�@�o�͂̍ۂɎg�p����Z�o�b�t�@��scid

4. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID

5. [IN] �ϐ��܂��́A���l�@�F�@skipflag
�@�@�����̃X�L�b�v�t���O�B
�@�@�P�𑫂���Z�o�̓X�L�b�v�B
�@�@�Q�𑫂��Ɩ@���o�̓X�L�b�v�B
�@�@�S�𑫂���Z�o�b�t�@�[�������X�L�b�v�B
�@�@�W�𑫂��ƃ��[�V�����̎p���v�Z�X�L�b�v�B
�@�@�P�U�𑫂���BeginScene, EndScene���X�L�b�v�B

6. [IN] �ϐ��܂��́A���l�@�F�@renderflag
�@�@�����_�[�t���O�B
�@�@�P�𑫂���Z�����o�́B
�@�@�Q�𑫂��Ɩ@�������o�́B
�@�@�S�𑫂��ƃJ�������W�n�̖@�����o�́B�������Q�Ƒg�ݍ��킹�Ȃ��Ɩ����B



�o�[�W���� : ver5.3.4.7

%index
E3DGetMaterialNum
�ʃ}�e���A���̑������擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@getnum

%inst
�ʃ}�e���A���̑������擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ID�B

2. [OUT] �ϐ��@�F�@getnum
�@�@�ʃ}�e���A���̑������������܂��B




�o�[�W���� : ver5.3.4.7

%index
E3DGetMaterialInfo
�S�Ă̖ʃ}�e���A���̏����擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��@�F�@name
p3 : [IN] �ϐ��@�F�@mii
p4 : [IN] �ϐ��@�F�@mid
p5 : [IN] �ϐ��܂��́A���l�@�F�@arrayleng
p6 : [OUT] �ϐ��@�F�@getnum

%inst
�S�Ă̖ʃ}�e���A���̏����擾���܂��B

�}�e���A������name[������]�Amii[�������]�Amid[�������]�ɕ����Ď擾���܂��B

E3DGetMaterialNum�Ŏ擾�����}�e���A������matnum�Ƃ����
name��
sdim name, 256, matnum
�ō쐬���܂��B
mii��
dim mii, MII_MAX, matnum
mid��
ddim mid, MID_MAX, matnum
�ō쐬���܂��B

MII_�AMID_�Ŏn�܂�萔��e3dhsp3.as�Œ�`����Ă��܂��B

MII_����mii�̊e�����o�[�ɃA�N�Z�X����̂Ɏg���܂��B

MII_MATNO �̓}�e���A���ԍ��ւ̃C���f�b�N�X�ł��B
MII_DIFFR ��Diffuse��R�����ւ̃C���f�b�N�X�ł��B
MII_DIFFG ��Diffuse��G�����ւ̃C���f�b�N�X�ł��B
MII_DIFFB ��Diffuse��B�����ւ̃C���f�b�N�X�ł��B
MII_SPCR ��Specular��R�����ւ̃C���f�b�N�X�ł��B
MII_SPCG ��Specular��G�����ւ̃C���f�b�N�X�ł��B
MII_SPCB ��Specular��B�����ւ̃C���f�b�N�X�ł��B
MII_AMBR ��Ambient��R�����ւ̃C���f�b�N�X�ł��B
MII_AMBG ��Ambient��G�����ւ̃C���f�b�N�X�ł��B
MII_AMBB ��Ambient��B�����ւ̃C���f�b�N�X�ł��B
MII_EMIR ��Emissive��R�����ւ̃C���f�b�N�X�ł��B
MII_EMIG ��Emissive��G�����ւ̃C���f�b�N�X�ł��B
MII_EMIB ��Emissive��B�����ւ̃C���f�b�N�X�ł��B
MII_MAX ��mii�̔z�񒷂Ɏg���܂��B

�Ⴆ�΂P�ڂ̃}�e���A���̃}�e���A���ԍ��ɂ�
mii( 1MII_MATNO, 0 )�ŃA�N�Z�X���܂��B


MID_����mid�̊e�����o�[�ɃA�N�Z�X����̂Ɏg���܂��B

MID_ALPHA ��alpha�ւ̃C���f�b�N�X�ł��B
MID_POWER Specular Power�ւ̃C���f�b�N�X�ł��B
MID_MAX ��mid�̔z�񒷂Ɏg���܂��B&nbsp;

�Ⴆ�΂Q�ڂ̃}�e���A���̃A���t�@�ɂ�
mid( MID_ALPHA, 1 )�ŃA�N�Z�X���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f���f�[�^�����ʂ���ID�B

2. [IN] �ϐ��@�F�@name
�@�@�ʃ}�e���A���̖��O���������܂��B

3. [IN] �ϐ��@�F�@mii
�@�@�ʃ}�e���A���C���t�H�̐����������������܂��B

4. [IN] �ϐ��@�F�@mid
�@�@�ʃ}�e���A���C���t�H�̎����������������܂��B

5. [IN] �ϐ��܂��́A���l�@�F�@arrayleng
�@�@�ʃ}�e���A�����擾�p�̔z��̒������w�肵�܂��B

6. [OUT] �ϐ��@�F�@getnum
�@�@�擾�����ʃ}�e���A�����̐����������܂��B





�o�[�W���� : ver5.3.4.7

%index
E3DGetMOELocalMotionFrameNo
���[�V����(qua)�̃��[�V�����ԍ��ƃt���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@moeanimno
p3 : [IN] �ϐ��܂��́A���l�@�F�@moeframeno
p4 : [OUT] �ϐ��@�F�@localanimno
p5 : [OUT] �ϐ��@�F�@localframeno

%inst
���[�V����(qua)�̃��[�V�����ԍ��ƃt���[���ԍ����擾���܂��B

moeanimno, moeframeno��
E3DGetMOEFrameNo hsid, moeanimno, moeframeno
�Ŏ擾�����l���w�肵�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@moeanimno
�@�@MOE�̃A�j���̔ԍ����w�肵�܂��B
�@�@qua�̃A�j���ԍ��ł͂���܂���B

3. [IN] �ϐ��܂��́A���l�@�F�@moeframeno
�@�@MOE�̃t���[���ԍ����w�肵�܂��B
�@�@qua�̃t���[���ԍ��ł͂���܂���B

4. [OUT] �ϐ��@�F�@localanimno
�@�@MOE�̎w��t���[���ɑΉ�����qua�̃A�j���ԍ����������܂��B

5. [OUT] �ϐ��@�F�@localframeno
�@�@MOE�̎w��t���[���ɑΉ�����qua�̃t���[���ԍ����������܂��B




�o�[�W���� : ver5.3.4.8

%index
E3DGetMOELocalNextMotionFrameNo
���ɍĐ����\�񂳂�Ă��郂�[�V�����̔ԍ��ƃt���[���ԍ����擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@moeanimno
p3 : [IN] �ϐ��܂��́A���l�@�F�@moeframeno
p4 : [OUT] �ϐ��@�F�@localnextanimno
p5 : [OUT] �ϐ��@�F�@localnextframeno

%inst
���ɍĐ����\�񂳂�Ă��郂�[�V�����̔ԍ��ƃt���[���ԍ����擾���܂��B

moeanimno, moeframeno��
E3DGetMOEFrameNo hsid, moeanimno, moeframeno
�Ŏ擾�����l���w�肵�܂��B

E3DGetMOELocalMotionFrameNo hsid, moeanimno, moeframeno, localanimno, localframeno
�Ŏ擾����localanimno���O�̂Ƃ��ɂ��̖��߂͈Ӗ��������܂�
�ilocalnextanimno�ɂO�ȏ�̒l���������܂��B�j

localnextframeno�ɂ͕�Ԃ��I������Ƃ��̃W�����v��̃t���[���ԍ�������܂��B
�܂��ԃt���[�������T�̂Ƃ��́A����(localnextanimno���O�ȏ�̂Ƃ��͂���)
�T������܂��B

�ł��̂�localanimno���O�������Ƃ���
���ݍĐ����̃��[�V������
���[�V����ID=localnextanimno
�t���[���ԍ�=localframeno
�ƂȂ�܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@moeanimno
�@�@MOE�̃A�j���̔ԍ����w�肵�܂��B
�@�@qua�̃A�j���ԍ��ł͂���܂���B

3. [IN] �ϐ��܂��́A���l�@�F�@moeframeno
�@�@MOE�̃t���[���ԍ����w�肵�܂��B
�@�@qua�̃t���[���ԍ��ł͂���܂���B

4. [OUT] �ϐ��@�F�@localnextanimno
�@�@MOE�̎w��t���[���ɍĐ�����qua�̎��ɍĐ����\�񂳂�Ă���A�j���̔ԍ����������܂��B

5. [OUT] �ϐ��@�F�@localnextframeno
�@�@MOE�̎w��t���[���ɍĐ�����qua�̎��ɍĐ����\�񂳂�Ă���A�j���̊J�n�t���[���ԍ����������܂��B



�o�[�W���� : ver5.3.4.8

%index
E3DSetMotionBlurMaxAlpha
���[�V�����u���[�̈�ԔZ�������̓����x�̌W�����w�肵�܂��B
%group
Easy3D For HSP3 : �G�t�F�N�g

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@partno
p3 : [IN] �ϐ��܂��́A���l�@�F�@maxAlpha

%inst
���[�V�����u���[�̈�ԔZ�������̓����x�̌W�����w�肵�܂��B
�}�e���A���̃A���t�@�ɂ��̖��߂Ŏw�肵���W�����|���Z�������̂��A�����x�Ƃ��Đݒ肵�܂��B

E3DSetMotionBlurMinAlpha�͓����x�̒l���w�肷��̂ɑ΂��A���̖��߂͌W�����w�肷��_�ɒ��ӂ��Ă��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���ID�B

2. [IN] �ϐ��܂��́A���l�@�F�@partno
�@�@�ݒ肵�����p�[�c�̔ԍ��B
�@�@-1���w�肷��ƑS�Ẵp�[�c�ɐݒ肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@maxAlpha
�@�@0.0����1.0�܂ł̎����B
�@�@�u���[�̍ő哧���x�̌W�����w�肵�܂��B



�o�[�W���� : ver5.4.0.5

%index
E3DGetMaterial1stTex
�}�e���A���̃e�N�X�`���i�P���ځj�̖��O���擾���܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [OUT] ������̕ϐ��@�F�@texname

%inst
�}�e���A���̃e�N�X�`���i�P���ځj�̖��O���擾���܂��B

texname������
sdim texname, 256�ō쐬���Ă���n���Ă��������B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [OUT] ������̕ϐ��@�F�@texname
�@�@�e�N�X�`���̖��O���������܂��B
�@�@�O�L������񂭂������B



�o�[�W���� : ver5.4.0.6

%index
E3DSetMaterial1stTex
�}�e���A���̃e�N�X�`���i�P���ځj�̖��O��ݒ肵�܂��B
%group
Easy3D For HSP3 : �}�e���A��

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@matno
p3 : [IN] ������܂��͕�����̕ϐ��@�F�@texname

%inst
�}�e���A���̃e�N�X�`���i�P���ځj�̖��O��ݒ肵�܂��B

���O�͂Q�T�U�����܂łł��B
���f���f�[�^�Ɠ����ꏊ����t�@�C����T��
�e�N�X�`�����Z�b�g���Ȃ����܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@matno
�@�@�}�e���A���ԍ��B
�@�@E3DGetMaterialNoByName�Ŏ擾�����ԍ��A
�@�@��������
�@�@RokDeBone2�́u�ʃ}�e���A���v���j���[��
�@�@�\������Ă���u�}�e���A���ԍ��v

3. [IN] ������܂��͕�����̕ϐ��@�F�@texname
�@�@�e�N�X�`���̖��O���w�肵�܂��B�B
�@�@�O�L������񂭂������B



�o�[�W���� : ver5.4.0.6

%index
E3DGetMOEKeyGoOnFlag
MOE�̃C�x���g�p���t���O���擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [OUT] �ϐ��@�F�@flagptr

%inst
MOE�̃C�x���g�p���t���O���擾���܂��B

�w�肵���t���[���ɃL�[�������ꍇ�̓G���[�ɂȂ�܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@MOE�̃A�j���ԍ����w�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@MOE�A�j���̃t���[���ԍ��B

4. [OUT] �ϐ��@�F�@flagptr
�@�@�t���O���������܂��B
�@�@�p���̂Ƃ��͂P�B�P���̂Ƃ��͂O�B



�o�[�W���� : ver5.4.0.6

%index
E3DSetMOEKeyGoOnFlag
MOE�̃C�x���g�p���t���O��ݒ肵�܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@animno
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@flag

%inst
MOE�̃C�x���g�p���t���O��ݒ肵�܂��B

�w�肵���t���[���ɃL�[�������ꍇ�̓G���[�ɂȂ�܂��B

E3DCalcMOEFullFrame���߂��Ăяo���Ƃ��̐ݒ肪���f����܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@animno
�@�@MOE�̃A�j���ԍ����w�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@MOE�A�j���̃t���[���ԍ��B

4. [IN] �ϐ��܂��́A���l�@�F�@flag
�@�@�t���O���w�肵�܂��B
�@�@�p���̂Ƃ��͂P�B�P���̂Ƃ��͂O�B



�o�[�W���� : ver5.4.0.6

%index
E3DGetMOATrunkNotComID
moa�̋��ʕ���֎~ID�̌���ID���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@arrayelng
p4 : [OUT] �ϐ��@�F�@notcomid
p5 : [OUT] �ϐ��@�F�@getnum

%inst
moa�̋��ʕ���֎~ID�̌���ID���擾���܂��B

arrayleng�ɂO���w�肷���ID�̐��������擾���܂��B
�g������

E3DGetMOATrunkNotComID hsid, motid, 0, notcomid, idnum

dim notcomid, idnum

E3DGetMOATrunkNotComID hsid, motid, idnum, notcomid, chknum

�̂悤��arrayleng��ς��ĂQ��Ăяo���Ďg���܂��B






������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@Trunk�̃��[�V���������ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@arrayelng
�@�@notcomid�����Ɏw�肷��z��̗v�f���B

4. [OUT] �ϐ��@�F�@notcomid
�@�@ID���i�[����z��B

5. [OUT] �ϐ��@�F�@getnum
�@�@ID�̐����������܂��B







�o�[�W���� : ver5.4.0.7

%index
E3DSetMOATrunkNotComID
moa�̋��ʕ���֎~ID�̌���ID��ݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@arrayelng
p4 : [IN] �ϐ��܂��́A���l�@�F�@notcomid

%inst
moa�̋��ʕ���֎~ID�̌���ID��ݒ肵�܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@Trunk�̃��[�V���������ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@arrayelng
�@�@notcomid�����Ɏw�肷��z��̗v�f���B

4. [IN] �ϐ��܂��́A���l�@�F�@notcomid
�@�@ID���i�[�����z��B




�o�[�W���� : ver5.4.0.7

%index
E3DGetZa3Euler
���R�ł̃I�C���[�p�x���擾���܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p5 : [IN] �ϐ��@�F�@befeul
p6 : [OUT] �ϐ��@�F�@geteul

%inst
���R�ł̃I�C���[�p�x���擾���܂��B

befeul, geteul��
ddim befeil, 3
ddim geteul, 3
�Ŏ����^�̔z����쐬���Ă��������B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@���[�V�����̃t���[���ԍ�

4. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���p�[�c�̔ԍ�

5. [IN] �ϐ��@�F�@befeul
�@�@�����^�̔z��B�@
�@�@befeul(0), befeul(1), befeul(2)�ɂ��ꂼ��X,Y,Z�̃I�C���[�p�x���w�肵�Ă��������B
�@�@�v�Z����befeul�ɋ߂��l��geteul�Ɋi�[���܂��B

6. [OUT] �ϐ��@�F�@geteul
�@�@�����^�̔z��B
�@�@�{�[���̎p���̃I�C���[�p�x���������܂��B
�@�@geteul(0), geteul(1), geteul(2)�ɂ��ꂼ��X,YZ�������������܂��B




�o�[�W���� : ver5.4.0.9

%index
E3DSetZa3Euler
���R�ł̃I�C���[�p�̎p�����{�[���ɐݒ肵�܂��B
%group
Easy3D For HSP3 : ���[�V����

%prm
p1,p2,p3,p4,p5
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@motid
p3 : [IN] �ϐ��܂��́A���l�@�F�@frameno
p4 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p5 : [IN] �ϐ��@�F�@seteul

%inst
���R�ł̃I�C���[�p�̎p�����{�[���ɐݒ肵�܂��B

seteul��
ddim seteul, 3
�Ŏ����^�̔z����쐬���Ă��������B


���[�V�����ɔ��f������ɂ�
E3DFillUpMotion���Ăяo���K�v������܂��B



������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@�`��f�[�^�����ʂ���id

2. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���id

3. [IN] �ϐ��܂��́A���l�@�F�@frameno
�@�@���[�V�����̃t���[���ԍ�

4. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���p�[�c�̔ԍ�

5. [IN] �ϐ��@�F�@seteul
�@�@�����^�̔z��B
�@�@�{�[���̎p���̃I�C���[�p�x���w�肵�܂��B
�@�@seteul(0), seteul(1), seteul(2)�ɂ��ꂼ��X,YZ�������w�肵�܂��B�B




�o�[�W���� : ver5.4.0.9

%index
E3DGetMOELocalMotionFrameNoML
MOE�̃A�j���ԍ��ƃt���[���ԍ��ɑΉ�����qua�̃��[�V�����̏����{�[�����ƂɎ擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@moeanimno
p3 : [IN] �ϐ��܂��́A���l�@�F�@moeframeno
p4 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p5 : [OUT] �ϐ��@�F�@localanimno
p6 : [OUT] �ϐ��@�F�@localframeno

%inst
MOE�̃A�j���ԍ��ƃt���[���ԍ��ɑΉ�����qua�̃��[�V�����̏����{�[�����ƂɎ擾���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@moeanimno
�@�@MOE�̃A�j���̔ԍ����w�肵�܂��B
�@�@qua�̃A�j���ԍ��ł͂���܂���B

3. [IN] �ϐ��܂��́A���l�@�F�@moeframeno
�@�@MOE�̃t���[���ԍ����w�肵�܂��B
�@�@qua�̃t���[���ԍ��ł͂���܂���B

4. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

5. [OUT] �ϐ��@�F�@localanimno
�@�@MOE�̎w��t���[���ɑΉ�����qua�̃A�j���ԍ����������܂��B

6. [OUT] �ϐ��@�F�@localframeno
�@�@MOE�̎w��t���[���ɑΉ�����qua�̃t���[���ԍ����������܂��B



�o�[�W���� : ver5.4.1.0

%index
E3DGetMOELocalNextMotionFrameNoML
MOE�̃A�j���ԍ��ƃt���[���ԍ��ɑΉ�����qua�̎��̃��[�V�����̏����{�[�����ƂɎ擾���܂��B
%group
Easy3D For HSP3 : MOE

%prm
p1,p2,p3,p4,p5,p6
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] �ϐ��܂��́A���l�@�F�@moeanimno
p3 : [IN] �ϐ��܂��́A���l�@�F�@moeframeno
p4 : [IN] �ϐ��܂��́A���l�@�F�@boneno
p5 : [OUT] �ϐ��@�F�@localnextanimno
p6 : [OUT] �ϐ��@�F�@localnextframeno

%inst
MOE�̃A�j���ԍ��ƃt���[���ԍ��ɑΉ�����qua�̎��̃��[�V�����̏����{�[�����ƂɎ擾���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@moeanimno
�@�@MOE�̃A�j���̔ԍ����w�肵�܂��B
�@�@qua�̃A�j���ԍ��ł͂���܂���B

3. [IN] �ϐ��܂��́A���l�@�F�@moeframeno
�@�@MOE�̃t���[���ԍ����w�肵�܂��B
�@�@qua�̃t���[���ԍ��ł͂���܂���B

4. [IN] �ϐ��܂��́A���l�@�F�@boneno
�@�@�{�[�������ʂ���ԍ����w�肵�Ă��������B

5. [OUT] �ϐ��@�F�@localnextanimno
�@�@MOE�̎w��t���[���ɍĐ�����qua�̎��ɍĐ����\�񂳂�Ă���A�j���̔ԍ����������܂��B

6. [OUT] �ϐ��@�F�@localnextframeno
�@�@MOE�̎w��t���[���ɍĐ�����qua�̎��ɍĐ����\�񂳂�Ă���A�j���̊J�n�t���[���ԍ����������܂��B



�o�[�W���� : ver5.4.1.0

%index
E3DSetDefaultGP
GP�A�j���̃f�t�H���g�̃p�����[�^��ݒ肵�܂��B
%group
Easy3D For HSP3 : GPA

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B
p2 : [IN] �z��̕ϐ��@�F�@gpi
p3 : [IN] �z��̕ϐ��@�F�@gpd�@�@�����^�̔z��̕ϐ��B

%inst
GP�A�j���̃f�t�H���g�̃p�����[�^��ݒ肵�܂��B

gpi, gpd�̏ڍׂ�E3DSetGPKey�̐������������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] �z��̕ϐ��@�F�@gpi
�@�@GP�L�[�̐��������o���Z�b�g���܂��B

3. [IN] �z��̕ϐ��@�F�@gpd�@�@�����^�̔z��̕ϐ��B
�@�@GP�L�[�̎��������o���Z�b�g���܂��B




�o�[�W���� : ver5.4.1.1

%index
E3DSetDefaultCamera
�J�����A�j���̃f�t�H���g�̃p�����[�^��
�J�����ԍ����Ƃɐݒ肵�܂��B
%group
Easy3D For HSP3 : �J����

%prm
p1,p2,p3
p1 : [IN] �ϐ��܂��́A���l�@�F�@camerano
p2 : [IN] �z��̕ϐ��@�F�@cami
p3 : [IN] �z��̕ϐ��@�F�@camd

%inst
�J�����A�j���̃f�t�H���g�̃p�����[�^��
�J�����ԍ����Ƃɐݒ肵�܂��B

cami, camd�̏ڍׂ�E3DSetCameraKey�̐������������������B




������
1. [IN] �ϐ��܂��́A���l�@�F�@camerano
�@�@�J�����ԍ����w�肵�Ă��������B

2. [IN] �z��̕ϐ��@�F�@cami
�@�@�J�����L�[�̐��������o���Z�b�g���܂��B

3. [IN] �z��̕ϐ��@�F�@camd
�@�@�����^�̔z��̕ϐ��B
�@�@�J�����L�[�̎��������o���Z�b�g���܂��B




�o�[�W���� : ver5.4.1.1

%index
E3DValidHsid
hsid���g�p�\���ǂ������`�F�b�N���܂��B
%group
Easy3D For HSP3 : �`��p�����[�^

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [OUT] �ϐ��@�F�@flagptr

%inst
hsid���g�p�\���ǂ������`�F�b�N���܂��B
�Ⴆ��E3DDestroyHandlerSet���Ăяo�������hsid�ɑ΂��ČĂяo���Ɩ����̃t���O���Ԃ���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [OUT] �ϐ��@�F�@flagptr
�@�@hsid���L���̂Ƃ��͂P�A�����̂Ƃ��͂O���������܂��B



�o�[�W���� : ver5.4.1.4

%index
E3DKinectLoadLib
Kinect����p�̃��C�u���������[�h���܂��B
%group
Easy3D For HSP3 : Kinect

%prm
p1
p1 : [OUT] �ϐ��@�F�@validflagptr

%inst
Kinect����p�̃��C�u���������[�h���܂��B
OpenNI���C���X�g�[������Ă���OpenNI�̃T���v����������ԂɃ}�V�����Ȃ��Ƃ����܂���B




������
1. [OUT] �ϐ��@�F�@validflagptr
�@�@����Ƀ��C�u���������[�h�ł�����P���������܂��B���s����ƂO���������܂��B



�o�[�W���� : ver5.5.0.0

%index
E3DKinectSetChara
Kinect�̃L���v�`����Easy3D�̃L�����N�^�[�̊֘A�t�������܂��B
%group
Easy3D For HSP3 : Kinect

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@hsid
p2 : [IN] ������܂��́A������ϐ��@�F�@kstname
p3 : [IN] �ϐ��܂��́A���l�@�F�@motid
p4 : [IN] �ϐ��܂��́A���l�@�F�@capmode

%inst
Kinect�̃L���v�`����Easy3D�̃L�����N�^�[�̊֘A�t�������܂��B

kst�t�@�C����RokDeBone2�ō쐬���܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@hsid
�@�@���f�������ʂ���ԍ����w�肵�Ă��������B

2. [IN] ������܂��́A������ϐ��@�F�@kstname
�@�@kst�t�@�C���̃t�@�C�������w�肵�܂��B

3. [IN] �ϐ��܂��́A���l�@�F�@motid
�@�@���[�V���������ʂ���ԍ����w�肵�Ă��������B

4. [IN] �ϐ��܂��́A���l�@�F�@capmode
�@�@CAPMODE_ALL���w�肷���motid�Ŏw�肵�����[�V�����̍ŏ��̃t���[������Ō�̃t���[���܂ŃL���v�`�������܂��B�Ō�̃t���[���ɒB�����玩���I�ɃL���v�`���͏I�����܂��B
�@�@CAPMODE_ONE���w�肷���motid�Ŏw�肵�����[�V�����̍ŏ��̂P�t���[���i�t���[���ԍ��O�j�ɃL���v�`�����܂��B���̃��[�h�ł�E3DKinectEndCapture���ĂԂ܂ŃL���v�`���[�������܂��B




�o�[�W���� : ver5.5.0.0

%index
E3DKinectStartCapture
Kinect�̃��[�V�����L���v�`�����J�n���܂��B
%group
Easy3D For HSP3 : Kinect

%prm
�Ȃ�

%inst
Kinect�̃��[�V�����L���v�`�����J�n���܂��B
�P�O�b�قǎ��Ԃ��|����܂��B




������


�o�[�W���� : ver5.5.0.0

%index
3DKinectEndCapture
Kinect�̃��[�V�����L���v�`�����I�����܂��B
%group
Easy3D For HSP3 : Kinect

%prm
�Ȃ�

%inst
Kinect�̃��[�V�����L���v�`�����I�����܂��B




������


�o�[�W���� : ver5.5.0.0

%index
E3DKinectIsTracking
Kinect�̃��[�V�����L���v�`�����g���b�L���O��Ԃɂ��邩�ǂ����𒲂ׂ܂��B
%group
Easy3D For HSP3 : Kinect

%prm
p1,p2
p1 : [OUT] �ϐ��@�F�@flagptr
p2 : [OUT] �ϐ��@�F�@capcntptr

%inst
Kinect�̃��[�V�����L���v�`�����g���b�L���O��Ԃɂ��邩�ǂ����𒲂ׂ܂��B
�g���b�L���O��ԂƂ�Kinect�����삵�A�����p����F�����Ĉʒu���𑗐M���n�߂���Ԃł��B
�����p����Media/KinectSample�t�H���_�̒���sig�t�@�C���̎p���Ɠ����ł��B
Kinect�����삵�n�߂Ă���J�����ɑS�g������悤�ɂQ�C�R������A���ʂ������ď����p������邱�ƂŃg���b�L���O���J�n����܂��B
���̏����p���������������ƃ��[�V����������܂��B�^�ʖڂɂ������菉���p�������܂��傤�B




������
1. [OUT] �ϐ��@�F�@flagptr
�@�@�g���b�L���O��Ԃ̂Ƃ��ɂP�A�����łȂ��Ƃ��ɂO���������܂��B

2. [OUT] �ϐ��@�F�@capcntptr
�@�@�g���b�L���O���J�n����Ă��牽��E3DKinectSetSkelPos���Ăяo�������������܂��B





�o�[�W���� : ver5.5.0.0

%index
E3DKinectGetSkelPos
Kinect�ŃL���v�`�������{�[���̈ʒu���擾���܂��B
%group
Easy3D For HSP3 : Kinect

%prm
p1,p2
p1 : [OUT] �ϐ��@�F�@posptrd
p2 : [OUT] �ϐ��@�F�@getflagptr

%inst
Kinect�ŃL���v�`�������{�[���̈ʒu���擾���܂��B
�{�[���̖��O��usercoef.h��SKEL_*�Œ�`����Ă��܂��B

posptr�ɂ�
ddim pos, 3, SKEL_MAX
�Œ�`����pos���w�肵�Ă��������B

�ʒu�̓g���b�L���O���J�n����Ă��Ȃ��Ǝ擾�ł��܂���B




������
1. [OUT] �ϐ��@�F�@posptrd
�@�@�����^�̔z��̕ϐ��B
�@�@�ʒu���i�[����z����w�肵�Ă��������B�ڂ����͑O�L���������������B

2. [OUT] �ϐ��@�F�@getflagptr
�@�@�ʒu���擾�ł�����P���o���Ȃ�������O���������܂��B
�g���b�L���O��ԂłȂ��ƈʒu�͎擾�ł��܂���B




�o�[�W���� : ver5.5.0.0

%index
E3DKinectSetSkelPos
E3DKinectGetSkelPos�Ŏ擾�����{�[���̈ʒu��
�{�[���̎p�����ɕϊ����Ă���L�����N�^�[�ɓK�����܂��B
%group
Easy3D For HSP3 : Kinect

%prm
p1,p2,p3,p4
p1 : [IN] �ϐ��܂��́A���l�@�F�@kinectflag
p2 : [IN] �ϐ��܂��́A���l�@�F�@posmode
p3 : [IN] �ϐ��@�F�@posptr
p4 : [OUT] �ϐ��@�F�@framenoptr

%inst
E3DKinectGetSkelPos�Ŏ擾�����{�[���̈ʒu��
�{�[���̎p�����ɕϊ����Ă���L�����N�^�[�ɓK�����܂��B

Kinect�Ƃ�������Ɏg��Ȃ����@������܂��B
bullet�ȂǂŌv�Z�����{�[���̈ʒu���L�����N�^�[�ɓK�p����ꍇ��kinectflag�ɂO���w�肵�Ă��������B���̏ꍇ�͂��̖��߂��ĂԑO�ɂP��E3DKinectSetChara���ĂԕK�v������܂��B





������
1. [IN] �ϐ��܂��́A���l�@�F�@kinectflag
�@�@Kinect�Ƃ�������Ɏg���ꍇ�͂P���AKinect�ȊO�Ŏg���ꍇ�͂O���w�肵�Ă��������B

2. [IN] �ϐ��܂��́A���l�@�F�@posmode
�@�@�S�̈ړ��̎p�����ǂ��������邩���w�肵�܂��B
�@�@POSMODE_TOPOFJOINT���w�肷��ƑS�̈ړ�����Ԑe�̃{�[���̎p���Ɋi�[���܂��B
�@�@POSMODE_GLOBAL���w�肷��ƑS�̈ړ����L�����N�^�[�̃O���[�o���̈ʒu���Ɋi�[���܂��B�܂�E3DGetPos�ł��̏����擾�ł��܂��B
�@�@POSMODE_ZERO���w�肷��ƑS�̈ړ����L�����Z�����܂��B

3. [IN] �ϐ��@�F�@posptr
�@�@�����^�̔z��̕ϐ��B
�@�@�{�[���̈ʒu�����w�肵�܂��B
�@�@ddim pos, 3, SKEL_MAX;��pos���w�肵�܂��B

4. [OUT] �ϐ��@�F�@framenoptr
�@�@�Đ������t���[���ԍ����������܂��B





�o�[�W���� : ver5.5.0.0

%index
E3DKinectRenderSilhouette
Kinect�ŃL���v�`�����Ă���v���C���[�̃V���G�b�g���QD�`�悷�閽�߂ł��B
%group
Easy3D For HSP3 : Kinect

%prm
p1,p2
p1 : [IN] �ϐ��܂��́A���l�@�F�@withalpha
p2 : [IN] �ϐ��@�F�@tposptr

%inst
Kinect�ŃL���v�`�����Ă���v���C���[�̃V���G�b�g���QD�`�悷�閽�߂ł��B

E3DBeginScene��E3DEndScene�̊ԂɋL�q���܂��B




������
1. [IN] �ϐ��܂��́A���l�@�F�@withalpha
�@�@�������ŕ`�悷��Ƃ��͂P�A�s�����ŕ`�悷��Ƃ��͂O���w�肵�܂��B

2. [IN] �ϐ��@�F�@tposptr
�@�@�����^�̔z��̕ϐ��B
�@�@�`�悷��G���A�i�l�p�j�̎l���̒l���w�肵�܂��B

�@�@tpos(0)��top��
�@�@tpos(1)��left��
�@�@tpos(2)��bottom��
�@�@tpos(3)��right���w�肵�܂��B


�@�@��ʂ̒��S���O�ł��B
�@�@���͍���-1.0f�E��+1.0f
�@�@�㉺�͏オ1.0f����-1.0f�ł��B




�o�[�W���� : ver5.5.0.0

