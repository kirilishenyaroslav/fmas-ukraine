unit uSpec_SpravOneLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, dxBar, dxBarExtItems,
  ImgList, ActnList, dxStatusBar, uSpecKlassSprav, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, ExtCtrls;

type
  TFormSpec_SpravOneLevel = class(TFormSpecKlassSprav)
    cxGridPrKSpravOneLevel: TcxGrid;
    cxGridPrKSpravOneLevelDBTableView1: TcxGridDBTableView;
    colNAME: TcxGridDBColumn;
    colSHORT_NAME: TcxGridDBColumn;
    colKOD: TcxGridDBColumn;
    cxGridPrKSpravOneLevelLevel1: TcxGridLevel;
    colNPP: TcxGridDBColumn;
    SearchPanel: TPanel;
    SearchEdit: TcxTextEdit;
    Label1: TLabel;
    SearchBtn: TcxButton;
    procedure ActionDELExecute(Sender: TObject);
    procedure cxGridPrKSpravOneLevelDBTableView1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SearchEditFocusChanged(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure SearchBtnClick(Sender: TObject);
  private
    procedure SearchByFilter;
  public
   procedure InicCaption; override;
  end;

var
  FormSpec_SpravOneLevel: TFormSpec_SpravOneLevel;

implementation
uses
    uPrK_Resources,uConstants;

{$R *.dfm}

procedure TFormSpec_SpravOneLevel.InicCaption;
begin
  inherited;
  if ShowNpp=true then colNPP.Visible:=true;
  colNAME.Caption        :=nColName[IndexLanguage];
  colSHORT_NAME.Caption  :=nColShortName[IndexLanguage];
  colKOD.Caption         :=nColKod[IndexLanguage];
  colNPP.Caption         :=nColNpp[IndexLanguage];
end;

procedure TFormSpec_SpravOneLevel.ActionDELExecute(Sender: TObject);
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


procedure TFormSpec_SpravOneLevel.cxGridPrKSpravOneLevelDBTableView1DblClick(
  Sender: TObject);
begin
  if FormStyle = fsNormal
   then dxBarLargeButtonVibrat.Click
   else dxBarLargeButtonChange.Click;
end;

procedure TFormSpec_SpravOneLevel.FormResize(Sender: TObject);
begin
  inherited;
  SearchEdit.Width:=SearchPanel.Width-180;
  SearchBtn.Left:=SearchPanel.Width-90;
end;

procedure TFormSpec_SpravOneLevel.SearchEditFocusChanged(Sender: TObject);
begin
  inherited;
  if SearchEdit.Focused then
    begin
      ActionDEL.ShortCut:=scNone;
      ActionVibrat.ShortCut:=scNone;
    end
  else
    begin
      ActionDEL.ShortCut:=$2E;  //i.e. Del
      ActionVibrat.ShortCut:=$D;//i.e. Enter 
    end;
end;

procedure TFormSpec_SpravOneLevel.SearchByFilter;
begin
  cxGridPrKSpravOneLevelDBTableView1.DataController.DataSet.Filtered := False;
  cxGridPrKSpravOneLevelDBTableView1.DataController.DataSet.Filter := 'UPPER(NAME) LIKE ''' +
                       AnsiUpperCase(SearchEdit.Text) + '%'' and NAME is not null';
  cxGridPrKSpravOneLevelDBTableView1.DataController.DataSet.Filtered := True;
  cxGridPrKSpravOneLevelDBTableView1.ViewData.Expand(False);
end;

procedure TFormSpec_SpravOneLevel.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then SearchByFilter;
end;

procedure TFormSpec_SpravOneLevel.SearchBtnClick(Sender: TObject);
begin
  inherited;
  SearchByFilter;
end;

end.
