unit uSetKorParams;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uSetKorParams                                                              *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Организация интерфейса для выбора пользователем параметров корреспонденции.*
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxRadioGroup, Placemnt, cxDropDownEdit, cxCalendar, uneTypes;

type

  TfmSetKorParams = class(TForm)
    Bevel             : TBevel;

    btnOK             : TcxButton;
    btnCancel         : TcxButton;

    pnlContainer      : TPanel;
    lblDescription    : TLabel;

    cbxShowSmet       : TcxCheckBox;
    cbxShowRazd       : TcxCheckBox;
    cbxShowStat       : TcxCheckBox;
    cbxShowKekv       : TcxCheckBox;
    cbxShowGrSmet     : TcxCheckBox;

    rgrTypeSmetInfo   : TcxRadioGroup;
    rgrTypeRazdInfo   : TcxRadioGroup;
    rgrTypeStatInfo   : TcxRadioGroup;
    rgrTypeKekvInfo   : TcxRadioGroup;
    rgrTypeGrSmetInfo : TcxRadioGroup;

    procedure btnOKClick   (Sender: TObject);

    procedure FormClose    (Sender: TObject; var Action: TCloseAction);
    procedure FormShortCut (var Msg: TWMKey; var Handled: Boolean);
  private
    FKorParamsInfo: TRec_KorParamsInfo;
    function  SetKorParamsInfo: TRec_KorParamsInfo;
    procedure GetKorParamsInfo( aValue: TRec_KorParamsInfo );
  public
    constructor Create( const aFMParams: TRec_FMParams; const aKorParamsInfo: TRec_KorParamsInfo ); reintroduce;
    property pKorParamsInfo: TRec_KorParamsInfo read SetKorParamsInfo write GetKorParamsInfo;
  end;

  procedure SetKorParams( const aFMParams: TRec_FMParams; var aKorParamsInfo: TRec_KorParamsInfo ); stdcall;

  exports
      SetKorParams;

implementation

resourcestring
    sInvalidParams = 'Не обрано жодного крітерію для аналізу!';

{$R *.dfm}

procedure TfmSetKorParams.GetKorParamsInfo(aValue: TRec_KorParamsInfo);
begin
  FKorParamsInfo := aValue;
end;

function TfmSetKorParams.SetKorParamsInfo: TRec_KorParamsInfo;
begin
  Result := FKorParamsInfo;
end;

procedure SetKorParams( const aFMParams: TRec_FMParams; var aKorParamsInfo: TRec_KorParamsInfo );
var
    fmSetKorParams : TfmSetKorParams;
begin
    try
        fmSetKorParams := TfmSetKorParams.Create( aFMParams, aKorParamsInfo );
        aKorParamsInfo.ModRes := fmSetKorParams.ShowModal;

        //Возвращаем значения параметров корреспонденции
        if aKorParamsInfo.ModRes = mrOK
        then begin
            with aKorParamsInfo
            do begin
                GrSmet.Checked  := fmSetKorParams.cbxShowGrSmet.Checked;
                GrSmet.TypeInfo := TEnm_KorParamsTypeInfo( fmSetKorParams.rgrTypeGrSmetInfo.ItemIndex );
                Smet.Checked    := fmSetKorParams.cbxShowSmet.Checked;
                Smet.TypeInfo   := TEnm_KorParamsTypeInfo( fmSetKorParams.rgrTypeSmetInfo.ItemIndex );
                Razd.Checked    := fmSetKorParams.cbxShowRazd.Checked;
                Razd.TypeInfo   := TEnm_KorParamsTypeInfo( fmSetKorParams.rgrTypeRazdInfo.ItemIndex );
                Stat.Checked    := fmSetKorParams.cbxShowStat.Checked;
                Stat.TypeInfo   := TEnm_KorParamsTypeInfo( fmSetKorParams.rgrTypeStatInfo.ItemIndex );
                Kekv.Checked    := fmSetKorParams.cbxShowKekv.Checked;
                Kekv.TypeInfo   := TEnm_KorParamsTypeInfo( fmSetKorParams.rgrTypeKekvInfo.ItemIndex );
            end;
        end;

    finally
        FreeAndNil( fmSetKorParams );
    end;
end;

constructor TfmSetKorParams.Create(const aFMParams: TRec_FMParams;
  const aKorParamsInfo: TRec_KorParamsInfo);
begin
    inherited Create( aFMParams.Owner );

    //Учитываем предыдущие пользовательские настройки
    with aKorParamsInfo
    do begin
        cbxShowGrSmet.Checked       := GrSmet.Checked;
        rgrTypeGrSmetInfo.ItemIndex := Ord( GrSmet.TypeInfo );
        cbxShowSmet.Checked         := Smet.Checked;
        rgrTypeSmetInfo.ItemIndex   := Ord( Smet.TypeInfo );
        cbxShowRazd.Checked         := Razd.Checked;
        rgrTypeRazdInfo.ItemIndex   := Ord( Razd.TypeInfo );
        cbxShowStat.Checked         := Stat.Checked;
        rgrTypeStatInfo.ItemIndex   := Ord( Stat.TypeInfo );
        cbxShowKekv.Checked         := Kekv.Checked;
        rgrTypeKekvInfo.ItemIndex   := Ord( Kekv.TypeInfo );
    end;
end;

procedure TfmSetKorParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmSetKorParams.btnOKClick(Sender: TObject);
begin
    if     not cbxShowGrSmet.Checked
       AND not cbxShowSmet.Checked
       AND not cbxShowRazd.Checked
       AND not cbxShowStat.Checked
       AND not cbxShowKekv.Checked
    then begin
        ModalResult := mrNone;
        MessageBox( Handle, PChar( sInvalidParams ), PChar( sMsgCaptionWrnUA ), MB_OK or MB_ICONWARNING );
    end;
end;

procedure TfmSetKorParams.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
    case Msg.CharCode of

      VK_F10    : begin
                    btnOK.Click;
                  end;

      VK_ESCAPE : begin
                    btnCancel.Click;
                  end;
    end;
end;

end.
