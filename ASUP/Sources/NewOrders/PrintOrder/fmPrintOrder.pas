{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Увольнение работника по приказу"               }
{    Ввод информации по увольнению                                             }
{    Ответственный: Кропов Валентин                                            }

unit fmPrintOrder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery,
  DBCtrls,variants, Mask, ActnList, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, uCommonSP, ibase, frxClass, frxDBSet,
  IniFiles, uPwdDeCrypt, frxExportRTF, frxExportHTML, frxExportXLS,
  fmPrintVipis, uFControl, uLabeledFControl, uCharControl, uIntControl,
  qFTools, uFloatControl;

type
  TPrintOrderForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    ReportSummary: TpFIBDataSet;
    ReportHeader: TpFIBDataSet;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    ReportFooter: TpFIBDataSet;
    ReportHeaderFIRM_NAME: TFIBStringField;
    ReportHeaderORDER_DATE: TFIBDateField;
    ReportHeaderCITY: TFIBStringField;
    ReportHeaderNUM_ORDER: TFIBStringField;
    ReportHeaderPRINT_NAME: TFIBStringField;
    SummuryDataset: TfrxDBDataset;
    HeaderDataset: TfrxDBDataset;
    FooterDataset: TfrxDBDataset;
    ReportHeaderISPOLNITEL: TFIBStringField;
    ReportFooterCOLUMN1: TFIBStringField;
    ReportFooterCOLUMN2: TFIBStringField;
    RTFExport: TfrxRTFExport;
    Report: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    frxHTMLExport1: TfrxHTMLExport;
    BitBtn1: TBitBtn;
    VipisPrintAction: TAction;
    ReportHeaderNUM_AND_DATE: TFIBStringField;
    FontSize: TqFIntControl;
    ReportHeaderDATE_ORDER_CANC: TFIBStringField;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure VipisPrintActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Id_Order_Group : Integer;
    Show_Form, Design_Report : Boolean;

  end;

    type
        TPrintOrder = class(TSprav)
    private
        IsConnected: Boolean;
        Form : TPrintOrderForm;
        procedure PrepareConnect;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
        procedure   GetInfo;override;
        function    Exists: boolean;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;
procedure ExeSprav; // Справочник вызывается из EXE

var
  PrintOrderForm : TPrintOrderForm;

implementation

{$R *.DFM}

procedure ExeSprav;
var
    Sp : TSprav;
    reg : TIniFile;
    FibDatabase : TpFibDatabase;
    a, b, c, cmd : String;
begin
    FibDatabase := TpFibDatabase.Create(Application.MainForm);

    with FibDatabase do
    begin
        reg := TIniFile.Create(ExtractFilePath(Application.ExeName) + '.\config.ini');
        DatabaseName := reg.ReadString('CONNECTION', 'Server', '') +
                ':' + reg.ReadString('CONNECTION','Path', '');
		DBParams.Add('user_name=' + reg.ReadString('Connection','User',''));
		DBParams.Add('password=' + PwdDeCrypt(reg.ReadString('Connection', 'Password_Crypted', '')));
        Reg.Free;
    end;

    FibDatabase.Open;

    Sp := TPrintOrder.Create;
    Sp.Input.Open;
    Sp.Input.Append;
    Sp.Input['DBHANDLE'] := Integer(FibDatabase.Handle);

    // Разбираем командную строку, т.к. ParamStr глючит
    cmd := CmdLine;
    a := Trim(Copy(cmd, 0, Pos(' ', cmd)));
    cmd := Trim(copy(cmd, Pos(' ', cmd), Length(cmd) - Pos(' ', cmd) + 1));
    b := Trim(Copy(cmd, 0, Pos(' ', cmd)));
    cmd := Trim(copy(cmd, Pos(' ', cmd), Length(cmd) - Pos(' ', cmd) + 1));
    c := cmd;
    sp.Input['Id_Order_Group'] := StrToInt(a);
    sp.Input['Show_Form'] := (b = 'T');
    sp.Input['Design_Report'] := (c = 'T');
    Sp.Input.Post;
    Application.Title := 'Друк наказу';
    Sp.Show;

    FibDatabase.Free;
end;

function CreateSprav: TSprav;
begin
    Result := TPrintOrder.Create;
end;

constructor TPrintOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Show_Form', ftBoolean);
    Input.FieldDefs.Add('Design_Report', ftBoolean);

    Input.Open;
    Output.Open;
end;

destructor TPrintOrder.Destroy;
begin
    inherited Destroy;
end;

        // подготовить соединение с базой
procedure TPrintOrder.PrepareConnect;
begin

end;

procedure TPrintOrder.Show;
var
    hnd : Integer;
begin
    Form := TPrintOrderForm.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);
    Form.Id_Order_Group := Input['Id_Order_Group'];
    Form.Show_Form := Input['Show_Form'];
    Form.Design_Report := Input['Design_Report'];
    PrintOrderForm := Form;

    Form.ReportHeader.Close;
    Form.ReportHeader.ParamByName('ID_ORDER_GROUP').AsInteger := Form.Id_Order_Group;
    Form.ReportHeader.Open;

    Form.ReportSummary.Close;
    Form.ReportSummary.ParamByName('ID_ORDER_GROUP').AsInteger := Form.Id_Order_Group;
    Form.ReportSummary.Open;

    Form.ReportFooter.Close;
    Form.ReportFooter.ParamByName('ID_ORDER_GROUP').AsInteger := Form.Id_Order_Group;
    Form.ReportFooter.Open;
    
    if Form.Show_Form then
        form.ShowModal
    else
        Form.OkAction.Execute;

    form.Free;
end;

function TPrintOrder.Exists: boolean;
begin
    if not IsConnected then PrepareConnect;
    Result := True;
end;

procedure TPrintOrder.GetInfo;
begin
    if not IsConnected then PrepareConnect;
end;


procedure TPrintOrderForm.OkActionExecute(Sender: TObject);
begin
    Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\NewOrder.fr3');
    Report.Variables['FontSize'] := FontSize.Value;
    Report.PrepareReport(True);

    if Design_Report then
        Report.DesignReport
    else
        Report.ShowReport(True);

    qfTools.qFAutoSaveIntoRegistry(Self, nil);
end;

procedure TPrintOrderForm.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TPrintOrderForm.VipisPrintActionExecute(Sender: TObject);
var
    str : String;
    i : Integer;
    cnt : Integer;
begin
    ReportSummary.Close;
    ReportSummary.SQLs.SelectSQL.Text := 'select * from ASUP_ORDER_PRINT_SUMMARY_VIPIS(:ID_ORDER_GROUP, null)';
    ReportSummary.ParamByName('ID_ORDER_GROUP').AsInteger := Id_Order_Group;
    ReportSummary.Open;

    PrintVipisForm := TPrintVipisForm.Create(Self);
    PrintVipisForm.Prepare;

    str := '';
    cnt := 0;

    if PrintVipisForm.ShowModal = mrOk then begin

        qfTools.qFAutoSaveIntoRegistry(Self, nil);

        for i := 0 to PrintVipisForm.ResultList.Items.Count - 1 do begin
            if PrintVipisForm.ResultList.Checked[i] then begin
                if (cnt <> 0)
                then
                    str := str + ',';

                str := str + IntToStr(PrintVipisForm.ar[i]);

                cnt := cnt + 1;
            end;
        end;

        if str = '' then
            str := '-1';

        Str := QuotedStr(str);

        ReportSummary.Close;
        ReportSummary.SQLs.SelectSQL.Text := 'select * from ASUP_ORDER_PRINT_SUMMARY_VIPIS(:ID_ORDER_GROUP, ' + str + ')';
        ReportSummary.ParamByName('ID_ORDER_GROUP').AsInteger := Id_Order_Group;
        ReportSummary.Open;

        Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\NewOrderVipis.fr3');
        Report.Variables['FontSize'] := FontSize.Value;
        Report.PrepareReport(True);

        if Design_Report then
            Report.DesignReport
        else
            Report.ShowReport(True);

    end;

    PrintVipisForm.Free;
end;

procedure TPrintOrderForm.FormCreate(Sender: TObject);
begin
    qfTools.qFAutoLoadFromRegistry(Self, nil);

    if VarIsNull(FontSize.Value) then
        FontSize.Value := 12; 
end;

end.
