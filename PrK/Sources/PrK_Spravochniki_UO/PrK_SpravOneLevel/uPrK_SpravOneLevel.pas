unit uPrK_SpravOneLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSprav, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, dxBar, dxBarExtItems,
  ImgList, ActnList, dxStatusBar;

type
  TFormPrK_SpravOneLevel = class(TFormPrKKlassSprav)
    cxGridPrKSpravOneLevel: TcxGrid;
    cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView;
    colNAME: TcxGridDBColumn;
    colSHORT_NAME: TcxGridDBColumn;
    colKOD: TcxGridDBColumn;
    cxGridPrKSpravOneLevelLevel1: TcxGridLevel;
    colNPP: TcxGridDBColumn;
    procedure ActionDELExecute(Sender: TObject);
    procedure cxGridPrKSpravOneLevelDBTableView1DblClick(Sender: TObject);
  private

  public
   procedure InicCaption; override;
  end;

var
  FormPrK_SpravOneLevel: TFormPrK_SpravOneLevel;

implementation
uses
    uPrK_Resources,uConstants;

{$R *.dfm}

procedure TFormPrK_SpravOneLevel.InicCaption;
begin
  inherited;
  if ShowNpp=true then colNPP.Visible:=true;
  colNAME.Caption        :=nColName[IndexLanguage];
  colSHORT_NAME.Caption  :=nColShortName[IndexLanguage];
  colKOD.Caption         :=nColKod[IndexLanguage];
  colNPP.Caption         :=nColNpp[IndexLanguage];
end;

procedure TFormPrK_SpravOneLevel.ActionDELExecute(Sender: TObject);
begin
    if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDel[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
         begin
            StoredProcPrKSprav.Transaction.StartTransaction;
            StoredProcPrKSprav.StoredProcName:=StoredProcDelName;
            StoredProcPrKSprav.Prepare;
            StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64:= DataSetPrKSprav.FieldValues[ID_NAME];
            try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
              cxGridPrKSpravOneLevelDBTableView1.NavigatorButtons.Prior.Click;
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


procedure TFormPrK_SpravOneLevel.cxGridPrKSpravOneLevelDBTableView1DblClick(
  Sender: TObject);
begin
  if FormStyle = fsNormal
   then dxBarLargeButtonVibrat.Click
   else dxBarLargeButtonChange.Click;
end;

end.
