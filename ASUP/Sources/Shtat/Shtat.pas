unit Shtat;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ActnList, Menus, Buttons, ExtCtrls, FIBDatabase, pFIBDatabase,
    StdCtrls, MDIToolBar, ComCtrls, FIBQuery, pFIBQuery, NagScreenUnit, BaseTypes,
    DateUtils;

type
    TfmShtatMain = class(TForm)
        MainMenu1: TMainMenu;
        MainActions: TActionList;
        ExitAction: TAction;
        N1: TMenuItem;
        N2: TMenuItem;
        ShtatView: TAction;
        N3: TMenuItem;
        Panel1: TPanel;
        ShtatViewButton: TSpeedButton;
        ExitButton: TSpeedButton;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        N4: TMenuItem;
        PostView: TAction;
        N5: TMenuItem;
        SpeedButton1: TSpeedButton;
        DepartmentsView: TAction;
        N6: TMenuItem;
        ShtatDocView: TAction;
        N7: TMenuItem;
        SpeedButton2: TSpeedButton;
        WindowsItem: TMenuItem;
        N8: TMenuItem;
        SpRaiseView: TAction;
        N9: TMenuItem;
        SpRegardsView: TAction;
        SpRegardsTest: TMenuItem;
        N10: TMenuItem;
        ImportItem: TMenuItem;
        Label1: TLabel;
        ReportsItem: TMenuItem;
        N12: TMenuItem;
        ShtatReportItem: TAction;
        SpeedButton3: TSpeedButton;
        SpDigitsItem: TAction;
        N11: TMenuItem;
        SpMinZPItem: TAction;
        N13: TMenuItem;
        OkladIncItem: TAction;
        N14: TMenuItem;
        SpPostReport: TAction;
        N15: TMenuItem;
        ActiveUsers: TAction;
        N16: TMenuItem;
        N17: TMenuItem;
        N18: TMenuItem;
        AsupReportShtatBonus: TAction;
        N19: TMenuItem;
        ShtatReportBonus: TSpeedButton;
        ShtatReportNo1: TMenuItem;
        ShtatClean: TpFIBQuery;
        WriteTransaction: TpFIBTransaction;
    N20: TMenuItem;
    BottomPanel: TPanel;
    App32Report: TMenuItem;
    ReadTransaction: TpFIBTransaction;
    ConvertBonus: TMenuItem;
    ShtatReport2: TMenuItem;
    MSprTarifGrid: TMenuItem;
    NSprMinCateg: TMenuItem;
    P1: TMenuItem;
    N21: TMenuItem;
    ShtatReportMONItem: TAction;
    N22: TMenuItem;
    N23: TMenuItem;
    UpReportShtatBonus2: TAction;
    N24: TMenuItem;
        procedure ExitActionExecute(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure ShtatViewExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure PostViewExecute(Sender: TObject);
        procedure DepartmentsViewExecute(Sender: TObject);
        procedure ShtatDocViewExecute(Sender: TObject);
        procedure SpRaiseViewExecute(Sender: TObject);
        procedure SpRegardsViewExecute(Sender: TObject);
        procedure ImportItemClick(Sender: TObject);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure FormShow(Sender: TObject);
        procedure ShtatReportItemExecute(Sender: TObject);
        procedure SpDigitsItemExecute(Sender: TObject);
        procedure SpMinZPItemExecute(Sender: TObject);
        procedure OkladIncItemExecute(Sender: TObject);
        procedure SpPostReportExecute(Sender: TObject);
        procedure ActiveUsersExecute(Sender: TObject);
        procedure N18Click(Sender: TObject);
        procedure AsupReportShtatBonusExecute(Sender: TObject);
        procedure Clean;
        procedure ShtatReportNo1Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure App32ReportClick(Sender: TObject);
    procedure ConvertBonusClick(Sender: TObject);
    procedure ShtatReport2Click(Sender: TObject);
    procedure MSprTarifGridClick(Sender: TObject);
    procedure NSprMinCategClick(Sender: TObject);
    procedure ShtatReportMONItemExecute(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure UpReportShtatBonus2Execute(Sender: TObject);
    procedure N24Click(Sender: TObject);
    public
        NewVersion: Boolean;
    end;

var
    fmShtatMain: TfmShtatMain;
    AllOk: Boolean;

implementation

uses IniFiles, uCommonSp, RxMemDs, uShtatImport, qFTools,
    uOkladInc, uFormControl, SysAdmin, uWhatsNew, Math, AccMgmt, uApp32,
    uConvertBonus;

{$R *.dfm}

procedure TfmShtatMain.ExitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatMain.FormActivate(Sender: TObject);
begin
    ExitButton.Align := alRight;
    if not AllOk then FinalizeAdminSystem;
end;

procedure TfmShtatMain.ShtatViewExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatView');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;

            FieldValues['NewVersion'] := NewVersion;

            Post;
        end;

            // просто показать справочник
        sp.Show;
    end
    else
        MessageDlg('Помилка: неможливо завантажити пакет штатного розкладу (ShtatView)!', mtError, [mbOk], 0);
end;

procedure TfmShtatMain.FormCreate(Sender: TObject);
var
    i: Integer;
begin
    // установить украинскую раскладку
    LoadKeyboardLayout('00000422', KLF_ACTIVATE or KLF_SUBSTITUTE_OK);

    NewVersion := False;
    for i := 1 to ParamCount do
    begin
        if ParamStr(i) = 'idbehold' then AllOk := False;
        if ParamStr(i) = 'newversion' then NewVersion := True;
    end;

    if NewVersion then Caption := Caption + ' (ВЕРСІЯ 2)';

    BottomPanel.Caption := AccMgmt.fibGetCurrentDBPath;
end;

procedure TfmShtatMain.PostViewExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpPost');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;
                 // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.DepartmentsViewExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;
                // с возможностью редактирования
            FieldValues['AllowEdit'] := True;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.ShtatDocViewExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatDoc');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.SpRaiseViewExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;
                // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.SpRegardsViewExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpRegards');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;
                // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.ImportItemClick(Sender: TObject);
var
    form: TfmShtatImport;
begin
    form := TfmShtatImport.Create(Self);
    form.DBHandle := DB.Handle;
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatMain.FormCloseQuery(Sender: TObject;
    var CanClose: Boolean);
begin
    CanClose := qFConfirm('Ви справді бажаєте вийти?');
end;

procedure TfmShtatMain.FormShow(Sender: TObject);
var
    i: Integer;
    p: TMDITool;
begin
    p := TMDITool.Create;
    p.AddMDIToolBar(Self);

    for i := 1 to ParamCount do
        if ParamStr(i) = 'OpenShtat' then ShtatView.Execute
        else
            if ParamStr(i) = 'OpenPost' then PostView.Execute
            else
                if ParamStr(i) = 'OpenDepartments' then DepartmentsView.Execute;
end;

procedure TfmShtatMain.ShtatReportItemExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatReport');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
            //вызываем "Звіт з штатного розкладу"
            FieldValues['IdMode'] := 1;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.SpDigitsItemExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpPostDigits.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.SpMinZPItemExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpMinZP.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.OkladIncItemExecute(Sender: TObject);
var
    form: TfmIncOklads;
begin
    form := TfmIncOklads.Create(Self);
    form.FormControl.Prepare(DB, fmAdd, Null, Null);
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatMain.SpPostReportExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\PrintSpPost.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['ShowStyle'] := 0;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    sp.Free;
end;


procedure TfmShtatMain.ActiveUsersExecute(Sender: TObject);
begin
    if AllOk then AdminShowUsers(Self);
end;

procedure TfmShtatMain.N18Click(Sender: TObject);
var
    form: TfmWhatsNewForm;
begin
    form := TfmWhatsNewForm.Create(Self);
    form.Show;
end;

procedure TfmShtatMain.AsupReportShtatBonusExecute(Sender: TObject);
var
    sp: TSprav;
begin
    sp := GetSprav('UP\UpReportFactShtatBonus.bpl');

    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['DesignReport'] := 0;
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;

procedure TfmShtatMain.ShtatReportNo1Click(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('UP\UpShtatReportNo1.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['ShowStyle'] := 0;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    sp.Free;
end;

procedure TfmShtatMain.Clean;
var
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Очищення тимчасових даних...');

      // очистка...
    try
        ShtatClean.Transaction.StartTransaction;
        ShtatClean.ExecQuery;
        ShtatClean.Transaction.Commit;
    except
    end;
    NagScreen.Free;
end;

procedure TfmShtatMain.N20Click(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('UP\UpShtatReport2.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    sp.Free;
end;


procedure TfmShtatMain.App32ReportClick(Sender: TObject);
var
    form: TfmReportStavok32;
begin
    form := TfmReportStavok32.Create(Self, ReadTransaction);
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatMain.ConvertBonusClick(Sender: TObject);
var
    form: TConvertBonusForm;
begin
    form := TConvertBonusForm.Create(Self, DB);
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatMain.ShtatReport2Click(Sender: TObject);
var
    sp: TSprav;
begin
    sp := GetSprav('UP\upReportShtatras2.bpl');

    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['DesignReport'] := 0;
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;

procedure TfmShtatMain.MSprTarifGridClick(Sender: TObject);
var sp: TSprav;
    Check: Integer;
begin
    Check:=fibCheckPermission('/ROOT/SHR_Sprav/TARIF_GRID', 'Belong');
    if Check<>0 then
    begin
       agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії!', mtError, [mbOK]);
       Exit;
    end;
    sp := GetSprav('ASUP\TarifGrid');

    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['ShowStyle'] :=1;
            FieldValues['DateBegIn'] :=EncodeDate(YearOf(Date), MonthOf(Date), 1);
            FieldValues['DateEndIn'] :=EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;

procedure TfmShtatMain.NSprMinCategClick(Sender: TObject);
var sp:TSprav;
begin
    sp := GetSprav('ASUP\SpMinCategory');

    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;

procedure TfmShtatMain.ShtatReportMONItemExecute(Sender: TObject);
var
    sp:TSprav;
begin
      // создать справочник
    sp := GetSprav('ASUP\ShtatReport');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
            //если вызываем "Звіт з штатного розкладу для МОН"
            FieldValues['IdMode'] := 2;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatMain.N22Click(Sender: TObject);
var
    sp: TSprav;
begin
    sp := GetSprav('UP\UpReportFactShtatPost.bpl');

    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['DesignReport'] := 0;
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;

procedure TfmShtatMain.UpReportShtatBonus2Execute(Sender: TObject);
var
    sp: TSprav;
begin
    sp := GetSprav('UP\UpFactShtatBonusReport2.bpl');

    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['DesignReport'] := 0;
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;


procedure TfmShtatMain.N24Click(Sender: TObject);
var
    sp: TSprav;
begin
    sp := GetSprav('ASUP\ShtatPostBySR.bpl');

    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            Post;
        end;
        sp.Show;
    end;
    sp.Free;
end;

end.

