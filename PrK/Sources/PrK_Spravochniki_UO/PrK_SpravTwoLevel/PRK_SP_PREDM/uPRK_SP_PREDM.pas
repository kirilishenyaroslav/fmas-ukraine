unit uPRK_SP_PREDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravTwoLevel, cxGraphics, dxBar, dxBarExtItems, DB,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ImgList, ActnList, cxStyles, cxControls,
  dxStatusBar, cxCustomData, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxTLData;

type
  TFormPRK_SP_PREDM = class(TFormPrK_SpravTwoLevel)
    cxDBTreeListPrKSpravTwoLevelPREDM: TcxDBTreeList;
    colNAME: TcxDBTreeListColumn;
    colSHORT_NAME: TcxDBTreeListColumn;
    colNPP: TcxDBTreeListColumn;
    colKOD: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure cxDBTreeListPrKSpravTwoLevelPREDMDblClick(Sender: TObject);
  private
    procedure InicCaption; override;
  public
    { Public declarations }
  end;

var
  FormPRK_SP_PREDM: TFormPRK_SP_PREDM;

implementation
uses uConstants,uPrK_Resources;
{$R *.dfm}

procedure TFormPRK_SP_PREDM.FormCreate(Sender: TObject);
begin
  inherited;
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='KEY_FIELD';
  ID_NAME_FIRST_LEVEL  :='ID_SP_PREDM';
  ID_NAME_SECOND_LEVEL :='ID_SP_PREDM_AT';
  ShowNpp              := false;
  StoredProcAddNameFirstLevel     :='PRK_SP_PREDM_ADD';
  StoredProcChangeNameFirstLevel  :='PRK_SP_PREDM_CHANGE';
  StoredProcDelNameFirstLevel     :='PRK_SP_PREDM_DEL';
  StoredProcAddNameSecondLevel    :='PRK_SP_PREDM_AT_ADD';
  StoredProcChangeNameSecondLevel :='PRK_SP_PREDM_AT_CHANGE';
  StoredProcDelNameSecondLevel    :='PRK_SP_PREDM_AT_DEL';

  CaptionFirstLevel    :=nCaptionFirstLevelPredm[IndexLanguage];
  CaptionSecondLevel   :=nCaptionSecondLevelPredm[IndexLanguage];

  SelectSQLText        :='Select * from PRK_SP_PREDM_TREE_SELECT';



  NamePrKSpravEdit     := PrKSpravEditFobProt;// возможно это не надо будет

  InicFormCaption      := nFormPRK_SP_PREDM_Caption[IndexLanguage];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';

end;

procedure TFormPRK_SP_PREDM.ActionVibratExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,5], varVariant);
    ResultArray[0] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[1] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[2] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[4] :=DataSetPrKSprav.FieldValues['NPP'];
    ResultArray[5] :=DataSetPrKSprav.FieldValues['PARENT_FIELD'];
    close;
  end;
end;

procedure TFormPRK_SP_PREDM.InicCaption;
begin
  inherited;
    if ShowNpp=true then colNPP.Visible:=true;
    colNAME.Caption.Text        :=nColName[IndexLanguage];
    colSHORT_NAME.Caption.Text  :=nColShortName[IndexLanguage];
    colKOD.Caption.Text         :=nColKod[IndexLanguage];
    colNPP.Caption.Text         :=nColNpp[IndexLanguage];
end;

procedure TFormPRK_SP_PREDM.ActionDELExecute(Sender: TObject);
begin
  if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDel[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
         begin
            if StrToInt(DataSetPrKSprav.FieldValues['GRID_LEVEL'])=2
               then  begin
                  DataSetLevel.Active  :=false;
                  DataSetLevel.SelectSQL.Clear;
                  DataSetLevel.SQLs.SelectSQL.Text :='Select * from PRK_SP_PREDM_AT_SELECT where ID_SP_PREDM=:ID_NAME_FIRST_LEVEL';
                  DataSetLevel.ParamByName('ID_NAME_FIRST_LEVEL').AsInt64 :=DataSetPrKSprav.FieldValues['PARENT_FIELD'];
                  DataSetLevel.CloseOpen(false);
                  DataSetLevel.FetchAll;  // Возвращает все записи с сервера на клиент, если без него то DataSetLevel.RecordCount вернет 1
                  if DataSetLevel.RecordCount=1
                   then begin
                    ShowMessage(nMsgCannotDelSecLevel[IndexLanguage]);
                    Exit;
                   end;
               end;
            StoredProcPrKSprav.Transaction.StartTransaction;
            StoredProcPrKSprav.StoredProcName:=StoredProcDelName;
            StoredProcPrKSprav.Prepare;
            StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64:= DataSetPrKSprav.FieldValues[ID_NAME];
            try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
              cxDBTreeListPrKSpravTwoLevelPREDM.GotoPrev;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
               end;
            end;
         end;
         inherited Obnovit(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]));
     end;
end;

procedure TFormPRK_SP_PREDM.cxDBTreeListPrKSpravTwoLevelPREDMDblClick(
  Sender: TObject);
begin
  if FormStyle = fsNormal
   then dxBarLargeButtonVibrat.Click
   else dxBarLargeButtonChange.Click;
end;

end.
