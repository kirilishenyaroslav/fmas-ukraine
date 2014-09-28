unit uShtatPostBySRForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, uCommonSp, DB,
    FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, iBase, StdCtrls, Buttons,
    ExtCtrls, ComCtrls, cxDropDownEdit, cxCalendar, cxControls, cxContainer,
    cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters,
    cxButtons, Grids, DBGrids, frxClass, frxDBSet, FIBQuery, pFIBQuery;

type
    TFormShtatPostBySR = class(TForm)
        pFIBDatabase: TpFIBDatabase;
        pFIBDataSet: TpFIBDataSet;
        pFIBTransaction: TpFIBTransaction;
        LabelDate: TLabel;
        LabelDocument: TLabel;
        PanelBottom: TPanel;
        BevelBottom: TBevel;
        cxButtonEdit: TcxButtonEdit;
        cxDateEdit: TcxDateEdit;
        cxButtonApply: TcxButton;
        cxButtonCancel: TcxButton;
        frxDBDataset: TfrxDBDataset;
        pFIBQuery: TpFIBQuery;
        pFIBDataSetNAME_POST: TFIBStringField;
        pFIBDataSetNAME_POST_BASE_SALARY: TFIBStringField;
        pFIBDataSetRAZRYAD: TFIBStringField;
        pFIBDataSetNAME_TYPE_POST: TFIBStringField;
        frxReport: TfrxReport;
        procedure FormCreate(Sender: TObject);
        procedure cxButtonCancelClick(Sender: TObject);
        procedure cxButtonEditPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure cxButtonApplyClick(Sender: TObject);
        procedure cxButtonEditPropertiesChange(Sender: TObject);
        procedure cxButtonEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure getReport;
    private
    { Private declarations }
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE); reintroduce;
    end;

var
    FormShtatPostBySR: TFormShtatPostBySR;
    idTemp: integer;
    firmTemp: string;
    date_beg, date_end: TDateTime;

implementation

{$R *.dfm}

constructor TFormShtatPostBySR.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE);
begin
    inherited Create(aOwner);
    pFIBDatabase.Close;
    pFIBDatabase.Handle := DBHandle;

    try
        pFIBDatabase.Open;
    except
        MessageBox(Self.Handle,
            'Помилка відкриття бази данних!',
            'Штатний розклад - Помилка',
            MB_OK + MB_ICONERROR);
    end;

    pFIBTransaction.Active := True;
    Self.Caption := 'Звіт за посадами, що використовуються в ШР';
end;

procedure TFormShtatPostBySR.FormCreate(Sender: TObject);
begin
    cxDateEdit.Date := Date;
end;

procedure TFormShtatPostBySR.cxButtonCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TFormShtatPostBySR.cxButtonEditPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var handbook: TSprav;
begin
    try
        handbook := GetSprav('ASUP\ShtatDoc');

        if (handbook <> nil) then
        begin
            with (handbook.Input) do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(pFIBDatabase.Handle);
                FieldValues['ShowStyle'] := 0;
                FieldValues['Select'] := 1;
                Post;
            end;

            handbook.Show;

            if (handbook.Output <> nil) and not (handbook.Output.IsEmpty) then
            begin
                idTemp := handbook.Output['ID_SR'];
                cxButtonEdit.Text := handbook.Output['Name'];
            end;

            handbook.Free;
        end;
    except
        MessageBox(Self.Handle,
            'Помилка при відкритті довідника!',
            'Штатний розклад - Помилка',
            MB_OK + MB_ICONERROR);
    end;

end;

procedure TFormShtatPostBySR.getReport;
var szTemp: string;
begin
    if (cxButtonEdit.Text <> '') then
    begin
        try

            pFIBQuery.Close;
            pFIBQuery.SQL.Text := 'select DATE_BEG,DATE_END from DT_SR where ID_SR = ' + inttostr(idTemp);
            pFIBQuery.ExecQuery;

            date_beg := pFIBQuery.FieldByName('DATE_BEG').AsDate;
            date_end := pFIBQuery.FieldByName('DATE_END').AsDate;

            pFIBQuery.Close;

            if (date_beg <= cxDateEdit.Date) and (date_end >= cxDateEdit.Date) then
            begin

                frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\ASUP\ShtatPostBySR.fr3', true);

                pFIBQuery.SQL.Text := 'SELECT FIRM_NAME FROM INI_ASUP_CONSTS';
                pFIBQuery.ExecQuery;
                firmTemp := pFIBQuery.FieldByName('FIRM_NAME').Value;

                frxReport.Variables.Variables['FIRM_NAME'] := '''' + firmTemp + '''';
                frxReport.Variables.Variables['DOC_NAME'] := '''' + cxButtonEdit.Text + '''';
                frxReport.Variables.Variables['CUR_DATE'] := '''' + cxDateEdit.Text + '''';

                szTemp := 'select * from UP_SHTAT_REPORT_POST_BY_SR(' + inttostr(idTemp) +
                    ',''' + datetostr(cxDateEdit.Date) + ''')';

                pFIBDataSet.Close;
                pFIBDataSet.SelectSQL.Text := szTemp;
                pFIBDataSet.Open;

                pFIBDataSet.FetchAll;

                frxReport.ReportOptions.Name := 'Звіт за посадами, що використовуються в ШР';

                frxReport.ShowReport(True);

            end
            else
            begin
                MessageBox(Self.Handle,
                    'На задану дату документ штатного розкладу не функціонує. Оберіть іншу дату!',
                    'Штатний розклад - Помилка',
                    MB_OK + MB_ICONERROR);
                cxDateEdit.SetFocus;
            end;
        except
            on e: exception do
            begin
                MessageBox(Self.Handle,
                    PAnsiChar(PAnsiString(E.ClassName + ' помилка з повідомленням: ' + E.Message)),
                    'Штатний розклад - Помилка',
                    MB_OK + MB_ICONERROR);
            end;
        end;
    end;
end;

procedure TFormShtatPostBySR.cxButtonApplyClick(Sender: TObject);
begin
    getReport;
end;

procedure TFormShtatPostBySR.cxButtonEditPropertiesChange(Sender: TObject);
begin
    if (cxButtonEdit.Text <> '') then
        cxButtonApply.Enabled := True
    else
        cxButtonApply.Enabled := False;
end;

procedure TFormShtatPostBySR.cxButtonEditKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if key = vk_back then
    begin
        cxButtonEdit.Clear;
        cxButtonEdit.setfocus;
    end;
end;

end.

