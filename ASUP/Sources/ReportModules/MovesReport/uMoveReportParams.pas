unit uMoveReportParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMoveReportData, uDateControl, uFControl, uLabeledFControl,
  uSpravControl, StdCtrls, Buttons, frxClass, frxDBSet, uCharControl,
  frxExportHTML, frxExportPDF, frxExportXLS, frxExportRTF;

type
  TfmMoveReport = class(TForm)
    Department: TqFSpravControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Report: TfrxReport;
    MovesDS: TfrxDBDataset;
    SignPost: TqFCharControl;
    SignFIO: TqFCharControl;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    ExportButton: TBitBtn;
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExportButtonClick(Sender: TObject);
  private
    DM: TdmMoveReport;
    DesignReport: Boolean;

    procedure PrepareReport;
  public
    constructor Create(AOwner: TComponent; DM: TdmMoveReport;
        DesignReport: Boolean); reintroduce;
  end;

var
  fmMoveReport: TfmMoveReport;

implementation

{$R *.dfm}

uses uCommonSp, Registry, NagScreenUnit, qFTools, uExportReport;

constructor TfmMoveReport.Create(AOwner: TComponent; DM: TdmMoveReport;
    DesignReport: Boolean);
begin
    inherited Create(AOwner);
    Self.DM := DM;
    Self.DesignReport := DesignReport;

    DateEnd.Value := Date;
    DateBeg.Value := IncMonth(Date, -1);

    DM.CurrentDepartment.Close;
    DM.CurrentDepartment.Open;
end;

procedure TfmMoveReport.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
  var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DM.DB.Handle);
            FieldValues['Actual_Date'] := DateBeg.Value;
            FieldValues['Root_Department'] := DM.CurrentDepartment['Current_Department'];
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmMoveReport.OkButtonClick(Sender: TObject);
begin
    PrepareReport;
    
    if DesignReport then Report.DesignReport
    else Report.ShowReport;
end;

procedure TfmMoveReport.FormCreate(Sender: TObject);
var
    reg: TRegistry;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\MovesReport\', False) then
		begin
            try
                Department.Value := reg.ReadInteger('Id_Department');
                Department.DisplayText := reg.ReadString('Name_Department');
                SignPost.Value := reg.ReadString('SignPost');
                SignFIO.Value := reg.ReadString('SignFIO');
            except
            end;

            try
                DateBeg.Value := reg.ReadDate('Date_Beg');
                DateEnd.Value := reg.ReadDate('Date_End');
            except
            end;
        end;
        reg.CloseKey;

	finally
		reg.Free;
	end;
end;

procedure TfmMoveReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    reg: TRegistry;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if reg.OpenKey('\Software\ASUP\MovesReport\', True) then
		begin
            try
                reg.WriteInteger('Id_Department', Department.Value);
                reg.WriteString('Name_Department', Department.DisplayText);
                reg.WriteDate('Date_Beg', DateBeg.Value);
                reg.WriteDate('Date_End', DateEnd.Value);
                reg.WriteString('SignPost', SignPost.Value);
                reg.WriteString('SignFIO', SignFIO.Value);
            except
            end;
        end;
        reg.CloseKey;
	finally
		reg.Free;
	end;
end;

procedure TfmMoveReport.PrepareReport;
var
    NagScreen: TNagScreen;
begin
    NagScreen := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Формується звіт...');

    try
        DM.MoveDataSet.Close;
        DM.MoveDataSet.ParamByName('Root_Department').AsInteger := Department.Value;
        DM.MoveDataSet.ParamByName('Date_Beg').AsDate := DateBeg.Value;
        DM.MoveDataSet.ParamByName('Date_End').AsDate := DateEnd.Value;
        DM.MoveDataSet.Open;

        if DM.MoveDataSet.IsEmpty then
        begin
            qFErrorDialog('Переводів не знайдено!');
            Exit;
        end;

        MovesDS.DataSet := DM.MoveDataSet;

        Report.LoadFromFile('Reports\Asup\MovesReport.fr3');

        Report.Variables['Date_Beg'] := QuotedStr(DateToStr(DateBeg.Value));
        Report.Variables['Date_End'] := QuotedStr(DateToStr(DateEnd.Value));
        Report.Variables['Department'] := QuotedStr(Department.DisplayText);

        Report.Variables['SIGN_POST'] := QuotedStr(SignPost.Value);
        Report.Variables['SIGN_FIO'] := QuotedStr(SignFIO.Value);

    finally
        NagScreen.Free;
    end;
end;

procedure TfmMoveReport.ExportButtonClick(Sender: TObject);
begin
    PrepareReport;
    ExportReportTo(Report);
end;

end.
