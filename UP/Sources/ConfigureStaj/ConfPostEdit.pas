unit ConfPostEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, cxButtonEdit, StdCtrls, cxRadioGroup,
    cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
    cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtons, ExtCtrls,
    cxCalendar, cxLabel, cxCalc, ActnList, uFControl, uLabeledFControl,
    uSpravControl, IBase;

type
    TfrmPostEdit = class(TForm)
        Label3: TLabel;
        Label1: TLabel;
        Panel1: TPanel;
        cxButton1: TcxButton;
        cxButton2: TcxButton;
        cxCategory: TcxLookupComboBox;
        cxRadioButton1: TcxRadioButton;
        cxRadioButton2: TcxRadioButton;
        cDateBeg: TcxDateEdit;
        cDateEnd: TcxDateEdit;
        cMinOklad: TcxCalcEdit;
        LDateBeg: TcxLabel;
        LDateEnd: TcxLabel;
        LMinOklad: TcxLabel;
        ActionList1: TActionList;
        OkAct: TAction;
        CancelAct: TAction;
        PostSpr: TcxButtonEdit;
        cxCat: TcxTextEdit;
        NumOrderEdit: TcxTextEdit;
        lblNumOrder: TcxLabel;
        lblDateOrder: TcxLabel;
        DateOrder: TcxDateEdit;
    LMinRateSovm: TcxLabel;
    cMinRateSovm: TcxCalcEdit;
        procedure cxRadioButton1Click(Sender: TObject);
        procedure cxRadioButton2Click(Sender: TObject);
        procedure OkActExecute(Sender: TObject);
        procedure CancelActExecute(Sender: TObject);
        procedure PostSprOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure PostSprPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
    private
        Id_Post_Salary: Integer;
        Id_Type_Post: Integer;
        IsEdit: Integer;
        HAND: TISC_DB_HANDLE;
    { Private declarations }
    public
        function GetPostSalary: Variant;
        function GetTypePost: Variant;
        procedure EditMode(IsEd: Integer);
    { Public declarations }
    end;

var
    frmPostEdit: TfrmPostEdit;

implementation

{$R *.dfm}

uses DMStModule, SelectStaj, RxMemDs, uUnivSprav, ConfigStaj, BaseTypes, TypePost;

function TfrmPostEdit.GetPostSalary: Variant;
begin
    Result := Id_Post_Salary;
end;

procedure TfrmPostEdit.EditMode(IsEd: Integer);
begin
    Self.IsEdit := IsEd;
end;

function TfrmPostEdit.GetTypePost: Variant;
begin
    Result := Id_Type_Post;
end;

procedure TfrmPostEdit.cxRadioButton1Click(Sender: TObject);
begin
    if cxRadioButton1.Checked then
    begin
        cxCategory.Enabled := True;
        PostSpr.Enabled := False;
    end;
end;

procedure TfrmPostEdit.cxRadioButton2Click(Sender: TObject);
begin
    if cxRadioButton2.Checked then
    begin
        cxCategory.Enabled := False;
        PostSpr.Enabled := True;
    end;
end;

procedure TfrmPostEdit.OkActExecute(Sender: TObject);
begin
    if Self.IsEdit = 1 then
    begin
        if ((cxCategory.Text = '') and (PostSpr.Text = '')) then
        begin
            agMessageDlg('Увага!', 'Потрібно обрати категорію персоналу або посаду!', mtInformation, [mbOK]);
            Exit;
        end;
    end;
    ModalResult := mrOk;
end;

procedure TfrmPostEdit.CancelActExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmPostEdit.PostSprOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
    va: Variant;
    str: string;
begin
    Params.FormCaption := 'Довідник посад';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_POST_STAJ_CONF_SEL';
    Params.Fields := 'NAME_POST,NAME_TYPE_POST,SALARY_MIN,SALARY_MAX';
    Params.FieldsName := 'Посада,Тип персоналу,Мін,Макс';
    Params.KeyField := 'ID_POST_SALARY';
    Params.ReturnFields := 'NAME_POST,ID_POST_SALARY';
    Params.DBHandle := Integer(HAND);
    showmessage('0');
    OutPut := TRxMemoryData.Create(self);
    showmessage('0_');
    if GetUnivSprav(Params, OutPut)
        then begin
        showmessage('1');
        Value := output['ID_POST_SALARY'];
        str := VarToStr(Value);
        Id_Post_Salary := StrToInt(str);
        showmessage(IntToStr(Id_Post_Salary));
        //showmessage(vartostr(output['NAME_POST']));
        DisplayText := VarToStr(OutPut['NAME_POST']);
    end;
end;

procedure TfrmPostEdit.PostSprPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
var
    frm: TfrmTypePost;
begin
    try
        frm := TfrmTypePost.Create(Self);
        frm.TypePost.Close;
        frm.TypePost.SelectSQL.Text := 'select * from UP_POST_STAJ_CONF_SEL(:is_search, :name_search) order by id_type_post, name_post collate win1251_ua';
        frm.TypePost.ParamByName('is_search').AsString := 'F';
        frm.TypePost.ParamByName('name_search').AsString := '';
        frm.TypePost.Open;
        if frm.ShowModal = mrOk then
        begin
            Self.Id_Post_Salary := frm.TypePost['ID_POST_SALARY'];
            PostSpr.Text := frm.TypePost['NAME_POST'];
            Self.Id_Type_Post := frm.TypePost['ID_TYPE_POST'];
        end;
    except on e: exception
        do begin
            agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
            Exit;
        end;
    end;
end;

end.
