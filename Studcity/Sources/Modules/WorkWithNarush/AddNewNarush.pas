unit AddNewNarush;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckBox, cxDropDownEdit, cxCalendar, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxLabel,StudcityConst, DB, FIBDataSet, pFIBDataSet,
  LoadPackegeStudCity, cxMemo;

type
  TfrmAddNewnarush = class(TForm)
    cxButtonEditNarush: TcxButtonEdit;
    cxDateEditNarush: TcxDateEdit;
    cxCheckBoxOtrab: TcxCheckBox;
    cxButtonOk: TcxButton;
    cxButtonExit: TcxButton;
    cxLabelNarush: TcxLabel;
    cxLabelDateNarush: TcxLabel;
    pFIBDataSet: TpFIBDataSet;
    Notes_Memo: TcxMemo;
    PlaceNarushMemo: TcxMemo;
    AcceptedArrMemo: TcxMemo;
    cxLabelPlace: TcxLabel;
    cxLabeAcceptArrang: TcxLabel;
    cxLabelNote: TcxLabel;
    procedure cxButtonExitClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure cxButtonEditNarushPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    Constructor Create (AOwner:TComponent;id_record:Variant;Language:Integer);overload;
    { Public declarations }
  end;

var
  frmAddNewnarush: TfrmAddNewnarush;
  id_rec:Int64;
  id_narush:Int64;
  lang:Integer;
implementation
uses
  MainNarush;
{$R *.dfm}
Constructor TfrmAddNewnarush.Create (AOwner:TComponent;id_record:Variant;Language:Integer);
begin
  Inherited Create(AOwner);
  lang:=Language;
  id_rec:=id_record;
  Caption                   :=StudcityConst.Studcity_SpNarushADDNew_EX[lang];
  cxButtonOk.Caption        :=StudcityConst.Studcity_ACTION_SAVE_CONST_EX[lang];
  cxButtonExit.Caption      :=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
  cxLabelNarush.Caption     :=StudcityConst.Studcity_SpNarushShort_EX[lang];
  cxLabelDateNarush.Caption :=StudcityConst.Studcity_SpNarushDate_EX[lang];
  cxLabelNote.Caption       := StudcityConst.Studcity_ReportsST_LISTPROPN134ADR[lang];
  cxCheckBoxOtrab.Properties.Caption:=StudcityConst.Studcity_SpNarushOTRAB_EX[lang];

  if (id_record>1) then
    begin
      Caption:='Редактирование нарушения';
      pFIBDataSet.Database:=TfrmMainNarush(Self.Owner).pFIBDatabase;
      pFIBDataSet.Transaction:=TfrmMainNarush(Self.Owner).ReadTransaction;
      pFIBDataSet.Active:=false;
      pFIBDataSet.ParamByName('PARAM_RECORD').AsInt64:=id_rec;
      pFIBDataSet.Active:=true;
      cxButtonEditNarush.Text:=pFIBDataSet.FieldByName('NARUSH').AsString;
      id_narush:=pFIBDataSet.FieldByName('ID_NARUSH').asVariant;
      cxDateEditNarush.Date := pFIBDataSet.FieldByName('DATE_NARUS').AsDateTime;
      if pFIBDataSet['NOTES'] <> null
       then Notes_Memo.Text := pFIBDataSet.FieldByName('NOTES').AsString;

      if pFIBDataSet['PLACE_NARUSH'] <> null
       then PlaceNarushMemo.Text := pFIBDataSet.FieldByName('PLACE_NARUSH').AsString;
               
      if pFIBDataSet['ACCEPTED_ARRANG'] <> null
       then AcceptedArrMemo.Text := pFIBDataSet.FieldByName('ACCEPTED_ARRANG').AsString;
       
      if pFIBDataSet.FieldByName('OTRAB').AsInteger=0 then
        begin
          cxCheckBoxOtrab.Checked:=false;
        end
        else
        begin
          cxCheckBoxOtrab.Checked:=true;
        end;

    end;
end;
procedure TfrmAddNewnarush.cxButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddNewnarush.cxButtonOkClick(Sender: TObject);
begin
  if (id_rec=-1) then//добавляем нарушение
  begin
    if (cxButtonEditNarush.Text='')or (DateToStr(cxDateEditNarush.Date)='00.00.0000') then
      begin
        exit;
      end;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.Database:=TfrmMainNarush(Self.Owner).pFIBDatabase;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.Transaction:=TfrmMainNarush(Self.Owner).WriteTransaction;
    TfrmMainNarush(Self.Owner).WriteTransaction.StartTransaction;

    TfrmMainNarush(Self.Owner).pFIBStoredProc.StoredProcName:='ST_DT_NARUSH_INSERT';
    TfrmMainNarush(Self.Owner).pFIBStoredProc.Prepare;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('ID_KOD').AsInt64:=TfrmMainNarush(Self.Owner).id_people_n;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('DATE_NARUS').AsDateTime:=cxDateEditNarush.Date;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('OTRAB').AsInteger:=0;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('ID_NARUSH').AsInt64:=id_narush;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('NOTES').AsString := Notes_Memo.Text;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('PLACE_NARUSH').AsString := PlaceNarushMemo.Text;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('ACCEPTED_ARRANG').AsString := AcceptedArrMemo.Text;


    if cxCheckBoxOtrab.Checked=true then
      begin
        TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('OTRAB').AsInteger:=1;
      end;

    try
      TfrmMainNarush(Self.Owner).pFIBStoredProc.ExecProc;
      except
        begin
          TfrmMainNarush(Self.Owner).WriteTransaction.Rollback;
          ShowMessage('Ошибка добавления');
          Exit;
        end;
     end;
     TfrmMainNarush(Self.Owner).WriteTransaction.Commit;

     Close;
  end;

  if (id_rec>1) then//Редактируем нарушение
  begin
    if (cxButtonEditNarush.Text='')or (DateToStr(cxDateEditNarush.Date)='00.00.0000') then
      begin
        exit;
      end;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.Database:=TfrmMainNarush(Self.Owner).pFIBDatabase;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.Transaction:=TfrmMainNarush(Self.Owner).WriteTransaction;
    TfrmMainNarush(Self.Owner).WriteTransaction.StartTransaction;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.StoredProcName:='ST_DT_NARUSH_EDIT';
    TfrmMainNarush(Self.Owner).pFIBStoredProc.Prepare;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('ID_RECORD').AsInt64:=id_rec;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('ID_NARUSH').AsInt64:=id_narush;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('DATE_NARUS').AsDateTime:=cxDateEditNarush.Date;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('NOTES').AsString := Notes_Memo.Text;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('PLACE_NARUSH').AsString := PlaceNarushMemo.Text;
    TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('ACCEPTED_ARRANG').AsString := AcceptedArrMemo.Text;
    if cxCheckBoxOtrab.Checked=false then
      begin
        TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('OTRAB').AsInteger:=0;
      end
      else
      begin
        TfrmMainNarush(Self.Owner).pFIBStoredProc.ParamByName('OTRAB').AsInteger:=1;
      end;

    try
      TfrmMainNarush(Self.Owner).pFIBStoredProc.ExecProc;
      except
        begin
          TfrmMainNarush(Self.Owner).WriteTransaction.Rollback;
        end;
     end;
     TfrmMainNarush(Self.Owner).WriteTransaction.Commit;
     Close;
  end;
end;

procedure TfrmAddNewnarush.cxButtonEditNarushPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  result:Variant;
begin
result:=LoadPackegeStudCity.LoadSpNarush(self,TfrmMainNarush(self.owner).pFIBDatabase.Handle,fsNormal);
if VarArrayDimCount(result)>0 then
  begin
    id_narush:=result[0][0];
    cxButtonEditNarush.Text:=VarToStr(result[0][1]);
  end;
end;

end.
