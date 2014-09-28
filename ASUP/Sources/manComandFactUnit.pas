unit ManComandFactUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, DB,
    IBCustomDataSet, IBQuery, PersonalCommon, SpCommon, DBCtrls;

type
    TManComandFactForm = class(TForm)
        ResultQuery: TIBQuery;
        DataSource1: TDataSource;
        Panel1: TPanel;
        DBGrid2: TDBGrid;
        FIOEdit: TEdit;
        SelectPersonButton: TSpeedButton;
        PibFilter: TCheckBox;
        ResultQueryID_MAN_COMAND_PLAN: TIntegerField;
        ResultQueryID_PCARD: TIntegerField;
        ResultQueryFIO: TIBStringField;
        ResultQueryTARGET: TIBStringField;
        ResultQueryOSNOVANIE: TIBStringField;
        ResultQueryPROEZD: TIBStringField;
        ResultQueryID_VIDOPL: TIntegerField;
        ResultQueryNAME_VIDOPL: TIBStringField;
        ResultQueryNUM_ORDER: TIBStringField;
        ResultQueryORDER_DATE: TDateField;
        ResultQueryTN: TIntegerField;
        FindPanel: TPanel;
        SearchLabel: TLabel;
        Label1: TLabel;
        SearchEdit: TEdit;
        ModifyButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        DoButton: TSpeedButton;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure PibFilterClick(Sender: TObject);
        procedure SelectPersonButtonClick(Sender: TObject);
        procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
        procedure SearchEditChange(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    ManComandFactForm: TManComandFactForm;
    Filter_Id_Pcard: Integer;

implementation

uses GoodFunctionsUnit, ManComandFactEditUnit;
{$R *.dfm}

procedure TManComandFactForm.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;

    Filter_Id_Pcard := -1;

    ResultQuery.Params.ParamValues['Filter_Id_Pcard'] := Filter_Id_Pcard;

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TManComandFactForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if (FormStyle = fsMDIChild) then action := caFree;
end;

procedure TManComandFactForm.FormResize(Sender: TObject);
begin
    GridResize(DBGrid2);
    CancelButton.Left := Panel1.Width - CancelButton.Width - 10;
end;

procedure TManComandFactForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TManComandFactForm.PibFilterClick(Sender: TObject);
begin

    FioEdit.Enabled := PibFilter.Checked;
    SelectPersonButton.Enabled := PibFilter.Checked;

    if (PibFilter.Checked) and (Filter_Id_Pcard <> -1)
        then begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['Filter_Id_Pcard'] := Filter_Id_Pcard;
        ResultQuery.Open;
    end
    else begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['Filter_Id_Pcard'] := -1;
        ResultQuery.Open;
    end;

end;

procedure TManComandFactForm.SelectPersonButtonClick(Sender: TObject);
var
    new_id_pcard: Integer;
begin
    new_id_pcard := getpcard(Date, True, True);

    if new_id_pcard <> -1
        then begin
        filter_id_pcard := new_id_pcard;
        FioEdit.Text := GoodFunctionsUnit.Fam;

        ResultQuery.Close;
        ResultQuery.Params.ParamValues['Filter_Id_Pcard'] := Filter_Id_Pcard;
        ResultQuery.Open;
    end;
end;

procedure TManComandFactForm.DBGrid2KeyPress(Sender: TObject;
    var Key: Char);
const
    LettersBig = 'ÀÁÂÃ¥ÄÅ¨ÆÇª²È¯ÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß';
    LettersSmall = 'àáâã´äå¸æçº³è¿éêëìíîïðñòóôõö÷øùúûüýþÿ';
    Signs = '0123456789-()/\';
begin
    if (Pos(Key, LettersBig) = 0)
        and (Pos(Key, LettersSmall) = 0)
        and (Pos(Key, Signs) = 0)
        then Exit;

    SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TManComandFactForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TManComandFactForm.RefreshButtonClick(Sender: TObject);
begin
    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TManComandFactForm.ModifyButtonClick(Sender: TObject);
var
    Form: TManComandFactEditForm;
begin
    Form := TManComandFactEditForm.Create(Self, ResultQueryID_MAN_COMAND_PLAN.Value);

    Form.ShowModal;
end;

end.
