unit UErrorSvyaziPodr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ibase, FIBDatabase, pFIBDatabase,
  cxClasses, cxStyles, cxGridTableView;

type
  TfmErrorSvyazi = class(TForm)
    LabelNot_find: TLabel;
    cxButtonClose: TcxButton;
    cxButtonCancel: TcxButton;
    cxButtonAdding: TcxButton;
    cxButtonSex: TcxButton;
    cxTextEditName_Podr: TcxTextEdit;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonSexClick(Sender: TObject);
    procedure cxButtonAddingClick(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
     tip_svyazi : integer;
     id_faculty, id_spec, id_mova, id_form, id_kat, id_stage, id_kd : int64;
     title_more : string;
     DBHandle: TISC_DB_HANDLE;
  public
    { Public declarations }
  ResultArray : Variant;
  end;

  function func_ErrorSvyazi(Base: TISC_DB_HANDLE; Name_podr : String; tip_sv : integer; same_id : int64; title_more : string) : Variant;

var
  fmErrorSvyazi: TfmErrorSvyazi;

implementation
uses USPFaculty, USPSpec, USpMova, USpFormObuch, USpKatObuch, USpStage, USpKD;
{$R *.dfm}

function func_ErrorSvyazi(Base: TISC_DB_HANDLE; Name_podr : String; tip_sv : integer; same_id : int64; title_more : string) : Variant;
var
    fm : TfmErrorSvyazi;
begin
    fm := TfmErrorSvyazi.Create(nil);
    fm.cxTextEditName_Podr.Text  := Name_podr;
    fm.tip_svyazi                := tip_sv;
    fm.id_faculty                := same_id;
    fm.title_more               := title_more;

    fm.Caption                  := 'Проведення зв''язання';
    fm.cxButtonClose.Caption    := 'Вихiд';
    fm.cxButtonCancel.Caption   := 'Пропустити';
    fm.cxButtonAdding.Caption   := 'Додати';
    fm.cxButtonSex.Caption      := 'Зв''язати';

    if fm.tip_svyazi = 1 then fm.LabelNot_find.Caption    := 'Факультет не знайдено у зв''язцi';
    if fm.tip_svyazi = 2 then fm.LabelNot_find.Caption    := 'Спецiальнiсть не знайдено у зв''язцi';
    if fm.tip_svyazi = 3 then fm.LabelNot_find.Caption    := 'Форму навчання не знайдено у зв''язцi';
    if fm.tip_svyazi = 4 then fm.LabelNot_find.Caption    := 'Категорiю навчання не знайдено у зв''язцi';
    if fm.tip_svyazi = 5 then fm.LabelNot_find.Caption    := 'Громадянство не знайдено у зв''язцi';
    if fm.tip_svyazi = 6 then fm.LabelNot_find.Caption    := 'Таке значення перiоду не знайдено';
    if fm.tip_svyazi = 7 then fm.LabelNot_find.Caption    := 'Таке значення типу договору не знайдено';

    if fm.tip_svyazi = 7 then fm.Caption := 'Проведення зв''язання' + ' код договору:' + fm.title_more;

    fm.ShowModal;
    func_ErrorSvyazi := fm.ResultArray;
    fm.Free;
end;

procedure TfmErrorSvyazi.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,2], varVariant);
    ResultArray[0] := 0;
    ResultArray[1] := 0;
    close;
end;


procedure TfmErrorSvyazi.cxButtonSexClick(Sender: TObject);
var
   res_facul, res_spec, res_mova, res_form, res_kat, res_stage, res_kd  : variant;
begin
    if tip_svyazi = 1 then
    begin
        res_facul := USPFaculty.func_SP_facul(DBHandle);
        if VarArrayDimCount(res_facul) > 0 then
        begin
            if (res_facul[0]<>null) then
            begin
                id_faculty := res_facul[0];
            end;
        end;
        if id_faculty <> 0 then
        begin
            ResultArray := VarArrayCreate([0,2], varVariant);
            ResultArray[0] := id_faculty;
            ResultArray[1] := 1;
            close;
        end else
        begin
            //ShowMessage('Факультет не обрано!!! Залежнiсть не визначена! Оберiть факультет...');
        end;
    end;
    if tip_svyazi = 2 then
    begin
        res_spec := USPSpec.func_SP_spec(DBHandle,id_faculty);
        if VarArrayDimCount(res_spec) > 0 then
        begin
            if (res_spec[0]<>null) then
            begin
                id_spec := res_spec[0];
            end;
        end;
        if id_spec <> 0 then
        begin
            ResultArray := VarArrayCreate([0,2], varVariant);
            ResultArray[0] := id_spec;
            ResultArray[1] := 1;
            close;
        end else
        begin
            //ShowMessage('Спецiальнiсть не обрано!!! Залежнiсть не визначена! Оберiть спецiальнiсть...');
        end;
    end;
    if tip_svyazi = 3 then
    begin
        res_form := USpFormObuch.func_SP_Form(DBHandle);
        if VarArrayDimCount(res_form) > 0 then
        begin
            if (res_form[0]<>null) then
            begin
                id_form := res_form[0];
            end;
        end;
        if id_form <> 0 then
        begin
            ResultArray := VarArrayCreate([0,2], varVariant);
            ResultArray[0] := id_form;
            ResultArray[1] := 1;
            close;
        end else
        begin
            //ShowMessage('Форму навчання не обрано!!! Залежнiсть не визначена! Оберiть форму навчання...');
        end;
    end;
    if tip_svyazi = 4 then
    begin
        res_kat := USpKatObuch.func_SP_Kat(DBHandle);
        if VarArrayDimCount(res_kat) > 0 then
        begin
            if (res_kat[0]<>null) then
            begin
                id_kat := res_kat[0];
            end;
        end;
        if id_kat <> 0 then
        begin
            ResultArray := VarArrayCreate([0,2], varVariant);
            ResultArray[0] := id_kat;
            ResultArray[1] := 1;
            close;
        end else
        begin
            //ShowMessage('Категорiю навчання не обрано!!! Залежнiсть не визначена! Оберiть категорiю навчання...');
        end;
    end;
    if tip_svyazi = 5 then
    begin
        res_mova := USpMova.func_SP_mova(DBHandle);
        if VarArrayDimCount(res_mova) > 0 then
        begin
            if (res_mova[0]<>null) then
            begin
                id_mova := res_mova[0];
            end;
        end;
        if id_mova <> 0 then
        begin
            ResultArray := VarArrayCreate([0,2], varVariant);
            ResultArray[0] := id_mova;
            ResultArray[1] := 1;
            close;
        end else
        begin
            //ShowMessage('Мову не обрано!!! Залежнiсть не визначена! Оберiть мову...');
        end;
    end;
    if tip_svyazi = 6 then
    begin
        res_stage := USpStage.func_SP_Stage(DBHandle);
        if VarArrayDimCount(res_stage) > 0 then
        begin
            if (res_stage[0]<>null) then
            begin
                id_stage := res_stage[0];
            end;
        end;
        if id_stage <> 0 then
        begin
            ResultArray := VarArrayCreate([0,2], varVariant);
            ResultArray[0] := id_stage;
            ResultArray[1] := 1;
            close;
        end else
        begin
            //ShowMessage('Залежнiсть не визначена...');
        end;
    end;
    if tip_svyazi = 7 then
    begin
        res_kd := USpKD.func_SP_KD(DBHandle);
        if VarArrayDimCount(res_kd) > 0 then
        begin
            if (res_kd[0]<>null) then
            begin
                id_kd := res_kd[0];
            end;
        end;
        if id_kd <> 0 then
        begin
            ResultArray := VarArrayCreate([0,2], varVariant);
            ResultArray[0] := id_kd;
            ResultArray[1] := 1;
            close;
        end else
        begin
            //ShowMessage('Залежнiсть не визначена...');
        end;
    end;
end;

procedure TfmErrorSvyazi.cxButtonAddingClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,2], varVariant);
    ResultArray[0] := 1;
    ResultArray[1] := 2;
    close;
end;

procedure TfmErrorSvyazi.cxButtonCancelClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,2], varVariant);
    ResultArray[0] := 1;
    ResultArray[1] := 3;
    close;
end;

end.
