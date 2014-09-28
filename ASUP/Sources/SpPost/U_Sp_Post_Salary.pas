unit U_Sp_Post_Salary;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, Grids, DBGrids, DB, RxMemDS, ExtCtrls, SpCommon,
    U_SP_Post_Salary_Sum, U_SPPost_DataModule, StdCtrls, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
    cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet,
    pFIBDataSet, cxSplitter, cxCurrencyEdit, ActnList;

const
    STDSalaryStatus = 'Підтвердити зміни: F10 або Ctrl+End, закрити: Esc';

type
    TSP_Post_salary = class(TForm)
        Panel1: TPanel;
        PostSalarySource: TDataSource;
        RxMD_PS: TRxMemoryData;
        SBAdd: TSpeedButton;
        SBModif: TSpeedButton;
        SBDelete: TSpeedButton;
        RxBaseSalaries: TRxMemoryData;
        ButtonPanel: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        RxMD_Raises: TRxMemoryData;
        SalaryGridDBTableView1: TcxGridDBTableView;
        SalaryGridLevel1: TcxGridLevel;
        SalaryGrid: TcxGrid;
        cxStyleRepository1: TcxStyleRepository;
        SalaryGridDBTableView1DBColumn1: TcxGridDBColumn;
        RxMD_PSname_post_salary: TStringField;
        RxMD_PSpps_koef: TStringField;
        RxMD_PSid_post_salary: TIntegerField;
        RxBaseSalariesname_post_base_salary: TStringField;
        RxBaseSalariesbase_salary_min: TCurrencyField;
        RxBaseSalariesbase_salary_max: TCurrencyField;
        RxBaseSalariesdate_beg: TDateField;
        RxBaseSalariesdate_end: TDateField;
        RxBaseSalariesid_post_base_salary: TIntegerField;
        RxMD_Raisesid_post_base_salary: TIntegerField;
        RxMD_Raisesname_post_salary: TVariantField;
        RxMD_Raisespps_koef: TStringField;
        RxMD_Raisesid_raise: TIntegerField;
        RxMD_Raisesid_post_salary: TIntegerField;
        DataSource2: TDataSource;
        RxMD_Raise: TRxMemoryData;
        RxMD_Raiseid_raise: TIntegerField;
        RaisePanel: TPanel;
        Panel4: TPanel;
        SB_Add: TSpeedButton;
        SB_Del: TSpeedButton;
        cxSplitter1: TcxSplitter;
        SalaryGridDBTableView1DBColumn2: TcxGridDBColumn;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        RaiseGrid: TcxGrid;
        RaiseGridDBTableView1: TcxGridDBTableView;
        RaiseGridDBTableView1DBColumn1: TcxGridDBColumn;
        RaiseGridDBTableView1DBColumn4: TcxGridDBColumn;
        RaiseGridDBTableView1DBColumn5: TcxGridDBColumn;
        RaiseGridDBTableView1DBColumn6: TcxGridDBColumn;
        RaiseGridLevel1: TcxGridLevel;
        RxMD_Raisename: TStringField;
        RxMD_Raisepercent: TFloatField;
        RxMD_Raisedate_beg: TDateField;
        RxMD_Raisedate_end: TDateField;
        RxMD_Raisespercent: TFloatField;
        RxMD_Raisesdate_beg: TDateField;
        RxMD_Raisesdate_end: TDateField;
        RxMD_Raisesname: TStringField;
        ModifyRaiseButton: TSpeedButton;
        StatusPanel: TPanel;
        ActionList1: TActionList;
        AcceptAction: TAction;
        InsertAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        CancelAction: TAction;
        RXSalarySum: TRxMemoryData;
        StringField1: TStringField;
        CurrencyField1: TCurrencyField;
        CurrencyField2: TCurrencyField;
        DateField1: TDateField;
        DateField2: TDateField;
        IntegerField1: TIntegerField;
        cxGrid1: TcxGrid;
        SalarySumView: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        Panel2: TPanel;
        SalarySum: TDataSource;
        RxMD_PSDisplay_Name: TStringField;
        procedure FormShow(Sender: TObject);
        procedure SBAddClick(Sender: TObject);
        procedure SBModifClick(Sender: TObject);
        procedure SBDeleteClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure RxMD_PSAfterScroll(DataSet: TDataSet);
        procedure SB_AddClick(Sender: TObject);
        procedure SB_DelClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure SalaryGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure RaiseGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ModifyRaiseButtonClick(Sender: TObject);
        procedure SalaryGridExit(Sender: TObject);
        procedure SalaryGridEnter(Sender: TObject);
        procedure RaiseGridEnter(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure AcceptActionExecute(Sender: TObject);
        procedure InsertActionExecute(Sender: TObject);
        procedure ModifyActionExecute(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
    private
        BlockRaiseChange: Boolean;
        procedure Refresh;
        procedure RecalcSalarySum;
        function SalaryDisplayName(Name_Post_Salary: Variant): string;
    public
        DMod: TDMSPPost;
        id_bs, id_s, id: integer;
        Add: Boolean;
    { Public declarations }
    end;

var
    SP_Post_salary: TSP_Post_salary;

implementation

uses uCommonSp, U_Raise_Add, qFTools;

{$R *.dfm}

procedure TSP_Post_salary.FormShow(Sender: TObject);
var pps_koef, nameps: Variant;
begin
 //pFIBDS_Raise.Database:=DMod.FIBDatabase;
 // pFIBDS_Result.Database:=DMod.FIBDatabase;

    BlockRaiseChange := True;
    if RxMD_Raises.IsEmpty then
    begin
        RxMD_PS.AfterScroll := RxMD_PSAfterScroll;
        Exit;
    end;

    RxMD_Raises.Open;
    RxMD_Raises.SortOnFields('id_post_salary');
    RxMD_PS.Open;
    RxMD_Raises.First;
//  ShowInfo(RxMD_Raises);
    while not RxMD_Raises.Eof do
    begin
        id_s := RxMD_Raises['id_post_salary'];
        pps_koef := RxMD_Raises['pps_koef'];
        nameps := RxMD_Raises['name_post_salary'];
        RxMD_Raises.Next;
//    ShowInfo(RxMD_Raises);
        if ((id_s <> RxMD_Raises['id_post_salary']) or RxMD_Raises.Eof) then
        begin
            RxMD_PS.Append;
            RxMD_PS['pps_koef'] := pps_koef;
            RxMD_PS['name_post_salary'] := nameps;
            RxMD_PS['Display_Name'] := SalaryDisplayName(RxMD_PS['name_post_salary']);
            RxMD_PS['id_post_salary'] := id_s;
            RxMD_PS.Post;
//       ShowInfo(RxMD_PS);
        end;
    end;
    RxMD_PS.AfterScroll := RxMD_PSAfterScroll;
    BlockRaiseChange := False;
    RxMD_PS.First;
end;

procedure TSP_Post_salary.SBAddClick(Sender: TObject);
var
    MForm: TSP_Post_SalSum;
    SPPS_Name: string;
begin
    MForm := TSP_Post_SalSum.Create(Self);
    MForm.DMod := DMod;
    MForm.Add := Add;

    MForm.id_bs := id_bs;

    if MForm.ShowModal = mrOk then
    begin
        id := id - 1;
        SPPS_Name := MForm.CE_Name.Text;
        RxMD_PS.Open;
        RxMD_PS.Append;
        RxMD_PS['pps_koef'] := MForm.pps;
        RxMD_PS['name_post_salary'] := MForm.CE_Name.Text;
        RxMD_PS['Display_Name'] := SalaryDisplayName(RxMD_PS['name_post_salary']); ;
        RxMD_PS['id_post_salary'] := id;
        RxMD_PS.Post;
    end;
    MForm.Free;
end;

procedure TSP_Post_salary.SBModifClick(Sender: TObject);
var SPPS_Name: string;
    MForm: TSP_Post_SalSum;
begin
    MForm := TSP_Post_SalSum.Create(Self);

    if RxMD_PS.IsEmpty then
        Exit;

    if (RxMD_PS['name_post_salary'] = Null)
        then MForm.CE_Name.Text := ' '
    else MForm.CE_Name.Text := RxMD_PS['name_post_salary'];
    MForm.pps := RxMD_PS['pps_koef'];

    if MForm.ShowModal = mrOk then
    begin
        id_s := RxMD_PS['id_post_salary'];
        SPPS_Name := MForm.CE_Name.Text;
        RxMD_Raises.Open;
        RxMD_Raises.First;
        while not RxMD_Raises.Eof do
        begin
            if RxMD_Raises['id_post_salary'] = id_s then
            begin
                RxMD_Raises.Edit;
                RxMD_Raises['name_post_salary'] := SPPS_Name;
                RxMD_Raises['pps_koef'] := MForm.pps;
            end;
            RxMD_Raises.Next;
        end;
        RxMD_PS.Locate('id_post_salary', id_s, []);
        RxMD_PS.Edit;
        RxMD_PS['pps_koef'] := MForm.pps;
        RxMD_PS['name_post_salary'] := SPPS_Name;
        RxMD_PS['Display_Name'] := SalaryDisplayName(RxMD_PS['name_post_salary']);
//     RxMD_PS.Close;
//     RxMD_PS.Open;
    end;
    MForm.Free;
end;

procedure TSP_Post_salary.SBDeleteClick(Sender: TObject);
begin
    if RxMD_PS.IsEmpty then
        Exit;
    id_s := RxMD_PS['id_post_salary'];
    RxMD_PS.Delete;
    while RxMD_Raises.Locate('id_post_salary', id_s, []) do RxMD_Raises.Delete;
end;

procedure TSP_Post_salary.FormCreate(Sender: TObject);
begin
    id := -1;

    StatusPanel.Caption := STDSalaryStatus;
end;

procedure TSP_Post_salary.RxMD_PSAfterScroll(DataSet: TDataSet);
begin
    if not BlockRaiseChange then
    begin
        RxMD_Raises.Open;
        RxMD_Raises.First;

        RxMD_Raise.EmptyTable;
        while not RxMD_Raises.Eof do
        begin
            RxMD_Raise.Open;
            if (RxMD_Raises['id_post_salary'] = RxMD_PS['id_post_salary']) and (RxMD_Raises['id_raise'] <> -1) then
            begin
                RxMD_Raise.Append;
                RxMD_Raise['id_raise'] := RxMD_Raises['id_raise'];
                RxMD_Raise['date_beg'] := RxMD_Raises['date_beg'];
                RxMD_Raise['date_end'] := RxMD_Raises['date_end'];
                RxMD_Raise['name'] := RxMD_Raises['name'];
                RxMD_Raise['percent'] := RxMD_Raises['percent'];
                RxMD_Raise.Post;
            end;
            RxMD_Raises.Next;
        end;

        Refresh;
    end;
end;

procedure TSP_Post_salary.Refresh;
begin
//  pFIBDS_Result.Close;

//  RxMD_AllRaise.EmptyTable;

{  RxMD_Raise.Open;
  RxMD_Raise.First;
  while not RxMD_Raise.Eof do
  begin
    pFIBDS_Raise.ParamByName('id_raise_i').AsInteger:=RxMD_Raise['id_raise'];
    pFIBDS_Raise.Open;
    pFIBDS_Raise.Close;
    RxMD_Raise.Next;
  end;
  RxMD_AllRaise.Open;}
end;

procedure TSP_Post_salary.SB_AddClick(Sender: TObject);
var
    form: TAddRaiseForm;
{    flag:Boolean;
    id_ps:integer;}
begin
    if RxMD_PS.IsEmpty then
    begin
        MessageDlg('Спочатку треба створити группу', mtError, [mbYes], 0);
        Exit;
    end;

//Дописать вызов формы!

    form := TAddRaiseForm.Create(Self);
    form.pFIBDS_Raise.Database := DMod.FIBDatabase;
    if form.ShowModal = mrOk then
    begin
        RxMD_Raises.Append;
        RxMD_Raises['id_raise'] := form.qFSC_Raise.Value;
        RxMD_Raises['id_post_base_salary'] := id_bs;
        RxMD_Raises['name_post_salary'] := RxMD_PS['name_post_salary'];
        RxMD_Raises['pps_koef'] := RxMD_PS['pps_koef'];
        RxMD_Raises['id_post_salary'] := RxMD_PS['id_post_salary'];
        RxMD_Raises['date_beg'] := form.qFDC_Beg.Value;
        RxMD_Raises['date_end'] := form.qFDC_End.Value;
        RxMD_Raises['name'] := form.qFSC_Raise.DisplayText;
        RxMD_Raises['percent'] := form.qFFC_Percent.Value;
        RxMD_Raises.Post;
    end;
    form.Free;
    RxMD_PSAfterScroll(RxMD_Raises);
end;

procedure TSP_Post_salary.SB_DelClick(Sender: TObject);
var idr: integer;
begin
//Переписать удаление с учетом дат
    if (RxMD_Raise.IsEmpty) then
        Exit;

//    RxMD_Raises.Locate('id_raise;date_beg;date_end', VarArrayOf([RxMD_Raise['id_raise'], RxMD_Raise['date_beg'], RxMD_Raise['date_end']]), []);
//  RxMD_Raise.Delete;
    RxMD_Raises.Delete;
    RxMD_PSAfterScroll(RxMD_PS);
//  Refresh;
end;

procedure TSP_Post_salary.OkButtonClick(Sender: TObject);
begin
    RxMD_PS.Open;
    RxMD_PS.First;
    while not RxMD_PS.Eof do
    begin
        if not RxMD_Raises.Locate('id_post_salary', RxMD_PS['id_post_salary'], []) then
        begin
            RxMD_Raises.Append;
            RxMD_Raises['id_post_salary'] := RxMD_PS['id_post_salary'];
            RxMD_Raises['name_post_salary'] := RxMD_PS['name_post_salary'];
            RxMD_Raises['pps_koef'] := RxMD_PS['pps_koef'];
            RxMD_Raises['id_post_base_salary'] := id_bs;
            RxMD_Raises['id_raise'] := -1;
            RxMD_Raises.Post;
        end;
        RxMD_PS.Next;
    end;
//  ShowInfo(RxMD_Raises);
end;

procedure TSP_Post_salary.SalaryGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_F12) and (ssShift in Shift) then
        ShowInfo(SalaryGridDBTableView1.DataController.DataSource.DataSet);
end;

procedure TSP_Post_salary.RaiseGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_F12) and (ssShift in Shift) then
        ShowInfo(RaiseGridDBTableView1.DataController.DataSource.DataSet);
end;

procedure TSP_Post_salary.ModifyRaiseButtonClick(Sender: TObject);
var
    form: TAddRaiseForm;
begin
    if RxMD_PS.IsEmpty then
    begin
        MessageDlg('Спочатку треба створити группу', mtError, [mbYes], 0);
        Exit;
    end;

    form := TAddRaiseForm.Create(Self);
    form.pFIBDS_Raise.Database := DMod.FIBDatabase;

    form.qFSC_Raise.Value := RxMD_Raise['Id_Raise'];
    form.qFSC_Raise.DisplayText := RxMD_Raise['Name'];
    form.qFFC_Percent.Value := RxMD_Raise['Percent'];
    form.qFDC_Beg.Value := RxMD_Raise['Date_Beg'];
    form.qFDC_End.Value := RxMD_Raise['Date_End'];

    if form.ShowModal = mrOk then
    begin
{        RxMD_Raises.First;
        RxMD_Raises.Locate('Id_Post_Base_Salary;Id_Raise;Percent;Date_Beg;Date_End',
            VarArrayOf([RxMD_PS['id_post_salary'], RxMD_Raise['Id_Raise'], RxMD_Raise['Percent'],
            RxMD_Raise['Date_Beg'], RxMD_Raise['Date_End']]), []);}
        RxMD_Raises.Edit;
        RxMD_Raises['id_raise'] := form.qFSC_Raise.Value;
        RxMD_Raises['id_post_base_salary'] := id_bs;
        RxMD_Raises['name_post_salary'] := RxMD_PS['name_post_salary'];
        RxMD_Raises['pps_koef'] := RxMD_PS['pps_koef'];
        RxMD_Raises['id_post_salary'] := RxMD_PS['id_post_salary'];
        RxMD_Raises['date_beg'] := form.qFDC_Beg.Value;
        RxMD_Raises['date_end'] := form.qFDC_End.Value;
        RxMD_Raises['name'] := form.qFSC_Raise.DisplayText;
        RxMD_Raises['percent'] := form.qFFC_Percent.Value;
        RxMD_Raises.Post;
    end;
    form.Free;
    RxMD_PSAfterScroll(RxMD_Raises);
end;

procedure TSP_Post_salary.SalaryGridExit(Sender: TObject);
begin
    StatusPanel.Caption := STDSalaryStatus;
end;

procedure TSP_Post_salary.SalaryGridEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Базові оклади: Ins - додати, F2 - Змінити, Del - вилучити';
end;

procedure TSP_Post_salary.RaiseGridEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Групи надбавок: Ins - додати, F2 - Змінити, Del - вилучити';
end;

procedure TSP_Post_salary.CancelActionExecute(Sender: TObject);
begin
    CancelButton.Click;
end;

procedure TSP_Post_salary.AcceptActionExecute(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TSP_Post_salary.InsertActionExecute(Sender: TObject);
begin
    if SalaryGridDBTableView1.Focused then SBAdd.Click;
    if RaiseGridDBTableView1.Focused then SB_Add.Click;
end;

procedure TSP_Post_salary.ModifyActionExecute(Sender: TObject);
begin
    if SalaryGridDBTableView1.Focused then SBModif.Click;
    if RaiseGridDBTableView1.Focused then ModifyRaiseButton.Click;
end;

procedure TSP_Post_salary.DeleteActionExecute(Sender: TObject);
begin
    if SalaryGridDBTableView1.Focused then SBDelete.Click;
    if RaiseGridDBTableView1.Focused then SB_Del.Click;
end;

procedure TSP_Post_salary.RecalcSalarySum;
var
    Id_Post_Salary: Integer;
    Date_Beg: TDate;
begin
{    if RxMD_PS.IsEmpty then Exit;

    Id_Post_Salary := RxMD_PS['Id_Post_Salary'];
    Date_Beg := RxMD_PS['Date_Beg'];
    RxMD_Raises.SortOnFields('Date_Beg');
    RxMD_Raises.First;
    while not RxMD_Raises.Eof do
    begin
        RxMD_Raises.Next;
    end;}
end;


function TSP_Post_salary.SalaryDisplayName(
    Name_Post_Salary: Variant): string;
begin
    if VarIsNull(Name_Post_Salary) or (Trim(Name_Post_Salary) = '') then
        Result := 'Посадовий оклад: <без назви>'
    else Result := 'Посадовий оклад: ' + Name_Post_Salary;
end;

end.

