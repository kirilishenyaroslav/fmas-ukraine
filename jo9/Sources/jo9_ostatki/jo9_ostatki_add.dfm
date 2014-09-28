object jo9_ostatki_add_Form: Tjo9_ostatki_add_Form
  Left = 262
  Top = 152
  Width = 585
  Height = 556
  Caption = 'jo9_ostatki_add_Form'
  Color = 16247513
  Constraints.MinHeight = 401
  Constraints.MinWidth = 583
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 518
    Align = alClient
    TabOrder = 0
    DesignSize = (
      569
      518)
    object Bevel1: TBevel
      Left = 16
      Top = 46
      Width = 545
      Height = 115
      Shape = bsFrame
    end
    object Label6: TLabel
      Left = 23
      Top = 51
      Width = 110
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 152
      Top = 51
      Width = 101
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 91
      Width = 58
      Height = 13
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 424
      Top = 51
      Width = 101
      Height = 13
      Caption = #1057#1091#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 288
      Top = 51
      Width = 107
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1091#1093#1091' '#1082#1086#1096#1090#1110#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MainPanel: TPanel
      Left = 8
      Top = 167
      Width = 561
      Height = 272
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 561
        Height = 26
        Align = dalTop
        BarManager = BarManager
        Color = 15451300
        ParentColor = False
        UseOwnColor = True
      end
      object Grid: TcxGrid
        Left = 0
        Top = 26
        Width = 561
        Height = 246
        Align = alClient
        TabOrder = 1
        object TableView: TcxGridTableView
          OnKeyDown = TableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Tip_Dog_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Summa_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = TableViewCustomDrawCell
          OnEditValueChanged = TableViewEditValueChanged
          OnFocusedItemChanged = TableViewFocusedItemChanged
          OnFocusedRecordChanged = TableViewFocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheet
          object id_Ost_Smet_Column: TcxGridColumn
            Visible = False
          end
          object id_Dog_Column: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            Options.Focusing = False
          end
          object Tip_Dog_Column: TcxGridColumn
            Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
            PropertiesClassName = 'TcxTextEditProperties'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Width = 70
          end
          object Reg_Num_Column: TcxGridColumn
            Caption = #1056#1077#1108#1089#1090#1088'. '#8470
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
                  BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                  2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
                  00FFB0857FC09F94C09F96BC988EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                  B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEA795FD
                  EEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFFFBEADDDCAE837FFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                  FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1A091FEE3ACF1
                  C491FCF2CAFFFFDDFFFFE4FFFFF7FFFFF7FFFFE9EEE5CBB9948CFF00FFFF00FF
                  FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                  E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFBC978CFBE7B7F4
                  C791F2C994F8E5B9FEFCD8FFFFDDFFFFDCFFFFE0E2D2BAB68E86FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                  C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB58D85E8
                  DEDDFFFEF2F9D8A3F4C48CF9D49FFDEAB8D0B49FB89086FF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                  86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFBA968ABB988CB79188FF00FFFF00FFFF00FFFF00FF}
                Kind = bkGlyph
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = Reg_Num_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 73
          end
          object Kod_Dog_Column: TcxGridColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
          end
          object Num_Sch_Column: TcxGridColumn
            Caption = #1056#1072#1093#1091#1085#1086#1082
            PropertiesClassName = 'TcxPopupEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.PopupAutoSize = False
            Properties.PopupControl = SchGrid
            Properties.PopupWidth = 380
            Properties.OnCloseUp = Num_Sch_ColumnPropertiesCloseUp
            Properties.OnPopup = Num_Sch_ColumnPropertiesPopup
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 63
          end
          object id_S_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_R_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_St_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object kod_S_Column: TcxGridColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = kod_S_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 68
          end
          object kod_R_Column: TcxGridColumn
            Caption = #1056#1086#1079#1076#1110#1083
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 57
          end
          object kod_St_Column: TcxGridColumn
            Caption = #1057#1090#1072#1090#1090#1103
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 53
          end
          object kod_Kekv_Column: TcxGridColumn
            Caption = #1050#1045#1050#1042
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = True
            Properties.OnButtonClick = kod_Kekv_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 56
          end
          object Summa_Column: TcxGridColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 89
          end
          object Name_S_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_R_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_St_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object id_Sch_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object Name_Sch_Column: TcxGridColumn
            Visible = False
            Options.Focusing = False
          end
          object State_Column: TcxGridColumn
            Visible = False
          end
          object Can_Edit_Column: TcxGridColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Visible = False
          end
          object Edited_Column: TcxGridColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            HeaderGlyph.Data = {
              F6060000424DF606000000000000360000002800000018000000180000000100
              180000000000C006000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000008E00038906028403
              008A000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000A1000A
              9E1615B12C14AF2906910B009300000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000A5000CA41A18B23015AE2912AB2614B02906910C00950000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000AB000DA71D1BB53716AF2E15AE2C14AD2A14AD2713B0280690
              0C00950000000000000000000000000000000000000000000000000000000000
              000000000000000000000000AF0010AB221DB63C19B23518B13217B02F11AD2A
              11AD2713AC2815B02A06920C0095000000000000000000000000000000000000
              0000000000000000000000000000000000B80111B02520B9421DB6391CB53719
              B3361EB63A5ACA703FBE540EAD2513AC2915B12C07930E009400000000000000
              00000000000000000000000000000000000000000006B11220B73722BC4520B9
              401DB63D1DB63C19B83A0094010083005CCC704DC4600CAC2514AE2915B12B07
              930D0096000000000000000000000000000000000000000000000000000CAB21
              5FD07D1BB94220B94220B9421CBB40009B00816352BB7C82008A0059CA6D4DC4
              600CAB2514AD2A16B22C07940F00940000000000000000000000000000000000
              00000000000AA81D6FD48934C1561EBB421EBE43009F00846855C5858FC0848B
              B88282008B0059C96D4EC4620EAD2614AD2B16B22E07960E0097000000000000
              0000000000000000000000000012C0250FB02661CE7753D17300A610896B5BCA
              8A93BE898ABC8989C4898FBF8889008B0057C96C4EC4630EAD2715AF2B16B22F
              08971000970000000000000000000000000000000000000012C42700B614288C
              23906E61CD8E96C38E8FC28F8FC28F8FC28E8FC88D92C18C8D008C0056C96A4D
              C3610EAC2715AE2C17B32E089711009500000000000000000000000000000000
              000000AE5D6DAD6874CD9398C79394C89595CA9797CE9B9BDCB6B6D0A3A3CD91
              96C68F90008D0054C86A4DC5630FAE2815AE2D17B33008971100980000000000
              0000000000000000B97B7BAA7676CA9797CA9797CA9797CD9A9AD6A3A3A37070
              925E5EDFC1C1D7ADAED09499C99192008C0053C8684EC5640FAE2916B02D17B4
              3205910B008B00000000000000000000AF7474DAB2B2C99595CD9A9AD29F9FDA
              A7A7AB76769E6262995F5F975F5FE3C4C4D9AEAFD2969BCA9393008E0053C868
              4FC5660EAE2818B53306950C009900000000000000000000B07575D5B2B2D5A7
              A7D39F9FDDA9A9AF7B7BAF7575000000000000A56A6A996363E7C6C6DAAEAED2
              969BC89393008E004AC76266D37E0EA722009600000000000000000000000000
              CB7E7EA77171D7B2B2EAC4C4B58181B77A7A000000000000000000000000AD6B
              6B9A6565E8C7C7D9AEAED1959AC59190148F0E009200157D0800940000000000
              0000000000000000000000B27F7FB57878B37979C08282000000000000000000
              000000000000000000B172729F6868E5C7C7D6ABACCB9295D48F9CD38A9AA55C
              6BA95C6A00000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000AF7373A16A6AE4C4C4D3A7A7
              C48F8FBF8C8CBD8A8A996666A163630000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000000000B6
              7474A26D6DE1C2C2CFA3A3BF8A8ABA8787B88585936060000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              00000000000000000000B47777A56E6EDFBEBEC99D9DBA8484B8858599646400
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000000000B77B7BA67070D9B9B9D1AB
              ABAD7878A66E6E00000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              AF7A7AA26C6CA36F6FAC73730000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            MinWidth = 30
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.HorzSizing = False
            Width = 30
          end
          object Name_Shablon_Column: TcxGridColumn
            Visible = False
          end
          object id_Kekv_Column: TcxGridColumn
            Visible = False
          end
          object Name_Kekv_Column: TcxGridColumn
            Visible = False
          end
          object id_CustomerColumn: TcxGridColumn
            Visible = False
          end
        end
        object GridLevel: TcxGridLevel
          GridView = TableView
        end
      end
    end
    object NumDoc: TcxTextEdit
      Left = 23
      Top = 64
      Width = 122
      Height = 21
      Properties.MaxLength = 120
      Properties.ReadOnly = False
      Style.Color = 16247513
      TabOrder = 1
      OnKeyPress = NumDocKeyPress
    end
    object DateDoc: TcxDateEdit
      Left = 151
      Top = 64
      Width = 130
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = 16247513
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 2
      OnKeyPress = DateDocKeyPress
    end
    object NoteMemo: TcxMemo
      Left = 24
      Top = 104
      Width = 529
      Height = 49
      Properties.MaxLength = 255
      Properties.ReadOnly = False
      Properties.ScrollBars = ssVertical
      Style.Color = 16247513
      TabOrder = 3
      OnKeyPress = NoteMemoKeyPress
    end
    object Panel2: TPanel
      Left = 1
      Top = 445
      Width = 567
      Height = 72
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      DesignSize = (
        567
        72)
      object St_Label: TLabel
        Left = 64
        Top = 41
        Width = 329
        Height = 13
        AutoSize = False
        Caption = 'St_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label17: TLabel
        Left = 25
        Top = 41
        Width = 37
        Height = 13
        Caption = #1057#1090#1072#1090#1090#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 26
        Top = 29
        Width = 36
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object R_Label: TLabel
        Left = 64
        Top = 29
        Width = 329
        Height = 13
        AutoSize = False
        Caption = 'R_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object S_Label: TLabel
        Left = 64
        Top = 17
        Width = 329
        Height = 13
        AutoSize = False
        Caption = 'S_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label15: TLabel
        Left = 9
        Top = 17
        Width = 53
        Height = 13
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 18
        Top = 4
        Width = 44
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1086#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Sch_Label: TLabel
        Left = 64
        Top = 4
        Width = 329
        Height = 13
        AutoSize = False
        Caption = 'Sch_Label'
        ParentShowHint = False
        ShowHint = True
      end
      object Label7: TLabel
        Left = 31
        Top = 55
        Width = 31
        Height = 13
        Caption = #1050#1045#1050#1042':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Kekv_Label: TLabel
        Left = 64
        Top = 55
        Width = 489
        Height = 13
        AutoSize = False
        Caption = 'Kekv_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object ApplyButton: TcxButton
        Left = 396
        Top = 25
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1080#1081#1085#1103#1090#1080
        TabOrder = 0
        OnClick = ApplyButtonClick
      end
      object CancelButton: TcxButton
        Left = 478
        Top = 25
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
        TabOrder = 1
        OnClick = CancelButtonClick
      end
    end
    object SchGrid: TcxGrid
      Left = -144
      Top = 200
      Width = 380
      Height = 200
      TabOrder = 5
      Visible = False
      object SchTableView: TcxGridTableView
        OnDblClick = SchTableViewDblClick
        OnKeyPress = SchTableViewKeyPress
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = Num_Sch_Column2
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheet
        object id_Sch_Column2: TcxGridColumn
          Visible = False
        end
        object Num_Sch_Column2: TcxGridColumn
          Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 90
        end
        object Name_Sch_Column2: TcxGridColumn
          Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 285
        end
      end
      object SchGridLevel: TcxGridLevel
        GridView = SchTableView
      end
    end
    object RadioGroup: TcxRadioGroup
      Left = 16
      Top = 8
      Width = 545
      Height = 33
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1044#1077#1073#1077#1090#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1091' '#1079#1072#1083#1080#1096#1082#1072#1093
        end
        item
          Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1091' '#1079#1072#1083#1080#1096#1082#1072#1093
        end>
      TabOrder = 6
      Caption = #1044#1086#1076#1072#1090#1080':'
    end
    object DateMove: TcxDateEdit
      Left = 288
      Top = 64
      Width = 130
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = 16247513
      Style.ButtonTransparency = ebtHideUnselected
      TabOrder = 7
      OnKeyPress = DateMoveKeyPress
    end
    object SumDoc: TcxCurrencyEdit
      Left = 424
      Top = 64
      Width = 129
      Height = 21
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.Nullable = False
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = 16247513
      TabOrder = 8
      OnKeyPress = SumDocKeyPress
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 152
    Top = 414
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheet: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      Styles.BandBackground = cxStyle15
      Styles.BandHeader = cxStyle23
      BuiltIn = True
    end
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'ToolBar'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 88
        ItemLinks = <
          item
            Item = AddDog
            Visible = True
          end
          item
            Item = CloneButton
            Visible = True
          end
          item
            Item = DelDog
            Visible = True
          end>
        Name = 'ToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 312
    Top = 416
    DockControlHeights = (
      0
      0
      0
      0)
    object AddDog: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDD
        C19CD7B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F2E4D7E4D2C0004B0000
        4B00004B00A28C72C4A883DBB78AE5BD87EFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
        88F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFF004B00004B00004B0016
        AC2D004B00004B00004B00A89275D7B88FF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
        9AF6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFF004B00004B00004B002E
        D55A004B00004B00004B00E1C9AAEED3ADEBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFF004B0000
        4B00004B00E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      ShortCut = 45
      OnClick = AddDogClick
    end
    object CloneButton: TdxBarButton
      Caption = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      Category = 0
      Hint = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FF200377
        171368B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FF20037F2115C41C29A3202072F7E3C5F6DFBCF5DBB4F3
        D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FF200381A43EFB
        0220D52336B01F1F71F5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
        97F3D199B78183FF00FFFF00FF2003778A8CD0021FD32334AF1F1F71F5DFC3F3
        DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
        19186CA4B0F2021FD12334AF1F1F71F5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
        99F3D198B78183FF00FFFF00FFFF00FFCEB2AA202276A2ACEF021FD12334AC1F
        1F71F5DFC2F4DBBBF1D7B2F1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        D3B7AFFFFFFD1F2175A2ACEE021FD02333AC1F1F71F5DFC2F4DBBAF2D7B1F0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFD7BBB2FFFFFFFEF9F51F2175A2ACEE02
        1FD02332AD1F1F71F5DEC2F4DBBAF2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        DABEB3FFFFFFFFFEFDFDF8F41F2175A1ACEE0111A01F479F1F6FB9F6DEC1F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDEC1B5FFFFFFFFFFFFFFFEFDFEF9F41F
        21751F5EB000C5FE1F9BCE1F8DBEF7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        E2C5B52091C5FFFFFF2091C5FFFEFDFDF9F41F94D81F9CD11FCAFA208FC1E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE5C7B72091C52091C52091C5FFFFFFFF
        FEFDFDF8F32090C31E8DC0C6A194B59489B08F81B78183FF00FFFF00FFFF00FF
        1D8ABC20C3FC00BDFF20BBF42091C5FFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
        70ECA54AC58768FF00FFFF00FF2071C51E8BBD2091C500ADEE2096CB2091C520
        91C5FFFFFFFFFFFFE4D4D2C89A7FFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EACAB62090C420B6EF1F90C4FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFE9C6B1EBCCB81D8ABCEBCCB8EBCBB8EA
        CBB8EACBB8EACCB9DABBB0B8857AFF00FFFF00FFFF00FFFF00FF}
      ShortCut = 16429
      OnClick = CloneButtonClick
    end
    object DelDog: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelDogClick
    end
    object dxBarButton1: TdxBarButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
    end
  end
  object DataSet: TpFIBDataSet
    Database = jo9_ostatki_Form.Database
    Transaction = jo9_ostatki_Form.ReadTransaction
    UpdateTransaction = jo9_ostatki_Form.WriteTransaction
    Left = 184
    Top = 416
    poSQLINT64ToBCD = True
  end
  object ActionList: TActionList
    Left = 216
    Top = 416
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 16419
      OnExecute = Action2Execute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
  object StoredProc: TpFIBStoredProc
    Database = jo9_ostatki_Form.Database
    Transaction = jo9_ostatki_Form.WriteTransaction
    Left = 256
    Top = 416
  end
end
