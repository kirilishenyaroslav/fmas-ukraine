unit uPRK_SP_TYPE_UCHZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, ImgList,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TFormPRK_SP_TYPE_UCHZ = class(TForm)
    cxGridTableViewTYPE_UCHZ: TcxGridDBTableView;
    cxGridLevelTYPE_UCHZ: TcxGridLevel;
    cxGridTYPE_UCHZ: TcxGrid;
    DSource: TDataSource;
    pFIBDB: TpFIBDatabase;
    pFIBDS: TpFIBDataSet;
    pFIBTrR: TpFIBTransaction;
    pFIBTrWr: TpFIBTransaction;
    pFIBStPr: TpFIBStoredProc;
    colNAME: TcxGridDBColumn;
    colKOD: TcxGridDBColumn;
    ImageListSostPK: TImageList;
    ActionListSostPK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    StyleRepositorySostPK: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyleSkyBlue: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    procedure FormCreate(Sender: TObject);
  private
     DBHANDLE                :TISC_DB_HANDLE;
     ResultArray             :TAArray;
     TextViewColor           :TColor;
     ID_NAME                 :String;
     procedure InicCaption;
    { Private declarations }
  public
     ID_USER_GLOBAL       :Int64;
     ID_GOD_NABORA_GLOBAL :Int64;
     IndLangSP            :integer;
     constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    { Public declarations }
  end;


procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
exports   ShowAllPrkBpl;

var
  FormPRK_SP_TYPE_UCHZ: TFormPRK_SP_TYPE_UCHZ;

implementation

{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
    T :TFormPRK_SP_TYPE_UCHZ;
begin
    T:=TFormPRK_SP_TYPE_UCHZ.Create(aOwner,aParam);

    T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
        fsNormal:   begin
                        T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
        fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;

constructor TFormPRK_SP_TYPE_UCHZ.FormCreate(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLangSP     :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
          cxEditStyleControllerSostPK.Style.Color   := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPRK_SP_TYPE_UCHZ.FormCreate(Sender:TObject);
begin
  ID_NAME              :='ID_SP_TYPE_UCHZ';
  SelectSQLText        :='Select * from PRK_SP_TYPE_UCHZ_SELECT';

  InicCaption;
end;

procedure TFormPRK_SP_TYPE_UCHZ.InicCaption;
begin
  {  dxBarManagerSostPK.Bars[0].BorderStyle           :=bbsNone;
    dxBarManagerSostPK.Bars[0].ShowMark              :=false;
    dxBarManagerSostPK.CanCustomize                  :=false;
    dxBarManagerSostPK.Bars[0].AllowClose            :=false;
    dxBarManagerSostPK.Bars[0].AllowCustomizing      :=false;
    dxBarManagerSostPK.Bars[0].AllowQuickCustomizing :=false;
    dxBarManagerSostPK.Bars[0].AllowReset            :=false;       }

    TFormPRK_SP_TYPE_UCHZ(self).Caption  :=nFormPRK_SP_TYPE_UCHZ_Caption[IndLangSP];
 {   ActionADD.Caption                    :=nAction_Add[IndLangSP];
    ActionChange.Caption                 :=nAction_Change[IndLangSP];
    ActionDEL.Caption                    :=nAction_Del[IndLangSP];
    ActionView.Caption                   :=nAction_View[IndLangSP];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLangSP];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLangSP];
    ActionOtmena.Caption                 :=nAction_Exit[IndLangSP];

    ActionADD.Hint                       :=nHintAction_Add[IndLangSP];
    ActionChange.Hint                    :=nHintAction_Change[IndLangSP];
    ActionDEL.Hint                       :=nHintAction_Del[IndLangSP];
    ActionView.Hint                      :=nHintAction_View[IndLangSP];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLangSP];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLangSP];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLangSP];
   }

    colKOD.Caption                       := nColKod[IndLangSP];
    colNAME.Caption                      := nColName[IndLangSP];

   { dxStatusBarSP.Panels[0].Text          :=nStatBarAdd[IndLangSP];
    dxStatusBarSP.Panels[1].Text          :=nStatBarChange[IndLangSP];
    dxStatusBarSP.Panels[2].Text          :=nStatBarDel[IndLangSP];
    dxStatusBarSP.Panels[3].Text          :=nStatBarVibrat[IndLangSP];
    dxStatusBarSP.Panels[4].Text          :=nStatBarObnov[IndLangSP];
    dxStatusBarSP.Panels[5].Text          :=nStatBarExit[IndLangSP];   }
end;
end.
