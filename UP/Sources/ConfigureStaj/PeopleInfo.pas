unit PeopleInfo;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, ExtCtrls, cxLookAndFeelPainters,
    StdCtrls, cxButtons, dxBar, dxBarExtItems, ImgList, ActnList;

type
    TfrmPeopleInfo = class(TForm)
        Panel2: TPanel;
        Panel3: TPanel;
        cxGrid3: TcxGrid;
        RaiseView: TcxGridDBTableView;
        cxGridDBColumn4: TcxGridDBColumn;
        cxGridDBColumn6: TcxGridDBColumn;
        cxGridDBColumn7: TcxGridDBColumn;
        cxGridDBColumn5: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        cxOk: TcxButton;
        cxCancel: TcxButton;
        cxStyleRepository1: TcxStyleRepository;
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
        cxStyle15: TcxStyle;
        cxStyle16: TcxStyle;
        cxStyle17: TcxStyle;
        cxStyle18: TcxStyle;
        cxStyle19: TcxStyle;
        cxStyle20: TcxStyle;
        cxStyle21: TcxStyle;
        cxStyle22: TcxStyle;
        cxStyle23: TcxStyle;
        cxStyle24: TcxStyle;
        cxStyle25: TcxStyle;
        cxStyle26: TcxStyle;
        cxStyle27: TcxStyle;
        cxStyle28: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        dxBarManager1: TdxBarManager;
        dxAdd: TdxBarLargeButton;
        dxDel: TdxBarLargeButton;
        dxRefresh: TdxBarLargeButton;
        dxPeriodEdit: TdxBarLargeButton;
        ImageList1: TImageList;
        ActionList1: TActionList;
        InsAct: TAction;
        DelAct: TAction;
        RefreshAct: TAction;
        PeriodEditAct: TAction;
        OkAct: TAction;
        CancelAct: TAction;
        procedure cxAddClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure cxDateEditClick(Sender: TObject);
        procedure cxRefreshClick(Sender: TObject);
        procedure cxDelClick(Sender: TObject);
        procedure RaiseViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure InsActExecute(Sender: TObject);
        procedure DelActExecute(Sender: TObject);
        procedure RefreshActExecute(Sender: TObject);
        procedure PeriodEditActExecute(Sender: TObject);
        procedure OkActExecute(Sender: TObject);
        procedure CancelActExecute(Sender: TObject);
    private
        KeySession: Int64;
    { Private declarations }
    public
        function GetKeySession: Variant;
        procedure CloseOpenPeopleTemp(key_ses: Integer);
    { Public declarations }
    end;

var
    frmPeopleInfo: TfrmPeopleInfo;

implementation

{$R *.dfm}

uses PeopleFilter, ConfigStaj, DMStModule, PeriodEdit, BaseTypes;

procedure TfrmPeopleInfo.CloseOpenPeopleTemp(key_ses: Integer);
begin
   {DModule.PeopleTempSet.Close;
   DModule.PeopleTempSet.ParamByName('KEY_SESSION').AsInt64:=key_ses;
   DModule.PeopleTempSet.Open;  }
end;

function TfrmPeopleInfo.GetKeySession: Variant;
begin
    Result := Self.KeySession;
end;

procedure TfrmPeopleInfo.cxAddClick(Sender: TObject);
var
    frm: TfrmPeopleFilter;
begin
    frm := TfrmPeopleFilter.Create(Self);
    if frm.ShowModal = mrOk then
    begin
      {DModule.StorProc.StoredProcName:='UP_PEOPL_CALC_TMP_STJ_INS';
      DModule.StorProc.Transaction.StartTransaction;
      DModule.StorProc.Prepare;
      DModule.StorProc.ParamByName('id_man').AsInteger:=frm.qfPeople.Value;
      DModule.StorProc.ParamByName('KEY_SESSION').AsInteger:=GetKeySession;
      DModule.StorProc.ExecProc;
      DModule.StorProc.Transaction.Commit;}
    end;
    CloseOpenPeopleTemp(GetKeySession);
    frm.Free;
end;

procedure TfrmPeopleInfo.FormCreate(Sender: TObject);
begin
   {DModule.StorProc.StoredProcName:='PUB_GET_ID_BY_GEN';
   DModule.StorProc.Transaction.StartTransaction;
   DModule.StorProc.Prepare;
   DModule.StorProc.ParamByName('GENERATOR_NAME').AsString:='GEN_UP_KEY_SESION_TEMP_STAJ_ID';
   DModule.StorProc.ParamByName('STEP').AsInteger:=1;
   DModule.StorProc.ExecProc;
   Self.KeySession:=DModule.StorProc.FieldByName('RET_VALUE').AsInt64;
   DModule.StorProc.Transaction.Commit;}
end;

procedure TfrmPeopleInfo.cxDateEditClick(Sender: TObject);
var
    frm: TfrmPeriodEdit;
    Id_: Integer;
begin
   { if DModule.PeopleTempSet.IsEmpty then exit;
    Id_:=DModule.PeopleTempSet['id_temp'];
    frm:=TfrmPeriodEdit.Create(Self);
    frm.DatePeriodBeg.Date:=DModule.PeopleTempSet['DATE_BEG'];
    frm.DatePeriodEnd.Date:=DModule.PeopleTempSet['DATE_END'];
    if frm.ShowModal=mrOk then
    begin
       DModule.StorProc.StoredProcName:='UP_PEOPL_TMP_STAJ_PERIOD_UPD';
       DModule.StorProc.Transaction.StartTransaction;
       DModule.StorProc.Prepare;
       DModule.StorProc.ParamByName('date_beg').Value:=frm.DatePeriodBeg.Date;
       DModule.StorProc.ParamByName('date_end').Value:=frm.DatePeriodEnd.Date;
       DModule.StorProc.ParamByName('id_').AsInteger:=id_;
       DModule.StorProc.ExecProc;
       DModule.StorProc.Transaction.Commit;
    end;  }
    CloseOpenPeopleTemp(GetKeySession);
    frm.Free;
end;

procedure TfrmPeopleInfo.cxRefreshClick(Sender: TObject);
begin
    CloseOpenPeopleTemp(GetKeySession);
end;

procedure TfrmPeopleInfo.cxDelClick(Sender: TObject);
var
    id_: Int64;
begin
   {if DModule.PeopleCalcSet.IsEmpty then Exit;
   id_:=DModule.PeopleTempSet['id_temp'];
   if agMessageDlg('”вага!','¬и д≥йсно бажаЇте видалити запис?',mtInformation, [mbYes, mbNo])=mrYes then
   begin
      DModule.StorProc.StoredProcName:='UP_PEOPL_CALC_TMP_STJ_DEL';
      DModule.StorProc.Transaction.StartTransaction;
      DModule.StorProc.Prepare;
      DModule.StorProc.ParamByName('ID_').AsInt64:=id_;
      DModule.StorProc.ParamByName('KEY_SESSION').AsInt64:=GetKeySession;
      try
        DModule.StorProc.ExecProc;
        DModule.StorProc.Transaction.Commit;
      except on e:exception
      do begin
            agMessageDlg('”вага!',e.Message, mtInformation, [mbOK]);
            DModule.StorProc.Transaction.Rollback;
         end;
      end;
      CloseOpenPeopleTemp(GetKeySession);
   end; }
end;

procedure TfrmPeopleInfo.RaiseViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
   {If (( Key = VK_F12) and (ssShift in Shift))
   Then ShowInfo(DModule.PeopleTempSet); }
end;

procedure TfrmPeopleInfo.InsActExecute(Sender: TObject);
var
    frm: TfrmPeopleFilter;
begin
    frm := TfrmPeopleFilter.Create(Self);
    if frm.ShowModal = mrOk then
    begin
      {DModule.StorProc.StoredProcName:='UP_PEOPL_CALC_TMP_STJ_INS';
      DModule.StorProc.Transaction.StartTransaction;
      DModule.StorProc.Prepare;
      DModule.StorProc.ParamByName('id_man').AsInteger:=frm.qfPeople.Value;
      DModule.StorProc.ParamByName('KEY_SESSION').AsInteger:=GetKeySession;
      //DModule.StorProc.ParamByName('DATE_BEG').AsDate:=frm.DateBegF.Date;
      //DModule.StorProc.ParamByName('DATE_END').AsDate:=frm.DateEndF.Date;
      try
        DModule.StorProc.ExecProc;
        DModule.StorProc.Transaction.Commit;
      except on e:exception
      do begin
          agMessageDlg('”вага!', e.Message, mtInformation, [mbOK]);
          DModule.StorProc.Transaction.Rollback;
         end;
      end;}
    end;
    CloseOpenPeopleTemp(GetKeySession);
    frm.Free;
end;

procedure TfrmPeopleInfo.DelActExecute(Sender: TObject);
var
    id_: Int64;
begin
   {if DModule.PeopleTempSet.IsEmpty then Exit;
   id_:=DModule.PeopleTempSet['id_temp'];
   if agMessageDlg('”вага!','¬и д≥йсно бажаЇте видалити запис?',mtInformation, [mbYes, mbNo])=mrYes then
   begin
      DModule.StorProc.StoredProcName:='UP_PEOPL_CALC_TMP_STJ_DEL';
      DModule.StorProc.Transaction.StartTransaction;
      DModule.StorProc.Prepare;
      DModule.StorProc.ParamByName('ID_').AsInt64:=id_;
      DModule.StorProc.ParamByName('ALL_').AsInt64:=0;
      //DModule.StorProc.ParamByName('KEY_SESSION').AsInt64:=GetKeySession;
      try
        DModule.StorProc.ExecProc;
        DModule.StorProc.Transaction.Commit;
      except on e:exception
      do begin
            agMessageDlg('”вага!',e.Message, mtInformation, [mbOK]);
            DModule.StorProc.Transaction.Rollback;
         end;
      end;
      CloseOpenPeopleTemp(GetKeySession);
   end; }

end;

procedure TfrmPeopleInfo.RefreshActExecute(Sender: TObject);
begin
    CloseOpenPeopleTemp(GetKeySession);
end;

procedure TfrmPeopleInfo.PeriodEditActExecute(Sender: TObject);
var
    frm: TfrmPeriodEdit;
    Id_: Integer;
begin
    {if DModule.PeopleTempSet.IsEmpty then exit;
    Id_:=DModule.PeopleTempSet['id_temp'];
    frm:=TfrmPeriodEdit.Create(Self);
    frm.DatePeriodBeg.Date:=DModule.PeopleTempSet['DATE_BEG'];
    frm.DatePeriodEnd.Date:=DModule.PeopleTempSet['DATE_END'];
    if frm.ShowModal=mrOk then
    begin
       DModule.StorProc.StoredProcName:='UP_PEOPL_TMP_STAJ_PERIOD_UPD';
       DModule.StorProc.Transaction.StartTransaction;
       DModule.StorProc.Prepare;
       DModule.StorProc.ParamByName('date_beg').Value:=frm.DatePeriodBeg.Date;
       DModule.StorProc.ParamByName('date_end').Value:=frm.DatePeriodEnd.Date;
       DModule.StorProc.ParamByName('id_').AsInteger:=id_;
       try
          DModule.StorProc.ExecProc;
          DModule.StorProc.Transaction.Commit;
       except on e:exception
       do begin
             agMessageDlg('”ага!',e.Message, mtInformation, [mbOK]);
             DModule.StorProc.Transaction.Rollback;
          end;
       end;
    end;
    CloseOpenPeopleTemp(GetKeySession);
    frm.Free;    }
end;

procedure TfrmPeopleInfo.OkActExecute(Sender: TObject);
begin
   //ModalResult:=mrOk;
    Close;
end;

procedure TfrmPeopleInfo.CancelActExecute(Sender: TObject);
begin
   { DModule.StorProc.StoredProcName:='UP_PEOPL_CALC_TMP_STJ_DEL';
    DModule.StorProc.Transaction.StartTransaction;
    DModule.StorProc.Prepare;
    DModule.StorProc.ParamByName('all_').AsInteger:=1;
    DModule.StorProc.ParamByName('key_session').AsInteger:=GetKeySession;
    try
      DModule.StorProc.ExecProc;
      DModule.StorProc.Transaction.Commit;
    except on e:exception
    do begin
          agMessageDlg('”вага!', e.Message, mtInformation, [mbOK]);
          DModule.StorProc.Transaction.Rollback;
       end;
    end;      }
    ModalResult := mrCancel;
end;

end.
