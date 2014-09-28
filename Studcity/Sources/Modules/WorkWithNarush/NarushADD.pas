unit NarushADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StudcityConst, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxMemo, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, DB,
  FIBDataSet, pFIBDataSet;

type
  TfrmNaruskADD = class(TForm)
    cxButtonOk: TcxButton;
    cxButtonExit: TcxButton;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxMemoName: TcxMemo;
    cxLabelName: TcxLabel;
    pFIBDataSetLoadNarush: TpFIBDataSet;
    procedure cxButtonExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Aowner:Tcomponent;id_narush:Int64;id_vzusk:Int64;Language:Integer);overload;
    { Public declarations }
  end;

var
  frmNaruskADD: TfrmNaruskADD;
  id_n,id_v:Int64;
  lang:Integer;
implementation
uses
  SpNarush;
{$R *.dfm}
constructor TfrmNaruskADD.Create(Aowner:Tcomponent;id_narush:Int64;id_vzusk:Int64;Language:Integer);
begin
  Inherited Create(Aowner);
  id_n:=id_narush;
  id_v:=id_vzusk;
end;

procedure TfrmNaruskADD.cxButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNaruskADD.FormCreate(Sender: TObject);
begin
cxButtonOk.Caption:=StudcityConst.Studcity_ACTION_SAVE_CONST_EX[Lang];
cxButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[Lang];
cxLabelShortName.Caption:=StudcityConst.Studcity_SpNarushShort_EX[Lang];
cxLabelName.Caption:=StudcityConst.Studcity_SpNarushName_EX[Lang];
if (id_n=-1) then//добавляем нарушение
  begin
    Caption:=StudcityConst.Studcity_SpNarushADD_EX[Lang];
  end;
if (id_n>0) then// редактируем нарушение
  begin
    Caption:=StudcityConst.Studcity_SpNarushEdit_EX[Lang];
    pFIBDataSetLoadNarush.Database:=TfrmSpNarush(Self.Owner).Database;
    pFIBDataSetLoadNarush.Transaction:=TfrmSpNarush(Self.Owner).ReadTransaction;
    pFIBDataSetLoadNarush.Active:=false;
    pFIBDataSetLoadNarush.ParamByName('param_narush').AsInt64:=id_n;
    pFIBDataSetLoadNarush.Active:=true;
    cxTextEditShortName.Text:=pFIBDataSetLoadNarush.FieldValues['short_name'];
    cxMemoName.Lines.Add(pFIBDataSetLoadNarush.FieldValues['narush'])
  end;

end;

procedure TfrmNaruskADD.cxButtonOkClick(Sender: TObject);
begin
if (id_n=-1) then//добавляем нарушение
  begin
    if (cxTextEditShortName.Text='')or (cxMemoName.Text='') then
      begin
        exit;
      end;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Database:=TfrmSpNarush(Self.Owner).Database;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Transaction:=TfrmSpNarush(Self.Owner).WriteTransaction;
    TfrmSpNarush(Self.Owner).WriteTransaction.StartTransaction;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.StoredProcName:='ST_SP_NARUSH_INSERT';
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Prepare;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('id_vzysk').AsInt64:=id_v;    
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('name_narush').AsString:=cxMemoName.Text;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('short_name').AsString:=cxTextEditShortName.Text;
    try
      TfrmSpNarush(Self.Owner).pFIBStoredProc.ExecProc;
      except
        begin
          TfrmSpNarush(Self.Owner).WriteTransaction.Rollback;
        end;
     end;
     TfrmSpNarush(Self.Owner).WriteTransaction.Commit;
     Close;
  end;
if (id_n>0) then//РЕДАКТИРУЕМ нарушение
  begin
    if (cxTextEditShortName.Text='')or (cxMemoName.Text='') then
      begin
        exit;
      end;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Database:=TfrmSpNarush(Self.Owner).Database;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Transaction:=TfrmSpNarush(Self.Owner).WriteTransaction;
    TfrmSpNarush(Self.Owner).WriteTransaction.StartTransaction;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.StoredProcName:='ST_SP_NARUSH_EDIT';
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Prepare;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('id_narush').AsInt64:=id_n;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('name_narush').AsString:=cxMemoName.Text;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('short_name').AsString:=cxTextEditShortName.Text;
    try
      TfrmSpNarush(Self.Owner).pFIBStoredProc.ExecProc;
      except
        begin
          TfrmSpNarush(Self.Owner).WriteTransaction.Rollback;
        end;
     end;
     TfrmSpNarush(Self.Owner).WriteTransaction.Commit;
     Close;
  end;

end;

end.
