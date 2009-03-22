require 'rake'
require 'spec/rake/verify_rcov'

RCov::VerifyTask.new(:verify_rcov => 'spec:rcov') do |t|
  t.require_exact_threshold = false
  t.threshold = 91
  t.index_html = "#{RAILS_ROOT}/coverage/index.html"
end
