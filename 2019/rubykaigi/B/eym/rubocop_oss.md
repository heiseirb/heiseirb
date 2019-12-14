# やったこと
以下のISSUEに取り組みました。PRは出せませんでしたが、調べたことを記載します！

## リンク
https://github.com/rspec/rspec-core/issues/2617

## 内容
> Subject of the issue
> The define_derived_metadata configuration option could be easier to find.
> 
> The Relish-published docs of rspec-core mention it once, when describing Aggregate Failures.
> 
> This Issue is a request for more findable documentation. I hope this is the right forum for such a request.
> 
> Steps to reproduce
> After I had solved my problem by web searching for things that sounded like it, I went to the relish site's search function. I pasted the correct term into the search box, and found next to nothing.
> 
> Expected behavior
> A findable story about define_derived_metadata exists.
> 
> Where I would look: I would look under Metadata, or Configuration, for a named section, about derived metadata.
> 
> Actual behavior
> A user can't learn about define_derived_metadata in that set of docs.
> 

## 日本語で
問題の主題
define_derived_metadata構成オプションは見つけやすいかもしれません。

rspec-coreのRelishで公開されているドキュメントでは、Aggregate Failuresについて説明する際に一度言及しています。

この問題は、より見つけやすいドキュメントのリクエストです。 これがそのようなリクエストにふさわしいフォーラムであることを願っています。

再現する手順
そのように聞こえるようなものをウェブ検索して問題を解決した後、私はレリッシュサイトの検索機能に行きました。 検索ボックスに正しい用語を貼り付けたところ、ほとんど何も見つかりませんでした。

予想される行動
define_derived_metadataに関する検索可能なストーリーが存在します。

私が見る場所：派生したメタデータについて、名前付きセクションの「メタデータ」または「構成」の下を調べます。

実際の動作
ユーザーは、そのドキュメントのセットではdefine_derived_metadataについて学ぶことができません。


### Rspecのドキュメント
define_derived_metadataについて、Metadata、またはConfigurationの下にドキュメントを追加して欲しいという意味（だと思いました）

https://relishapp.com/rspec/rspec-core/v/3-9/docs/configuration

### relish gem
https://github.com/cucumber-ltd/relish-gem

### ソース
https://github.com/rspec/rspec-core/blob/36fa69aaba90278e68c75da92101630856ef47e9/lib/rspec/core/configuration.rb#L1839

### 使い方
https://www.rubydoc.info/github/rspec/rspec-core/RSpec%2FCore%2FConfiguration:define_derived_metadata
```ruby
RSpec.configure do |config|
  # Tag all groups and examples in the spec/unit directory with
  # :type => :unit
  config.define_derived_metadata(:file_path => %r{/spec/unit/}) do |metadata|
    metadata[:type] = :unit
  end
end
```

### 小さいドキュメント
If you'd like to tackle this @olleolleolle that would be great! We do have some er minimal documentation here http://rspec.info/documentation/3.8/rspec-core/RSpec/Core/Configuration.html#define_derived_metadata-instance_method

### Qiita書いてくれてる人いた
https://qiita.com/chiastolite/items/0226cf7afeedaa68e5eb
https://qiita.com/hanachin_/items/e3ad66bbff4da97efafd

### features配下がドキュメントっぽい
https://github.com/rspec/rspec-core/tree/master/features
ref: https://github.com/rspec/rspec-core/pull/2629

- どうやらRspec3系から使えるらしい
- パスに応じて、metadetaを書き換えることができる。

### コントリビューション
https://github.com/rspec/rspec-core/blob/master/CONTRIBUTING.md

