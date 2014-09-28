{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник регалий"                              }
{         Модуль добавления/изменения регалий                                  }
{                                               ответственный: Тимофеев Антон  }
unit U_SPEducOrg_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, StdCtrls, SpComboBox, DB,
  IBCustomDataSet, IBQuery, Buttons, FieldControl, ExtCtrls, Mask, SpFormUnit,
  CheckEditUnit, EditControl, SpCommon, fib, U_SPEducOrgDM, CheckLst,
  uFControl, uLabeledFControl, uSpravControl, uCharControl, uIntControl,
  uBoolControl, uFormControl;

type
  TForm_SPEducOrg_Add = class(TForm)
    Panel1: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFSC_type: TqFSpravControl;
    qFBC_IsEduc: TqFBoolControl;
    qFBC_IsKval: TqFBoolControl;
    qFIC_Akred: TqFIntControl;
    qFCC_FName: TqFCharControl;
    qFCC_SName: TqFCharControl;
    qFSC_Adr: TqFSpravControl;
    qFFC_EducOrg: TqFFormControl;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qFSC_typeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_AdrOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    DMod:  TDM_SPEducOrg;
    Mode:TFormMode;
    FormControl: TEditControl;
    idgr,id:integer;
  	PropParams: TSpParams;
    constructor Create(AOwner: TComponent ; DMod: TDM_SPEducOrg; Mode: TFormMode; Where: Variant); reintroduce;
  end;

var
  Form_SPEducOrg_Add: TForm_SPEducOrg_Add;

implementation

{$R *.dfm}

uses uCommonSP;

constructor TForm_SPEducOrg_Add.Create(AOwner: TComponent ; DMod: TDM_SPEducOrg; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
	Self.Mode := Mode;
  Self.DMod:=TDM_SPEducOrg.Create(Self);
  Self.DMod:=DMod;
  qFFC_EducOrg.Prepare(DMod.FIBSpEducOrgDatabase,Mode,Where,Null);
end;

procedure TForm_SPEducOrg_Add.OkButtonClick(Sender: TObject);
begin
  qFFC_EducOrg.Ok;
end;

procedure TForm_SPEducOrg_Add.CancelButtonClick(Sender: TObject);
begin
	ModalResult := mrCancel;
  Close;
end;

procedure TForm_SPEducOrg_Add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//
end;

procedure TForm_SPEducOrg_Add.FormCreate(Sender: TObject);
begin
//
end;

procedure TForm_SPEducOrg_Add.FormShow(Sender: TObject);
begin
//
end;

procedure TForm_SPEducOrg_Add.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TForm_SPEducOrg_Add.qFSC_typeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
  PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'INI_EDUC_ORG_TYPE';
		Title := 'Тип навч. закладу';
		IdField := 'Id_type';
		SpFields := 'type_name';
		ColumnNames := 'Тип навч. закладу';
    SpMode := spmSelect;
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     value:=form.ResultQuery['Id_type'];
     DisplayText:=form.ResultQuery['type_name'];
   end;
	form.Free;
  PropParams.Free;
end;

procedure TForm_SPEducOrg_Add.qFSC_AdrOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('Adresses');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DMod.FIBSpEducOrgDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Adress'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

end.
