unit uAddManExitDekret;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl, uInvisControl,
    uLogicCheck, uSimpleCheck, uFormControl, uEnumControl, uCharControl,
    uFloatControl, uDateControl, StdCtrls, Buttons, pFIBDatabase, DB,
    FIBDataSet, pFIBDataSet;

type
    TfmAddManExitDekret = class(TForm)
        FormControl: TqFFormControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        IdOrder: TqFInvisControl;
        NumItem: TqFSpravControl;
    People: TqFSpravControl;
    Post: TqFCharControl;
    Order: TqFCharControl;
    Holiday: TqFCharControl;
    Date_Remove: TqFDateControl;
    PrevOrder: TqFInvisControl;
        procedure FIOOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure OkButtonClick(Sender: TObject);
    procedure PeopleOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure NumItemOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    private
        ReadTransaction: TpFIBTransaction;
        Date_Order: TDate;
    public
        procedure Prepare(tran: TpFIBTransaction; Id_Order: Integer; Date_Order: TDate);
    end;

var
    fmAddManExitDekret: TfmAddManExitDekret;

implementation

{$R *.dfm}

uses uCommonSp, uSelectForm, qFTools, uDekretPeople;

procedure TfmAddManExitDekret.FIOOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    sp: TSprav;
begin
      // создать справочник
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(ReadTransaction.DefaultDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
        sp.Free;
    end;
end;

procedure TfmAddManExitDekret.OkButtonClick(Sender: TObject);
begin
    FormControl.Ok;
end;

procedure TfmAddManExitDekret.Prepare(tran: TpFIBTransaction;
    Id_Order: Integer; Date_Order: TDate);
begin
    ReadTransaction := tran;
    Self.Date_Order := Date_Order;
    Self.IdOrder.Value := Id_Order;
    Date_Remove.Value := Date_Order;
end;

procedure TfmAddManExitDekret.PeopleOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    form: TfmDekretPeople;
begin
    form := TfmDekretPeople.Create(Self, ReadTransaction, Date_Order);
    if form.ShowModal = mrOk then
    begin
        Value := form.DekretPeople['Id_Man_Moving'];
        DisplayText := form.DekretPeople['Man_String'];
        PrevOrder.Value := form.DekretPeople['Id_Order'];

        Post.Value := form.DekretPeople['POST_STRING'];
        Order.Value := form.DekretPeople['ORDER_STRING'];
        Holiday.Value := form.DekretPeople['Hol_STRING'];
    end;
    form.Free;
end;

procedure TfmAddManExitDekret.NumItemOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('Asup\OrderItems');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(ReadTransaction.DefaultDatabase.Handle);
            FieldValues['Id_Order'] := IdOrder.Value;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Num_Item'];
            DisplayText := IntToStr(sp.Output['Num_Item']);
        end;
        sp.Free;
    end;
end;


initialization
    RegisterClass(TfmAddManExitDekret);

end.

