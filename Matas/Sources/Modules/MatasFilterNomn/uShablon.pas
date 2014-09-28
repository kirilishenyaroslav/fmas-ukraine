unit uShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, uGroupTMC,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, uMatasUtils;

type
  TShablonForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    pnl1: TPanel;
    btnacInsert: TSpeedButton;
    btnClose: TSpeedButton;
    btnDelete: TSpeedButton;
    actlst1: TActionList;
    actGetThis: TAction;
    actDelete: TAction;
    actClose: TAction;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ds1: TDataSource;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    pFIBTransaction1: TpFIBTransaction;
    pFIBStoredProc1: TpFIBStoredProc;
    DS_SHABLON: TpFIBDataSet;
    DS_SHABLONID_SHABLON: TFIBBCDField;
    DS_SHABLONNAME_SHABLON: TFIBStringField;
    procedure actCloseExecute(Sender: TObject);
    procedure actGetThisExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  ShablonForm: TShablonForm;

implementation

{$R *.dfm}

procedure TShablonForm.actCloseExecute(Sender: TObject);
begin
Close;
end;

procedure TShablonForm.actGetThisExecute(Sender: TObject);
begin
  ModalResult:=mrOk;

end;

procedure TShablonForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
actGetThis.Execute;
end;

procedure TShablonForm.actDeleteExecute(Sender: TObject);
begin
 if agMessageDlg('Видалення', 'Ви дійсно бажаєте видалити шаблон?', mtConfirmation, [mbYes, mbNo]) = ID_YES  then
  begin
 try
   pFIBTransaction1.StartTransaction;
   pFIBStoredProc1.StoredProcName:='MAT_SHABLON_DEL';
   pFIBStoredProc1.Prepare;
   pFIBStoredProc1.ParamByName('ID_SHABLON').AsInteger:=DS_SHABLONID_SHABLON.AsInteger;
   pFIBStoredProc1.ExecProc;
   pFIBStoredProc1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    pFIBStoredProc1.Transaction.Rollback;
    Exit;
   end;
  end;

   try
   pFIBTransaction1.StartTransaction;
   pFIBStoredProc1.StoredProcName:='MAT_INV_OBJECT_SHABLON_DEL';
   pFIBStoredProc1.Prepare;
   pFIBStoredProc1.ParamByName('ID_SHABLON').AsInteger:=DS_SHABLONID_SHABLON.AsInteger;
   pFIBStoredProc1.ExecProc;
   pFIBStoredProc1.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    pFIBStoredProc1.Transaction.Rollback;
    Exit;
   end;
  end;
 DS_SHABLON.CloseOpen(false);
 end;
end;

end.
