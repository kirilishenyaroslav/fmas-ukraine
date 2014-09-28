unit SelectStaj;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, FIBQuery, pFIBQuery, FIBDataSet,
    pFIBDataSet, FIBDatabase, pFIBDatabase, cxGridTableView, ActnList,
    Buttons, ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
    cxClasses, cxControls, cxGridCustomView, cxGrid, uFormControl,
    ComCtrls, cxTextEdit, cxCalendar, pFibStoredProc, StdCtrls,
    cxCheckBox, ImgList, dxBar, dxBarExtItems;

type
    TfrmSelectStaj = class(TForm)
        cxGrid4: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridDBColumn11: TcxGridDBColumn;
        cxGridLevel3: TcxGridLevel;
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
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        ActionList1: TActionList;
        InsAct: TAction;
        ModifyAct: TAction;
        DelAct: TAction;
        RefreshAct: TAction;
        EditConfAct: TAction;
        SeeConfAct: TAction;
        CloseAct: TAction;
        cxGridDBTableView1DBColumn2: TcxGridDBColumn;
        cxGridDBTableView1DBColumn3: TcxGridDBColumn;
        ReadTransaction: TpFIBTransaction;
        DBase: TpFIBDatabase;
        WriteTransaction: TpFIBTransaction;
        SelectStaj: TpFIBDataSet;
        SelectStajSource: TDataSource;
        StorProc: TpFIBStoredProc;
        cxGridDBTableView1DBColumn4: TcxGridDBColumn;
        dxBarManager1: TdxBarManager;
        btnAdd: TdxBarLargeButton;
        btnEdit: TdxBarLargeButton;
        btnDel: TdxBarLargeButton;
        btnEditConf: TdxBarLargeButton;
        btnRefresh: TdxBarLargeButton;
        btnSeeConf: TdxBarLargeButton;
        btnClose: TdxBarLargeButton;
        ImgList: TImageList;
        cxGridDBTableView1DBColumn5: TcxGridDBColumn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure SpeedButton3Click(Sender: TObject);
        procedure cxGridDBTableView1DblClick(Sender: TObject);
        procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure EditConfActExecute(Sender: TObject);
        procedure SeeConfActExecute(Sender: TObject);
        procedure InsActExecute(Sender: TObject);
        procedure ModifyActExecute(Sender: TObject);
        procedure RefreshActExecute(Sender: TObject);
        procedure DelActExecute(Sender: TObject);
        procedure CloseActExecute(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

implementation

uses ConfigStaj, EditStaj, BaseTypes, WinSock, AccMgmt, UpKernelUnit,
    DMStModule;

{$R *.dfm}

procedure TfrmSelectStaj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
      //DModule.Free;
end;

procedure TfrmSelectStaj.SpeedButton3Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmSelectStaj.cxGridDBTableView1DblClick(Sender: TObject);
begin
    //AddButtonClick(Self);
    EditConfActExecute(Self);
end;

procedure TfrmSelectStaj.cxGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then ShowInfo(SelectStaj);
end;

procedure TfrmSelectStaj.EditConfActExecute(Sender: TObject);
var
    frm: TfrmConfigStaj;
    id_staj: Int64;
    Year_, Month_, Day_: Word;
    Check: Integer;
    Mrc: Double;
begin
    try
        Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Up_Sprav_Menu/7_Up_Sprav_Menu', 'CONFIGURE');
        if check <> 0 then
        begin
            agMessageDlg('Помилка!', 'Ви не маєте прав на виконання цієї дії! ', mtError, [mbOk]);
            exit;
        end;
        id_staj := SelectStaj['id_staj'];
        frm := TfrmConfigStaj.Create(Self);
        frm.Caption := 'Інформація по: ' + SelectStaj['NAME_STAJ'];
        DecodeDate(Date, Year_, Month_, Day_);
        if VarIsNull(SelectStaj['MIN_RAZMER_STAVKI']) then Mrc := 0
        else Mrc := SelectStaj['MIN_RAZMER_STAVKI'];
        frm.SetMinRateCount(Mrc);
        if VarIsNull(SelectStaj['MIN_RAZMER_STAVKI_SOVM']) then Mrc := 0
        else Mrc := SelectStaj['MIN_RAZMER_STAVKI_SOVM'];
        frm.SetMinRateCountSovm(Mrc);
        frm.FilterDateBeg.Date := Date;
    //frm.FilterDateBeg.Date:=EncodeDate(Year_,1,1);
        frm.FilterDateEnd.Date := EncodeDate(9999, 12, 31);
        frm.FiltLab.Visible := False;
        frm.StajTypePostSet.Close;
        frm.StajTypePostSet.ParamByName('id_staj').AsInt64 := id_staj;
        frm.StajTypePostSet.ParamByName('date_beg').AsDate := Date;
        frm.StajTypePostSet.ParamByName('date_end').AsDate := Date;
        frm.StajTypePostSet.Open;
        frm.PeopleCalcSet.Close;
        frm.PeopleCalcSet.ParamByName('id_staj').AsInt64 := id_staj;
        frm.PeopleCalcSet.ParamByName('date_beg').AsDate := Date;
        frm.PeopleCalcSet.ParamByName('date_end').AsDate := Date;
        frm.PeopleCalcSet.Open;
        frm.PeopleNCalcSet.Close;
        frm.PeopleNCalcSet.ParamByName('id_staj').AsInt64 := id_staj;
        frm.PeopleNCalcSet.ParamByName('date_beg').AsDate := Date;
        frm.PeopleNCalcSet.ParamByName('date_end').AsDate := Date;
        frm.PeopleNCalcSet.Open;
        frm.SetIdStaj(id_staj);
        frm.SetHND(DBase.Handle);
    except on e: exception
        do begin
            ShowMessage(e.Message);
        end;
    end;
    frm.ShowModal;
    frm.Free;
end;

procedure TfrmSelectStaj.SeeConfActExecute(Sender: TObject);
var
    frm: TfrmConfigStaj;
    id_staj: Int64;
    Year_, Month_, Day_: Word;
    Check: Integer;
begin
    try
        Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Up_Sprav_Menu/7_Up_Sprav_Menu', 'View');
        if check <> 0 then
        begin
            agMessageDlg('Помилка!', 'Ви не маєте прав на виконання цієї дії! ', mtError, [mbOk]);
            exit;
        end;
        id_staj := SelectStaj['id_staj'];
        frm := TfrmConfigStaj.Create(Self);
        frm.Caption := 'Інформація по: ' + SelectStaj['NAME_STAJ'];
        DecodeDate(Date, Year_, Month_, Day_);
        frm.FilterDateBeg.Date := Date;
   // frm.FilterDateBeg.Date:=EncodeDate(Year_,1,1);
        frm.FilterDateEnd.Date := EncodeDate(9999, 12, 31);
        frm.InstypeAct.Enabled := False;
        frm.InsPCalcAct.Enabled := False;
        frm.InsPNCalcAct.Enabled := False;
        frm.ModifyTypeAct.Enabled := False;
        frm.DelTypeAct.Enabled := False;
        frm.DelPCalcAct.Enabled := False;
        frm.DelPNCalcAct.Enabled := False;
    //frm.RefreshTypeAct.Enabled:=False;
    //frm.RefPCAlcAct.Enabled:=False;
   // frm.RefPNCalcAct.Enabled:=False;
        frm.PeriodEditCalcAct.Enabled := False;
        frm.PeriodEditNCalcAct.Enabled := False;
        frm.FiltLab.Visible := False;
        frm.btnAddType.Enabled := False;
        frm.btnEditType.Enabled := False;
        frm.btnDelType.Enabled := False;
        frm.btnPCalcIns.Enabled := False;
        frm.btnPCalcDel.Enabled := False;
        frm.btnPCalcEdit.Enabled := False;
        frm.btnPNCalcIns.Enabled := False;
        frm.btnPNCalcDel.Enabled := False;
        frm.btnPNCalcEdit.Enabled := False;
        frm.StajTypePostSet.Close;
        frm.StajTypePostSet.ParamByName('id_staj').AsInt64 := id_staj;
        frm.StajTypePostSet.ParamByName('date_beg').AsDate := Date;
        frm.StajTypePostSet.ParamByName('date_end').AsDate := Date;
        frm.StajTypePostSet.Open;
        frm.PeopleCalcSet.Close;
        frm.PeopleCalcSet.ParamByName('id_staj').AsInt64 := id_staj;
        frm.PeopleCalcSet.ParamByName('date_beg').AsDate := Date;
        frm.PeopleCalcSet.ParamByName('date_end').AsDate := Date;
        frm.PeopleCalcSet.Open;
        frm.PeopleNCalcSet.Close;
        frm.PeopleNCalcSet.ParamByName('id_staj').AsInt64 := id_staj;
        frm.PeopleNCalcSet.ParamByName('date_beg').AsDate := Date;
        frm.PeopleNCalcSet.ParamByName('date_end').AsDate := Date;
        frm.PeopleNCalcSet.Open;
        frm.SetIdStaj(id_staj);
    except on e: exception
        do begin
            ShowMessage(e.Message);
        end;
    end;
    frm.ShowModal;
    frm.Free;
end;

procedure TfrmSelectStaj.InsActExecute(Sender: TObject);
var
    frm: TfrmEditStaj;
    id_: Integer;
    IsUse: Integer;
    Check: integer;
    IsShtat: Integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Up_Sprav_Menu/7_Up_Sprav_Menu', 'Add');
    if check <> 0 then
    begin
        agMessageDlg('Помилка!', 'Ви не маєте прав на виконання цієї дії! ', mtError, [mbOk]);
        exit;
    end;
    frm := TfrmEditStaj.Create(Self);
    frm.Caption := 'Додати стаж';
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'INI_STAJ_INS';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('NAME_STAJ').AsString := frm.NameStajEdit.Text;
        StorProc.ParamByName('NAME_STAJ_CLEAR').AsString := frm.PrintNameStajEdit.Text;
        StorProc.ParamByName('IS_DEFAULT').AsString := 'F';
        if (frm.cMinOklad.Text = '') then
            StorProc.ParamByName('MIN_RAZMER_STAVKI').AsFloat := 0
        else
            StorProc.ParamByName('MIN_RAZMER_STAVKI').AsFloat := StrToFloat(frm.cMinOklad.Text);
        if (frm.cxMinRateSovm.Text = '') then
            StorProc.ParamByName('MIN_RAZMER_STAVKI_SOVM').AsFloat := 0
        else
            StorProc.ParamByName('MIN_RAZMER_STAVKI_SOVM').AsFloat := StrToFloat(frm.cxMinRateSovm.Text);
        if frm.IsUseStaj.Checked = true then IsUse := 1 else IsUse := 0;
        StorProc.ParamByName('IS_USE_PERSONIF').AsInteger := IsUse;
        if frm.IsShtat.Checked = true then IsShtat := 1 else IsShtat := 0;
        StorProc.ParamByName('IS_SHTAT').AsInteger := IsShtat;
        try
            StorProc.ExecProc;
            id_ := StorProc.FldByName['id_staj'].AsInteger;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;

    end;
    SelectStaj.Close;
    SelectStaj.Open;
    SelectStaj.Locate('ID_STAJ', id_, []);
end;

procedure TfrmSelectStaj.ModifyActExecute(Sender: TObject);
var
    frm: TfrmEditStaj;
    id_: Integer;
    IsUse: Integer;
    NameStr: string;
    Check: Integer;
    IsShtat: Integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Up_Sprav_Menu/7_Up_Sprav_Menu', 'Edit');
    if check <> 0 then
    begin
        agMessageDlg('Помилка!', 'Ви не маєте прав на виконання цієї дії! ', mtError, [mbOk]);
        exit;
    end;
    if SelectStaj.IsEmpty then Exit;
    frm := TfrmEditStaj.Create(Self);
    frm.Caption := 'Змінити стаж';
    id_ := SelectStaj['ID_STAJ'];
    NameStr := '';
    if VarIsNull(SelectStaj['NAME_STAJ']) then NameStr := ''
    else NameStr := SelectStaj['NAME_STAJ'];
    frm.NameStajEdit.Text := NameStr;
    NameStr := '';
    if VarIsNull(SelectStaj['NAME_STAJ_CLEAR']) then NameStr := ''
    else NameStr := SelectStaj['NAME_STAJ_CLEAR'];
    frm.PrintNameStajEdit.Text := NameStr;
    NameStr := '';
    if VarIsNull(SelectStaj['MIN_RAZMER_STAVKI']) then frm.cMinOklad.Text := '0' else
        frm.cMinOklad.Text := FloatToStr(SelectStaj['MIN_RAZMER_STAVKI']);
    if VarIsNull(SelectStaj['MIN_RAZMER_STAVKI_SOVM']) then frm.cxMinRateSovm.Text := '0' else
        frm.cxMinRateSovm.Text := FloatToStr(SelectStaj['MIN_RAZMER_STAVKI_SOVM']);
    if VarIsNull(SelectStaj['IS_USE_PERSONIF']) then frm.IsUseStaj.Checked := False else
        frm.IsUseStaj.Checked := SelectStaj['IS_USE_PERSONIF'];
    if VarIsNull(SelectStaj['IS_SHTAT']) then frm.IsShtat.Checked := False else
        frm.IsShtat.Checked := SelectStaj['IS_SHTAT'];
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'INI_STAJ_UPD';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_STAJ').AsInteger := id_;
        StorProc.ParamByName('NAME_STAJ').AsString := frm.NameStajEdit.Text;
        StorProc.ParamByName('NAME_STAJ_CLEAR').AsString := frm.PrintNameStajEdit.Text;
        StorProc.ParamByName('IS_DEFAULT').AsString := 'F';
        if (frm.cMinOklad.Text = '') then
            StorProc.ParamByName('MIN_RAZMER_STAVKI').AsFloat := 0
        else
            StorProc.ParamByName('MIN_RAZMER_STAVKI').AsFloat := StrToFloat(frm.cMinOklad.Text);
        if (frm.cxMinRateSovm.Text = '') then
            StorProc.ParamByName('MIN_RAZMER_STAVKI_SOVM').AsFloat := 0
        else
            StorProc.ParamByName('MIN_RAZMER_STAVKI_SOVM').AsFloat := StrToFloat(frm.cxMinRateSovm.Text);
        if frm.IsUseStaj.Checked = true then IsUse := 1 else IsUse := 0;
            StorProc.ParamByName('IS_USE_PERSONIF').AsInteger := IsUse;
        if frm.IsShtat.Checked = true then IsShtat := 1 else IsShtat := 0;
            StorProc.ParamByName('IS_SHTAT').AsInteger := IsShtat;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;

    end;
    SelectStaj.Close;
    SelectStaj.Open;
    SelectStaj.Locate('ID_STAJ', id_, []);
end;

procedure TfrmSelectStaj.RefreshActExecute(Sender: TObject);
begin
    SelectStaj.Close;
    SelectStaj.Open;
end;

procedure TfrmSelectStaj.DelActExecute(Sender: TObject);
var
    Check: Integer;
    id_: integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Up_Sprav_Menu/7_Up_Sprav_Menu', 'Del');
    if check <> 0 then
    begin
        agMessageDlg('Помилка!', 'Ви не маєте прав на виконання цієї дії! ', mtError, [mbOk]);
        exit;
    end;
    if SelectStaj.IsEmpty then Exit;
    id_ := SelectStaj['ID_STAJ'];
    if agMessageDlg('Увага!', 'Ви дійсно бажаєте видалити запис?', mtInformation, [mbYes, mbNo]) = mrYes then
    begin
        StorProc.StoredProcName := 'INI_STAJ_DEL';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_STAJ').AsInt64 := id_;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on e: exception
            do begin
                agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
    end;
    SelectStaj.Close;
    SelectStaj.Open;
end;

procedure TfrmSelectStaj.CloseActExecute(Sender: TObject);
begin
    Close;
end;

end.

